Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:43043 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751800AbYF3QM4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jun 2008 12:12:56 -0400
Date: Mon, 30 Jun 2008 18:13:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: sed & bzImage issues
Message-ID: <20080630161342.GB20736@uranus.ravnborg.org>
References: <19f34abd0806300638pa3770e6xf482ccadd01dcc17@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19f34abd0806300638pa3770e6xf482ccadd01dcc17@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Jun 30, 2008 at 03:38:28PM +0200, Vegard Nossum wrote:
> Hello,
> 
> I just experienced two issues which seem related to kbuild:
> 
> 1. A 'sed' error (but I've seen it before and it doesn't really matter):
> 
>   Using xxx/linux-2.6 as source for kernel
>   CALL    xxx/linux-2.6/scripts/checksyscalls.sh
> sed: -e expression #1, char 154: Unknown option to 's'

It would be nice to have it fixed (I do not see it here).

> 
> 2. A vanishing bzImage. kbuild claims successful building, but the
> file isn't there:
> 
>   Building modules, stage 2.
>   MODPOST 1 modules
> Kernel: arch/x86/boot/bzImage is ready  (#1)
> 
> xxx@yyy ~/git-working/linux-2.6 $ ls arch/x86/boot/
> Makefile     cpu.c       mtools.conf.in  vesa.h
> a20.c        cpucheck.c  pm.c            video-bios.c
> apm.c        edd.c       pmjump.S        video-mode.c
> bitops.h     header.S    printf.c        video-vesa.c
> boot.h       install.sh  setup.ld        video-vga.c
> cmdline.c    main.c      string.c        video.c
> code16gcc.h  mca.c       tools           video.h
> compressed   memory.c    tty.c           voyager.c
> copy.S       mkcpustr.c  version.c

Above I do not see any generated files.
Dod you happen to use make O=... so output files
are somewhere else and the path in the printout is
just from another base directory?

	Sam
