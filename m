Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.171]:55148 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856AbYF3Ni3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jun 2008 09:38:29 -0400
Received: by wf-out-1314.google.com with SMTP id 27so1553188wfd.4
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2008 06:38:28 -0700 (PDT)
Message-ID: <19f34abd0806300638pa3770e6xf482ccadd01dcc17@mail.gmail.com>
Date: Mon, 30 Jun 2008 15:38:28 +0200
From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: sed & bzImage issues
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>

Hello,

I just experienced two issues which seem related to kbuild:

1. A 'sed' error (but I've seen it before and it doesn't really matter):

  Using xxx/linux-2.6 as source for kernel
  CALL    xxx/linux-2.6/scripts/checksyscalls.sh
sed: -e expression #1, char 154: Unknown option to 's'

2. A vanishing bzImage. kbuild claims successful building, but the
file isn't there:

  Building modules, stage 2.
  MODPOST 1 modules
Kernel: arch/x86/boot/bzImage is ready  (#1)

xxx@yyy ~/git-working/linux-2.6 $ ls arch/x86/boot/
Makefile     cpu.c       mtools.conf.in  vesa.h
a20.c        cpucheck.c  pm.c            video-bios.c
apm.c        edd.c       pmjump.S        video-mode.c
bitops.h     header.S    printf.c        video-vesa.c
boot.h       install.sh  setup.ld        video-vga.c
cmdline.c    main.c      string.c        video.c
code16gcc.h  mca.c       tools           video.h
compressed   memory.c    tty.c           voyager.c
copy.S       mkcpustr.c  version.c

I might add that my home directory resides on an NFS server. Is this a
known error, perhaps something wrong with NFS? (Did an error happen,
or was the error undetectable?)

Running 'touch arch/x86/boot/bzImage' does really create the file.

I've compiled on this machine before (with the same NFS home dir) and
it worked perfectly. So I don't know why it happened now. But it would
be nice to know if anybody has a clue :-)


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
