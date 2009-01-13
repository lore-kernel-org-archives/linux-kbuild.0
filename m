Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:21889 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754714AbZAMGHs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Jan 2009 01:07:48 -0500
Message-ID: <496C2EE1.5080303@oracle.com>
Date: Tue, 13 Jan 2009 14:04:17 +0800
From: Wenji Huang <wenji.huang@oracle.com>
Reply-To: wenji.huang@oracle.com
MIME-Version: 1.0
Subject: Re: Building error of 2.6.29-rc1 using old binutils
References: <4922238C.40807@oracle.com> <20081122114329.GB24848@uranus.ravnborg.org> <496C06D0.3060903@oracle.com> <496C091E.1000003@oracle.com>
In-Reply-To: <496C091E.1000003@oracle.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

Wenji Huang wrote:
> Hi,
> 
> Sorry, resend it in terms of correct subject.
> 
> I got the following building error for 2.6.29-rc1.
> # make
>   CHK     include/linux/version.h
>   CHK     include/linux/utsrelease.h
>   SYMLINK include/asm -> include/asm-x86
>   CALL    scripts/checksyscalls.sh
>   CHK     include/linux/compile.h
>   IHEX    firmware/e100/d101m_ucode.bin
>   AS      firmware/e100/d101m_ucode.bin.gen.o
>   IHEX    firmware/e100/d101s_ucode.bin
>   AS      firmware/e100/d101s_ucode.bin.gen.o
>   IHEX    firmware/e100/d102e_ucode.bin
>   AS      firmware/e100/d102e_ucode.bin.gen.o
>   LD      firmware/built-in.o
>   LD      vmlinux.o
>   MODPOST vmlinux.o
>   GEN     .version
>   CHK     include/linux/compile.h
>   UPD     include/linux/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
>   STRIP   .tmp_vmlinux1.stripped
> objcopy: unrecognized option `--strip-unneeded-symbols'
> 
> # objcopy --version
> GNU objcopy 2.15.92.0.2 20040927
> Copyright 2004 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms 
> of the GNU General Public License.  This program has absolutely no 
> warranty.
> 
> 
> The option --strip-unneeded-symbols is only available on higher version, 
> but not exists on binutils-2.15.
> 
> Seems to keep Makefile compatible on all kinds of circumstances. Like,
> 
> quiet_cmd_kstrip = STRIP   $@
>       cmd_kstrip = $(OBJCOPY) --wildcard $(addprefix --strip-symbols 
> ,$(filter %/scripts/strip-symbols,$^)) $< $@
> 
> 
> Regards,
> Wenji
> 
When I upgraded binutils to 2.18 and enabled CONFIG_RELOCATABLE, there 
are still mismatched symbols between kernel and debuginfo.

For example, to verify buildid (bytes from __start_notes to 
__stop_notes) will get failed. The __stop_notes of running kernel 
doesn't match the one in debuginfo.

$ uname -r
2.6.29-rc1
$ cat /proc/kallsyms |grep __stop_notes
c0543610 T __stop_notes
$ readelf -s /lib/modules/2.6.29-rc1/build/vmlinux |grep __stop_notes
  48985: c1343610     0 NOTYPE  GLOBAL DEFAULT    5 __stop_notes
$ cat /lib/modules/2.6.29-rc1/build/.config|grep CONFIG_RELOCATABLE
CONFIG_RELOCATABLE=y
$ gcc -v
Reading specs from /usr/lib/gcc/i386-redhat-linux/3.4.6/specs
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man 
--infodir=/usr/share/info --enable-shared --enable-threads=posix 
--disable-checking --with-system-zlib --enable-__cxa_atexit 
--disable-libunwind-exceptions --enable-java-awt=gtk 
--host=i386-redhat-linux
Thread model: posix
gcc version 3.4.6 20060404 (Red Hat 3.4.6-9.0.1)
$ ld -v
GNU ld (GNU Binutils) 2.18
$ objcopy --version
GNU objcopy (GNU Binutils) 2.18
Copyright 2007 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms 
of the GNU General Public License version 3 or (at your option) any 
later version.
This program has absolutely no warranty.

Regards,
Wenji
