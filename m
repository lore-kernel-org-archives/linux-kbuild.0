Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:39050 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751170Ab1BQWcA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Feb 2011 17:32:00 -0500
Message-ID: <4D5DA1DC.4040902@suse.cz>
Date: Thu, 17 Feb 2011 23:31:56 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Misbehaviour with "make foo.ko"
References: <20110217164945.1cf0b31e@lxorguk.ukuu.org.uk>
In-Reply-To: <20110217164945.1cf0b31e@lxorguk.ukuu.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kbuild@vger.kernel.org

On 17.2.2011 17:49, Alan Cox wrote:
> Trying to rebuild single modules gets into a mess
> 
> [alan@pyx linux-psbdev]$ make drivers/staging/mrst/pvr/psb_gfx.ko
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CC [M]  drivers/staging/mrst/pvr/../drv/psb_fb.o
>   CC [M]  drivers/staging/mrst/pvr/../drv/psb_intel_lvds.o
>   LD [M]  drivers/staging/mrst/pvr/psb_gfx.o
>   MODPOST 1 modules
> ERROR: "ttm_object_device_release" [drivers/staging/mrst/pvr/psb_gfx.ko]
> undefined!
> ERROR ...

It works fine here with 2.6.38-rc5 and ext3.ko:

$ touch fs/ext3/namei.c
$ make O=/dev/shm/build fs/ext3/ext3.ko
  Using /labs/mmarek/linux-2.6 as source for kernel
  GEN     /dev/shm/build/Makefile
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    /labs/mmarek/linux-2.6/scripts/checksyscalls.sh
  CC [M]  fs/ext3/namei.o
  LD [M]  fs/ext3/ext3.o
  MODPOST 3065 modules
WARNING: modpost: Found 56 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'
  LD [M]  fs/ext3/ext3.ko
$

Where do I find the psb_gfx driver? I don't see it in linux-next.

Michal
