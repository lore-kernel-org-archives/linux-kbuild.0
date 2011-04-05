Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([88.191.135.105]:47984 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752571Ab1DEOHf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 10:07:35 -0400
Message-Id: <20110405135751.825663425@rtp-net.org>
Date: Tue, 05 Apr 2011 15:57:45 +0200
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: [patch 1/1] Fix firmware installation
Content-Disposition: inline; filename=toto.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

When installing modules which have their firmware only in firmware/
(no subdirectory), the build fails with:

$ make INSTALL_MOD_PATH=/home/rtp/devel/kernel/BUILD/kernel-x86_64/temp-root KERNELRELEASE=2.6.38.2-desktop-2.mga modules_install 
  INSTALL  drivers/usb/serial/usbserial.ko
  INSTALL  drivers/usb/serial/whiteheat.ko
make[1]: *** No rule to make target `/home/rtp/devel/kernel/BUILD/kernel-x86_64/temp-root/lib/firmware/./', needed by `/home/rtp/devel/kernel/BUILD/kernel-x86_64/temp-root/lib/firmware/whiteheat_loader.fw'.  Stop.
make: *** [_modinst_post] Error 2

If one is building a kernel with a module like 3c359, which has its firmware 
in firmware/3com/, the mkdir -p firmware/3com/ will create the firmware/ 
directory, allowing to install firmwares in firmware/, masking the error.

I noticed it while building with make 3.82, so this problem may be related
to that.

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
Index: linux-2.6.38/scripts/Makefile.fwinst
===================================================================
--- linux-2.6.38.orig/scripts/Makefile.fwinst
+++ linux-2.6.38/scripts/Makefile.fwinst
@@ -27,7 +27,7 @@ endif
 installed-mod-fw := $(addprefix $(INSTALL_FW_PATH)/,$(mod-fw))
 
 installed-fw := $(addprefix $(INSTALL_FW_PATH)/,$(fw-shipped-all))
-installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/.
+installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/./
 
 # Workaround for make < 3.81, where .SECONDEXPANSION doesn't work.
 PHONY += $(INSTALL_FW_PATH)/$$(%) install-all-dirs


