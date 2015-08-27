Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33276 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752792AbbH0NOC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Aug 2015 09:14:02 -0400
From: Felipe Contreras <felipe.contreras@gmail.com>
Subject: [RFC/PATCH 1/2] kconfig: add KBUILD_USERCONFIG option
Date: Thu, 27 Aug 2015 08:08:44 -0500
Message-Id: <1440680925-2879-2-git-send-email-felipe.contreras@gmail.com>
In-Reply-To: <1440680925-2879-1-git-send-email-felipe.contreras@gmail.com>
References: <1440680925-2879-1-git-send-email-felipe.contreras@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Linus Torvalds <torvalds@linux-foundation.org>, Felipe Contreras <felipe.contreras@gmail.com>

This allows us to specify a user defconfig which is added on top of the
default defconfig, which makes it easier for users to keep a simpler
defconfig, without duplicating all the options already present in the
arch defconfig.

Here a very simple defconfig I've been using for several years on top of
x86_64_defconfig. It works because I can rely on the fact that
x86_64_defconfig is properly maintained.

CONFIG_KERNEL_LZO=y
CONFIG_OPROFILE=m
CONFIG_MCORE2=y
CONFIG_COMPAT_VDSO=y

CONFIG_PATA_ACPI=y
CONFIG_ATA_GENERIC=y

CONFIG_LOGO=n

CONFIG_BTRFS_FS=m
CONFIG_FUSE_FS=m
CONFIG_NFS_FS=m
CONFIG_NFSD=m
CONFIG_CIFS=m

CONFIG_KVM=m
CONFIG_KVM_INTEL=m
CONFIG_KSM=y
CONFIG_PARAVIRT=y

CONFIG_USB_XHCI_HCD=y
CONFIG_USB_USBNET=m
CONFIG_USB_NET_CDC_EEM=m
CONFIG_USB_UAS=m

CONFIG_SND_HDA_INPUT_JACK=y
CONFIG_SND_HDA_CODEC_REALTEK=y
CONFIG_SND_HDA_CODEC_HDMI=y
CONFIG_SND_HDA_CODEC_CMEDIA=y
CONFIG_SND_HDA_CODEC_SI3054=y

CONFIG_DM_CRYPT=m
CONFIG_CRYPTO_SHA256=y
CONFIG_BLK_DEV_CRYPTOLOOP=m
CONFIG_BRIDGE=m
CONFIG_TUN=m

CONFIG_ISO9660_FS=m
CONFIG_UDF_FS=m

CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SCSI_ENCLOSURE=m

CONFIG_DEBUG_KERNEL=n
CONFIG_X86_VERBOSE_BOOTUP=n
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_PM_RUNTIME=y

CONFIG_SCHED_AUTOGROUP=y

CONFIG_UEVENT_HELPER_PATH=""

CONFIG_FHANDLE=y

CONFIG_EFI_STUB=y
CONFIG_EFIVAR_FS=m

CONFIG_HYPERVISOR_GUEST=y
CONFIG_DRM_CIRRUS_QEMU=y

CONFIG_CFG80211=m
CONFIG_MAC80211=m
CONFIG_IWLWIFI=m
CONFIG_CFG80211_DEFAULT_PS=n

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 scripts/kconfig/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index d9b1fef..0d55ad1 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -97,9 +97,15 @@ defconfig: $(obj)/conf
 ifeq ($(KBUILD_DEFCONFIG),)
 	$< $(silent) --defconfig $(Kconfig)
 else
+ifneq ($(KBUILD_USERCONFIG),)
+	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)' and '$(KBUILD_USERCONFIG)'"
+	$(Q)cat arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(KBUILD_USERCONFIG) > defconfig
+	$(Q)$< $(silent) --defconfig=defconfig $(Kconfig)
+else
 	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 endif
+endif
 
 %_defconfig: $(obj)/conf
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
-- 
2.5.0

