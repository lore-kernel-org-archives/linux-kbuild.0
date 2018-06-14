Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:29581 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965517AbeFNOkk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 10:40:40 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 3/3] bpfilter: check compiler capability in Kconfig
Date: Thu, 14 Jun 2018 23:39:32 +0900
Message-Id: <1528987172-19810-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1528987172-19810-1-git-send-email-yamada.masahiro@socionext.com>
References: <1528987172-19810-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, "David S . Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Daniel Borkmann <daniel@iogearbox.net>

With the brand-new syntax extension of Kconfig, we can directly
check the compiler capability in the configuration phase.

If the cc-can-link.sh fails, the BPFILTER_UMH is automatically
hidden by the dependency.

I deleted 'default n', which is no-op.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - newly added

 Makefile               | 5 -----
 net/Makefile           | 4 ----
 net/bpfilter/Kconfig   | 2 +-
 scripts/cc-can-link.sh | 2 +-
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 8a26b59..9ada673 100644
--- a/Makefile
+++ b/Makefile
@@ -507,11 +507,6 @@ ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLA
   KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
 endif
 
-ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC)), y)
-  CC_CAN_LINK := y
-  export CC_CAN_LINK
-endif
-
 # The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
 # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
diff --git a/net/Makefile b/net/Makefile
index 13ec0d5..bdaf539 100644
--- a/net/Makefile
+++ b/net/Makefile
@@ -20,11 +20,7 @@ obj-$(CONFIG_TLS)		+= tls/
 obj-$(CONFIG_XFRM)		+= xfrm/
 obj-$(CONFIG_UNIX)		+= unix/
 obj-$(CONFIG_NET)		+= ipv6/
-ifneq ($(CC_CAN_LINK),y)
-$(warning CC cannot link executables. Skipping bpfilter.)
-else
 obj-$(CONFIG_BPFILTER)		+= bpfilter/
-endif
 obj-$(CONFIG_PACKET)		+= packet/
 obj-$(CONFIG_NET_KEY)		+= key/
 obj-$(CONFIG_BRIDGE)		+= bridge/
diff --git a/net/bpfilter/Kconfig b/net/bpfilter/Kconfig
index a948b07..76deb66 100644
--- a/net/bpfilter/Kconfig
+++ b/net/bpfilter/Kconfig
@@ -1,6 +1,5 @@
 menuconfig BPFILTER
 	bool "BPF based packet filtering framework (BPFILTER)"
-	default n
 	depends on NET && BPF && INET
 	help
 	  This builds experimental bpfilter framework that is aiming to
@@ -9,6 +8,7 @@ menuconfig BPFILTER
 if BPFILTER
 config BPFILTER_UMH
 	tristate "bpfilter kernel module with user mode helper"
+	depends on $(success,$(srctree)/scripts/cc-can-link.sh $(CC))
 	default m
 	help
 	  This builds bpfilter kernel module with embedded user mode helper
diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
index 208eb28..6efcead 100755
--- a/scripts/cc-can-link.sh
+++ b/scripts/cc-can-link.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
-cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1 && echo "y"
+cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
 #include <stdio.h>
 int main(void)
 {
-- 
2.7.4

