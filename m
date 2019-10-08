Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37211 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730371AbfJHNPZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 09:15:25 -0400
From: Wei Liu <wei.liu@kernel.org>
Subject: [PATCH RFC] kconfig: add hvconfig for Linux on Hyper-V
Date: Tue,  8 Oct 2019 14:15:08 +0100
Message-Id: <20191008131508.21189-1-liuw@liuw.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>, Linux Kconfig List <linux-kbuild@vger.kernel.org>, Wei Liu <liuwe@microsoft.com>

From: Wei Liu <liuwe@microsoft.com>

Add an config file snippet which enalbes additional options useful for
running the kernel in a Hyper-V guest.

The expected use case is a user provides an existing config file then
executes `make hvconfig`. It will merge those options with the
provided config file.

Based on similar concept for Xen and KVM.

Signed-off-by: Wei Liu <liuwe@microsoft.com>
---
RFC: I only tested this on x86.  Although the config options included in
hv_guest.config don't seem to be arch-specific, we should probably
move the ones not yet implemented on Arm to an x86 specific config
file.
---
 Documentation/admin-guide/README.rst |  3 +++
 kernel/configs/hv_guest.config       | 33 ++++++++++++++++++++++++++++
 scripts/kconfig/Makefile             |  5 +++++
 3 files changed, 41 insertions(+)
 create mode 100644 kernel/configs/hv_guest.config

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index cc6151fc0845..d5f4389a7a2f 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -224,6 +224,9 @@ Configuring the kernel
      "make xenconfig"   Enable additional options for xen dom0 guest kernel
                         support.
 
+     "make hvconfig"    Enable additional options for Hyper-V guest kernel
+                        support.
+
      "make tinyconfig"  Configure the tiniest possible kernel.
 
    You can find more information on using the Linux kernel config tools
diff --git a/kernel/configs/hv_guest.config b/kernel/configs/hv_guest.config
new file mode 100644
index 000000000000..0e71e34a2d4d
--- /dev/null
+++ b/kernel/configs/hv_guest.config
@@ -0,0 +1,33 @@
+CONFIG_NET=y
+CONFIG_NET_CORE=y
+CONFIG_NETDEVICES=y
+CONFIG_BLOCK=y
+CONFIG_BLK_DEV=y
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_INET=y
+CONFIG_TTY=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_BINFMT_ELF=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_VIRTUALIZATION=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_HYPERV=y
+CONFIG_HYPERV_VSOCKETS=y
+CONFIG_PCI_HYPERV=y
+CONFIG_PCI_HYPERV_INTERFACE=y
+CONFIG_HYPERV_STORAGE=y
+CONFIG_HYPERV_NET=y
+CONFIG_HYPERV_KEYBOARD=y
+CONFIG_FB_HYPERV=y
+CONFIG_HID_HYPERV_MOUSE=y
+CONFIG_HYPERV=y
+CONFIG_HYPERV_TIMER=y
+CONFIG_HYPERV_UTILS=y
+CONFIG_HYPERV_BALLOON=y
+CONFIG_HYPERV_IOMMU=y
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ef2f2336c469..2ee46301b22e 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -104,6 +104,10 @@ PHONY += xenconfig
 xenconfig: xen.config
 	@:
 
+PHONY += hvconfig
+hvconfig: hv_guest.config
+	@:
+
 PHONY += tinyconfig
 tinyconfig:
 	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
@@ -138,6 +142,7 @@ help:
 	@echo  '                    default value without prompting'
 	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
 	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
+	@echo  '  hvconfig        - Enable additional options for Hyper-V guest kernel support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
 
-- 
2.20.1
