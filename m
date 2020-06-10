Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbgFJUEc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jun 2020 16:04:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E72C03E96B
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2020 13:04:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 23so1571183pfw.10
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2020 13:04:32 -0700 (PDT)
Date: Wed, 10 Jun 2020 13:04:29 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 3/5] gcc-plugins/stackleak: Add 'verbose' plugin parameter
Message-ID: <202006101303.71B51BF1@keescook>
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-4-alex.popov@linux.com>
 <202006091147.193047096C@keescook>
 <fb051386-4913-9442-f051-23ed25802c9e@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb051386-4913-9442-f051-23ed25802c9e@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Popov <alex.popov@linux.com>
Cc: Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org

On Wed, Jun 10, 2020 at 06:52:10PM +0300, Alexander Popov wrote:
> On 09.06.2020 21:47, Kees Cook wrote:
> > On Thu, Jun 04, 2020 at 04:49:55PM +0300, Alexander Popov wrote:
> >> Add 'verbose' plugin parameter for stackleak gcc plugin.
> >> It can be used for printing additional info about the kernel code
> >> instrumentation.
> >>
> >> For using it add the following to scripts/Makefile.gcc-plugins:
> >>   gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK) \
> >>     += -fplugin-arg-stackleak_plugin-verbose
> >>
> >> Signed-off-by: Alexander Popov <alex.popov@linux.com>
> > 
> > Acked-by: Kees Cook <keescook@chromium.org>
> 
> I see that I will change this patch after leaving alloca() support.
> I'm going to add debug printing about functions that call alloca().
> I have to omit your 'acked-by' for the changed patch, right?

If it changes dramatically, drop my Ack, yes. But since it's going via
my tree, my Ack is mostly just a quick email marker to say "yes, looks
good". :)

-- 
Kees Cook
