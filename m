Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36476 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755729Ab1EPPHU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 May 2011 11:07:20 -0400
Date: Mon, 16 May 2011 17:07:19 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [patch 1/1] Fix firmware installation
Message-ID: <20110516150719.GO13293@sepie.suse.cz>
References: <20110405135751.825663425@rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110405135751.825663425@rtp-net.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild@vger.kernel.org

On Tue, Apr 05, 2011 at 03:57:45PM +0200, Arnaud Patard wrote:
> When installing modules which have their firmware only in firmware/
> (no subdirectory), the build fails with:
> 
> $ make INSTALL_MOD_PATH=/home/rtp/devel/kernel/BUILD/kernel-x86_64/temp-root KERNELRELEASE=2.6.38.2-desktop-2.mga modules_install 
>   INSTALL  drivers/usb/serial/usbserial.ko
>   INSTALL  drivers/usb/serial/whiteheat.ko
> make[1]: *** No rule to make target `/home/rtp/devel/kernel/BUILD/kernel-x86_64/temp-root/lib/firmware/./', needed by `/home/rtp/devel/kernel/BUILD/kernel-x86_64/temp-root/lib/firmware/whiteheat_loader.fw'.  Stop.
> make: *** [_modinst_post] Error 2
> 
> If one is building a kernel with a module like 3c359, which has its firmware 
> in firmware/3com/, the mkdir -p firmware/3com/ will create the firmware/ 
> directory, allowing to install firmwares in firmware/, masking the error.
> 
> I noticed it while building with make 3.82, so this problem may be related
> to that.

I can reproduce the bug, but your patch doesn't fix it for me:

$ make O=/dev/shm/build INSTALL_MOD_PATH=/dev/shm/modinst modules_install
  INSTALL arch/x86/kernel/test_nx.ko
  INSTALL drivers/scsi/scsi_wait_scan.ko
  INSTALL drivers/usb/serial/usbserial.ko
  INSTALL drivers/usb/serial/whiteheat.ko
  INSTALL drivers/watchdog/hpwdt.ko
  INSTALL net/netfilter/xt_mark.ko
make[2]: *** No rule to make target `/dev/shm/modinst/lib/firmware/./', needed by `/dev/shm/modinst/lib/firmware/whiteheat_loader.fw'.  Stop.
make[1]: *** [_modinst_post] Error 2
make: *** [sub-make] Error 2
$ make --version
GNU Make 3.82
...

This is an x86_64 defconfig with CONFIG_USB_SERIAL and
CONFIG_USB_SERIAL_WHITEHEAT set to 'm'.

Michal

> 
> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
> Index: linux-2.6.38/scripts/Makefile.fwinst
> ===================================================================
> --- linux-2.6.38.orig/scripts/Makefile.fwinst
> +++ linux-2.6.38/scripts/Makefile.fwinst
> @@ -27,7 +27,7 @@ endif
>  installed-mod-fw := $(addprefix $(INSTALL_FW_PATH)/,$(mod-fw))
>  
>  installed-fw := $(addprefix $(INSTALL_FW_PATH)/,$(fw-shipped-all))
> -installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/.
> +installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/./
>  
>  # Workaround for make < 3.81, where .SECONDEXPANSION doesn't work.
>  PHONY += $(INSTALL_FW_PATH)/$$(%) install-all-dirs
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
