Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729138AbgFISqn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 14:46:43 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E876C03E97C
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2020 11:46:43 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x11so8378895plv.9
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2020 11:46:43 -0700 (PDT)
Date: Tue, 9 Jun 2020 11:46:40 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 2/5] gcc-plugins/stackleak: Use asm instrumentation to
 avoid useless register saving
Message-ID: <202006091143.AD1A662@keescook>
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-3-alex.popov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604134957.505389-3-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Popov <alex.popov@linux.com>
Cc: Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org

On Thu, Jun 04, 2020 at 04:49:54PM +0300, Alexander Popov wrote:
> Let's improve the instrumentation to avoid this:
> 
> 1. Make stackleak_track_stack() save all register that it works with.
> Use no_caller_saved_registers attribute for that function. This attribute
> is available for x86_64 and i386 starting from gcc-7.
> 
> 2. Insert calling stackleak_track_stack() in asm:
>   asm volatile("call stackleak_track_stack" :: "r" (current_stack_pointer))
> Here we use ASM_CALL_CONSTRAINT trick from arch/x86/include/asm/asm.h.
> The input constraint is taken into account during gcc shrink-wrapping
> optimization. It is needed to be sure that stackleak_track_stack() call is
> inserted after the prologue of the containing function, when the stack
> frame is prepared.

Very cool; nice work!

> +static void add_stack_tracking(gimple_stmt_iterator *gsi)
> +{
> +	/*
> +	 * The 'no_caller_saved_registers' attribute is used for
> +	 * stackleak_track_stack(). If the compiler supports this attribute for
> +	 * the target arch, we can add calling stackleak_track_stack() in asm.
> +	 * That improves performance: we avoid useless operations with the
> +	 * caller-saved registers in the functions from which we will remove
> +	 * stackleak_track_stack() call during the stackleak_cleanup pass.
> +	 */
> +	if (lookup_attribute_spec(get_identifier("no_caller_saved_registers")))
> +		add_stack_tracking_gasm(gsi);
> +	else
> +		add_stack_tracking_gcall(gsi);
> +}

The build_for_x86 flag is only ever used as an assert() test against
no_caller_saved_registers, but we're able to test for that separately.
Why does the architecture need to be tested? (i.e. when this flag
becomes supported o other architectures, why must it still be x86-only?)

-- 
Kees Cook
