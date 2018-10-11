Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:57948 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbeJKQTA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Oct 2018 12:19:00 -0400
Date: Thu, 11 Oct 2018 10:52:34 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] kbuild: Fail the build early when no lz4 present
Message-ID: <20181011085234.GA25435@zn.tnic>
References: <20181010222333.17794-1-bp@alien8.de>
 <CAK7LNAT2KpYkn=hj=h1XmbMJRdtgCQ__xP0X+Rpwm3e_Xs1brQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAT2KpYkn=hj=h1XmbMJRdtgCQ__xP0X+Rpwm3e_Xs1brQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Oct 11, 2018 at 01:26:23PM +0900, Masahiro Yamada wrote:
> So, the cause of the failure is clear enough
> from the build log.

Sure but it wasts unnecessary build cycles and appears only after all
the compilation units have been produced.

> It is weird to check only lz4c.
> If CONFIG_KERNEL_LZO is enabled, but lzop is not installed,
> I see this log
> 
>   LZO     arch/x86/boot/compressed/vmlinux.bin.lzo
> /bin/sh: 1: lzop: not found
> 
> It is still clear what to do, though.

Right, we should test for that too. Unless distros start installing it
by default. It is not installed by default on a debian guest here, at
least.

SLES15 either:

$ lzop
If 'lzop' is not a typo you can use command-not-found to lookup the package that contains it, like this:
    cnf lzop

> Is it necessary to check this earlier?

Yes, see above.

> If you get this error, you just need to install the tool.
> Then, you can re-run the incremental build.

Actually, I'd prefer the build to fail early so that machine can
continue with the next build.

> BTW, this patch has a drawback.
> 
> [1] Enable CONFIG_KERNEL_LZ4 on the system
>     without lz4c installed
> 
> [2] Run 'make' and you will get the error
>     "lz4 tool not found on this system but CONFIG_KERNEL_LZ4 enabled"
> 
> [3] Run 'make menuconfig' and
>     switch from CONFIG_KERNEL_LZ4 to CONFIG_KERNEL_GZIP
> 
> [4] Run 'make' and you will still get the same error
>     even after you have chosen to use GZIP instead of LZ4.

Well, there's code in Makefile to refresh include/config/auto.conf but
for whatever reason that make in step 4 doesn't run it.

And *that* looks like a bug - if a user runs "make menuconfig" and
.config gets updated, then include/config/auto.conf better get updated
too. Right?

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
