Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:47270 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752331AbaHMAWr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Aug 2014 20:22:47 -0400
Received: by mail-ig0-f180.google.com with SMTP id l13so141566iga.7
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Aug 2014 17:22:46 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 12 Aug 2014 17:22:46 -0700
Message-ID: <CA+r1Zhg5=9Ff90Ur0Bfgrc3eCr404Ym_amn-0SDpnndYSHV++w@mail.gmail.com>
Subject: Problem building 3.16 with make O=...
From: Jim Davis <jim.epost@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

I'm trying to build 3.16 on my Ubuntu 14.04 system, starting with the
stock kernel config file.  This works just fine:

make distclean && git clean -fdx
git describe (and check that it is indeed v3.16)
make mrproper (just in case)
cp /boot/config*24-generic .config
yes "" | make oldconfig >/dev/null
make

But changing that recipe to

yes "" | make O=/tmp/$$ oldconfig >/dev/null
make O=/tmp/$$

fails with

make[1]: Entering directory `/tmp/29520'
  GEN     ./Makefile
scripts/kconfig/conf --silentoldconfig Kconfig
  SYSTBL  arch/x86/syscalls/../include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/syscalls/../include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/syscalls/../include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/syscalls/../include/generated/asm/syscalls_64.h
  SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_x32.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTLD  arch/x86/tools/relocs
  CHK     include/config/kernel.release
  UPD     include/config/kernel.release
  Using /home/jim/linux-rc as source for kernel
  /home/jim/linux-rc is not clean, please run 'make mrproper'
  in the '/home/jim/linux-rc' directory.
make[1]: *** [prepare3] Error 1
make: *** [sub-make] Error 2

What am I missing?
