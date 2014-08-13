Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:60263 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbaHMFFz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Aug 2014 01:05:55 -0400
Date: Wed, 13 Aug 2014 07:05:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Problem building 3.16 with make O=...
Message-ID: <20140813050549.GA30459@ravnborg.org>
References: <CA+r1Zhg5=9Ff90Ur0Bfgrc3eCr404Ym_amn-0SDpnndYSHV++w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+r1Zhg5=9Ff90Ur0Bfgrc3eCr404Ym_amn-0SDpnndYSHV++w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, Aug 12, 2014 at 05:22:46PM -0700, Jim Davis wrote:
> I'm trying to build 3.16 on my Ubuntu 14.04 system, starting with the
> stock kernel config file.  This works just fine:
> 
> make distclean && git clean -fdx
> git describe (and check that it is indeed v3.16)
> make mrproper (just in case)
> cp /boot/config*24-generic .config
> yes "" | make oldconfig >/dev/null
> make
> 
> But changing that recipe to
> 
> yes "" | make O=/tmp/$$ oldconfig >/dev/null
> make O=/tmp/$$
> 
> fails with
> 
> make[1]: Entering directory `/tmp/29520'
>   GEN     ./Makefile
> scripts/kconfig/conf --silentoldconfig Kconfig
>   SYSTBL  arch/x86/syscalls/../include/generated/asm/syscalls_32.h
>   SYSHDR  arch/x86/syscalls/../include/generated/asm/unistd_32_ia32.h
>   SYSHDR  arch/x86/syscalls/../include/generated/asm/unistd_64_x32.h
>   SYSTBL  arch/x86/syscalls/../include/generated/asm/syscalls_64.h
>   SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_32.h
>   SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_64.h
>   SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_x32.h
>   HOSTCC  arch/x86/tools/relocs_32.o
>   HOSTCC  arch/x86/tools/relocs_64.o
>   HOSTCC  arch/x86/tools/relocs_common.o
>   HOSTLD  arch/x86/tools/relocs
>   CHK     include/config/kernel.release
>   UPD     include/config/kernel.release
>   Using /home/jim/linux-rc as source for kernel
>   /home/jim/linux-rc is not clean, please run 'make mrproper'
>   in the '/home/jim/linux-rc' directory.
> make[1]: *** [prepare3] Error 1
> make: *** [sub-make] Error 2
> 
> What am I missing?
You need to copy the config to the output directory - not the source directory.
Change this line:
    cp /boot/config*24-generic .config
to something like this:
    cp /boot/config*24-generic /tmp/$$/.config

Should do the trick.
Make sure the dir exist before you copy.

	Sam
