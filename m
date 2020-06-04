Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbgFDOCA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 10:02:00 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036D8C08C5C0
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 07:02:00 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z206so3667087lfc.6
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 07:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200604134957.505389-1-alex.popov@linux.com> <20200604134957.505389-2-alex.popov@linux.com>
In-Reply-To: <20200604134957.505389-2-alex.popov@linux.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 4 Jun 2020 16:01:30 +0200
Message-ID: <CAG48ez05JOvqzYGr3PvyQGwFURspFWvNvf-b8Y613PX0biug8w@mail.gmail.com>
Subject: Re: [PATCH 1/5] gcc-plugins/stackleak: Exclude alloca() from the
 instrumentation logic
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Popov <alex.popov@linux.com>, Kees Cook <keescook@chromium.org>, Elena Reshetova <elena.reshetova@intel.com>
Cc: Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, linux-kbuild@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, kernel list <linux-kernel@vger.kernel.org>, gcc@gcc.gnu.org, notify@kernel.org

On Thu, Jun 4, 2020 at 3:51 PM Alexander Popov <alex.popov@linux.com> wrote:
> Some time ago Variable Length Arrays (VLA) were removed from the kernel.
> The kernel is built with '-Wvla'. Let's exclude alloca() from the
> instrumentation logic and make it simpler. The build-time assertion
> against alloca() is added instead.
[...]
> +                       /* Variable Length Arrays are forbidden in the kernel */
> +                       gcc_assert(!is_alloca(stmt));

There is a patch series from Elena and Kees on the kernel-hardening
list that deliberately uses __builtin_alloca() in the syscall entry
path to randomize the stack pointer per-syscall - see
<https://lore.kernel.org/kernel-hardening/20200406231606.37619-4-keescook@chromium.org/>.
