Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44672 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751903AbeC0FcB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:01 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 15/21] gcov: remove CONFIG_GCOV_FORMAT_AUTODETECT
Date: Tue, 27 Mar 2018 14:29:29 +0900
Message-Id: <1522128575-5326-16-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org

CONFIG_GCOV_FORMAT_AUTODETECT compiles either gcc_3_4.c or gcc_4_7.c
according to your GCC version.

We can achieve the equivalent behavior by setting reasonable dependency
with the knowledge of the compiler version.

If GCC older than 4.7 is used, GCOV_FORMAT_3_4 is the default, but users
are still allowed to select GCOV_FORMAT_4_7 in case the newer format is
back-ported.

On the other hand, If GCC 4.7 or newer is used, there is no reason to
use GCOV_FORMAT_3_4, so it should be hidden.

If you down-grade your compiler GCC 4.7 or older, oldconfig/syncconfig
will display a prompt for the choice because GCOV_FORMAT_3_4 becomes
visible as a new symbol.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Move the 'depends on' to the choice value.

 kernel/gcov/Kconfig  | 17 +++++------------
 kernel/gcov/Makefile |  2 --
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
index 1276aab..1e3823f 100644
--- a/kernel/gcov/Kconfig
+++ b/kernel/gcov/Kconfig
@@ -53,23 +53,16 @@ config GCOV_PROFILE_ALL
 choice
 	prompt "Specify GCOV format"
 	depends on GCOV_KERNEL
-	default GCOV_FORMAT_AUTODETECT
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
+	depends on CC_IS_GCC && GCC_VERSION < 40700
 	---help---
 	Select this option to use the format defined by GCC 3.4.
 
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

