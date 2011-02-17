Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:40200 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753278Ab1BQQtN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Feb 2011 11:49:13 -0500
Date: Thu, 17 Feb 2011 16:49:45 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Misbehaviour with "make foo.ko"
Message-ID: <20110217164945.1cf0b31e@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, linux-kbuild@vger.kernel.org

Trying to rebuild single modules gets into a mess

[alan@pyx linux-psbdev]$ make drivers/staging/mrst/pvr/psb_gfx.ko
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CC [M]  drivers/staging/mrst/pvr/../drv/psb_fb.o
  CC [M]  drivers/staging/mrst/pvr/../drv/psb_intel_lvds.o
  LD [M]  drivers/staging/mrst/pvr/psb_gfx.o
  MODPOST 1 modules
ERROR: "ttm_object_device_release" [drivers/staging/mrst/pvr/psb_gfx.ko]
undefined!
ERROR ...



The box has lots of modules but it seems the MODPOST stage when you build
a single .ko target erroneously only gets processed for that module,
which goes wrong as a result.

Alan
