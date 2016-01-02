Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:51892 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752386AbcABCcJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Jan 2016 21:32:09 -0500
From: Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH] [RFC] um: define and use HAVE_LIBPCAP/HAVE_LIBVDEPLUG
Date: Sat,  2 Jan 2016 03:31:49 +0100
Message-Id: <1451701909-24430-1-git-send-email-vegard.nossum@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: user-mode-linux-devel@lists.sourceforge.net, linux-kbuild@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>

If you don't have libpcap or libvdeplug installed, you will get build
failures when compiling certain files:

arch/um/drivers/vde_user.c:8:24: fatal error: libvdeplug.h: No such file or directory
 #include <libvdeplug.h>

arch/um/drivers/pcap_user.c:7:18: fatal error: pcap.h: No such file or directory
 #include <pcap.h>

This patch adds a basic pre-build check and defines the kconfig variables
HAVE_LIBPCAP and HAVE_LIBVDEPLUG depending on the result.

There is a basic disadvantage to this scheme, namely that the user may
never see the options that rely on these libraries if they are not
installed. As a trade-off, we add a brand new option, MISSING_LIBRARIES
(defaulting to 'y'), which allows those options to be visible (and
selectable) anyway.

[Note: I find this useful personally as I ran into the above build
 failures when playing around with UML -- so take this more as a
 suggestion on how things MAY be done better than a real patch.]

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 arch/um/Kconfig.common | 18 ++++++++++++++++++
 arch/um/Kconfig.net    |  2 ++
 arch/um/Kconfig.um     | 13 +++++++++++++
 arch/um/Makefile       |  5 +++++
 4 files changed, 38 insertions(+)

diff --git a/arch/um/Kconfig.common b/arch/um/Kconfig.common
index d195a87..35ce3a1 100644
--- a/arch/um/Kconfig.common
+++ b/arch/um/Kconfig.common
@@ -59,3 +59,21 @@ config HZ
 config SUBARCH
 	string
 	option env="SUBARCH"
+
+# Host libraries; these are defined by arch/um/Makefile
+
+config ENV_HAVE_LIBPCAP
+	string
+	option env="ENV_HAVE_LIBPCAP"
+
+config HAVE_LIBPCAP
+	bool
+	default y if ENV_HAVE_LIBPCAP="1"
+
+config ENV_HAVE_LIBVDEPLUG
+	string
+	option env="ENV_HAVE_LIBVDEPLUG"
+
+config HAVE_LIBVDEPLUG
+	bool
+	default y if ENV_HAVE_LIBVDEPLUG="1"
diff --git a/arch/um/Kconfig.net b/arch/um/Kconfig.net
index 820a56f..dfa7849 100644
--- a/arch/um/Kconfig.net
+++ b/arch/um/Kconfig.net
@@ -111,6 +111,7 @@ config UML_NET_DAEMON
 config UML_NET_VDE
 	bool "VDE transport"
 	depends on UML_NET
+	depends on HAVE_LIBVDEPLUG || MISSING_LIBRARIES
 	help
 	This User-Mode Linux network transport allows one or more running
 	UMLs on a single host to communicate with each other and also
@@ -158,6 +159,7 @@ config UML_NET_MCAST
 config UML_NET_PCAP
 	bool "pcap transport"
 	depends on UML_NET
+	depends on HAVE_LIBPCAP || MISSING_LIBRARIES
 	help
 	The pcap transport makes a pcap packet stream on the host look
 	like an ethernet device inside UML.  This is useful for making
diff --git a/arch/um/Kconfig.um b/arch/um/Kconfig.um
index 28a9885..15944d9 100644
--- a/arch/um/Kconfig.um
+++ b/arch/um/Kconfig.um
@@ -9,6 +9,19 @@ config STATIC_LINK
 	  Additionally, this option enables using higher memory spaces (up to
 	  2.75G) for UML.
 
+config MISSING_LIBRARIES
+	bool "Prompt for options which require missing host libraries"
+	default y
+	help
+	  Certain options rely on host libraries to compile.
+
+	  If you say N here, then these options will only be available if
+	  the libraries they require have been detected to be present.
+
+	  If you say Y, then the options will be available anyway, but
+	  beware that attempting to build the kernel will most likely
+	  result in an error.
+
 source "mm/Kconfig"
 
 config LD_SCRIPT_STATIC
diff --git a/arch/um/Makefile b/arch/um/Makefile
index e3abe6f..a8320e6 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -166,3 +166,8 @@ include/generated/user_constants.h: $(HOST_DIR)/um/user-offsets.s
 	$(call filechk,gen-asm-offsets)
 
 export SUBARCH USER_CFLAGS CFLAGS_NO_HARDENING OS DEV_NULL_PATH
+
+# Host libraries
+has_header = $(shell echo | $(CC) -include $(1) -xc -c - >/dev/null 2>&1 && echo 1)
+export ENV_HAVE_LIBPCAP := $(call has_header,pcap.h)
+export ENV_HAVE_LIBVDEPLUG := $(call has_header,libvdeplug.h)
-- 
1.9.1

