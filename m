Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet14.oracle.com ([148.87.113.126]:61985 "EHLO
	rgminet14.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752476AbZAMDR1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Jan 2009 22:17:27 -0500
Message-ID: <496C06D0.3060903@oracle.com>
Date: Tue, 13 Jan 2009 11:13:20 +0800
From: Wenji Huang <wenji.huang@oracle.com>
Reply-To: wenji.huang@oracle.com
MIME-Version: 1.0
Subject: Re: [PATCH] Kbuild: generate debug info in building
References: <4922238C.40807@oracle.com> <20081122114329.GB24848@uranus.ravnborg.org>
In-Reply-To: <20081122114329.GB24848@uranus.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

Hi,
I got the following building error for 2.6.29-rc1.

# make
   CHK     include/linux/version.h
   CHK     include/linux/utsrelease.h
   SYMLINK include/asm -> include/asm-x86
   CALL    scripts/checksyscalls.sh
   CHK     include/linux/compile.h
   IHEX    firmware/e100/d101m_ucode.bin
   AS      firmware/e100/d101m_ucode.bin.gen.o
   IHEX    firmware/e100/d101s_ucode.bin
   AS      firmware/e100/d101s_ucode.bin.gen.o
   IHEX    firmware/e100/d102e_ucode.bin
   AS      firmware/e100/d102e_ucode.bin.gen.o
   LD      firmware/built-in.o
   LD      vmlinux.o
   MODPOST vmlinux.o
   GEN     .version
   CHK     include/linux/compile.h
   UPD     include/linux/compile.h
   CC      init/version.o
   LD      init/built-in.o
   LD      .tmp_vmlinux1
   STRIP   .tmp_vmlinux1.stripped
objcopy: unrecognized option `--strip-unneeded-symbols'

# objcopy --version
GNU objcopy 2.15.92.0.2 20040927
Copyright 2004 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms 
of the GNU General Public License.  This program has absolutely no warranty.


The option --strip-unneeded-symbols is only available on higher version, 
but not exists on binutils-2.15.

Seems to keep Makefile compatible on all kinds of circumstances. Like,

quiet_cmd_kstrip = STRIP   $@
       cmd_kstrip = $(OBJCOPY) --wildcard $(addprefix --strip-symbols 
,$(filter %/scripts/strip-symbols,$^)) $< $@


Regards,
Wenji
