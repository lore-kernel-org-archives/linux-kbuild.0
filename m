Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:43861 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752646AbZJYDiL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 24 Oct 2009 23:38:11 -0400
Received: by bwz27 with SMTP id 27so1525056bwz.21
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2009 20:38:15 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 24 Oct 2009 23:38:14 -0400
Message-ID: <55e03a0a0910242038x5656e9c0ve28bb28023dc1432@mail.gmail.com>
Subject: Compiling 2.6.31/31.5
From: MySQL Student <mysqlstudent@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I'm having difficulty compiling 2.6.31 and 2.6.31.5 on x86 with
gcc-3.4.4 and binutils-2.20.51.0.2:

  AS      arch/x86/lib/thunk_32.o
  CC      arch/x86/lib/usercopy_32.o
  AR      arch/x86/lib/lib.a
  LD      vmlinux.o
  MODPOST vmlinux.o
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
drivers/built-in.o: In function `con_init':
vt.c:(.init.text+0x3c5b): undefined reference to `.L1446'
make: *** [.tmp_vmlinux1] Error 1

This is built from "make defconfig".

I've seen a few references to this searching, but all the solutions
didn't apply or didn't work. What could I be doing wrong? Could this
be a problem with my development tools?

Thanks,
Alex
