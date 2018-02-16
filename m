Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57824 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752719AbeBPSlU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 13:41:20 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 18/23] gcov: remove CONFIG_GCOV_FORMAT_AUTODETECT
Date: Sat, 17 Feb 2018 03:38:46 +0900
Message-Id: <1518806331-7101-19-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org

CONFIG_GCOV_FORMAT_AUTODETECT compiles either gcc_3_4.c or gcc_4_7.c
according to your GCC version.

We can achieve the equivalent behavior by setting reasonable default
in the 'choice' with the knowledge of the compiler version.

Users are still allowed to change it if they need to do so.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 kernel/gcov/Kconfig  | 18 ++++++------------
 kernel/gcov/Makefile |  2 --
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
index 1276aab..c56bee7 100644
--- a/kernel/gcov/Kconfig
+++ b/kernel/gcov/Kconfig
@@ -53,20 +53,14 @@ config GCOV_PROFILE_ALL
 choice
 	prompt "Specify GCOV format"
 	depends on GCOV_KERNEL
-	default GCOV_FORMAT_AUTODETECT
+	default GCOV_FORMAT_3_4 if CC_IS_GCC && GCC_VERSION < 40700
+	default GCOV_FORMAT_4_7
 	---help---
-	The gcov format is usually determined by the GCC version, but there are
+	The gcov format is usually determined by the GCC version, and the
+	default is chosen according to your GCC version. However, there are
 	exceptions where format changes are integrated in lower-version GCCs.
-	In such a case use this option to adjust the format used in the kernel
-	accordingly.
-
-	If unsure, choose "Autodetect".
-
-config GCOV_FORMAT_AUTODETECT
-	bool "Autodetect"
-	---help---
-	Select this option to use the format that corresponds to your GCC
-	version.
+	In such a case, change this option to adjust the format used in the
+	kernel accordingly.
 
 config GCOV_FORMAT_3_4
 	bool "GCC 3.4 format"
diff --git a/kernel/gcov/Makefile b/kernel/gcov/Makefile
index c6c50e5..ff06d64 100644
--- a/kernel/gcov/Makefile
+++ b/kernel/gcov/Makefile
@@ -4,5 +4,3 @@ ccflags-y := -DSRCTREE='"$(srctree)"' -DOBJTREE='"$(objtree)"'
 obj-y := base.o fs.o
 obj-$(CONFIG_GCOV_FORMAT_3_4) += gcc_3_4.o
 obj-$(CONFIG_GCOV_FORMAT_4_7) += gcc_4_7.o
-obj-$(CONFIG_GCOV_FORMAT_AUTODETECT) += $(call cc-ifversion, -lt, 0407, \
-							gcc_3_4.o, gcc_4_7.o)
-- 
2.7.4

