Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f164.google.com ([209.85.219.164]:49829 "EHLO
	mail-ew0-f164.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755202AbZCLNnU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2009 09:43:20 -0400
Received: by mail-ew0-f164.google.com with SMTP id 8so337415ewy.13
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2009 06:43:19 -0700 (PDT)
From: Remis Lima Baima <remis.developer@googlemail.com>
Subject: [PATCH 3/3] Apply generic headers for PPC
Date: Thu, 12 Mar 2009 14:43:08 +0100
Message-Id: <1236865388-31590-4-git-send-email-remis.developer@googlemail.com>
In-Reply-To: <1236865388-31590-3-git-send-email-remis.developer@googlemail.com>
References: <1236865388-31590-1-git-send-email-remis.developer@googlemail.com>
 <1236865388-31590-2-git-send-email-remis.developer@googlemail.com>
 <1236865388-31590-3-git-send-email-remis.developer@googlemail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Remis Lima Baima <remis.developer@googlemail.com>

This patch depends on patch d8b392b37469f570bd180f37be783367259f1d4b
("Create the infrastructure for generic headers").

Remove the dummy arch/powerpc/include/asm/XXX.h files.

Add in the arch/powerpc/include/asm/Kbuild file the variable generic-y
with the names of the removed arch/powerpc/include/asm/XXX.h files.

The removed files will be automatically generated during the build
process by the script scripts/Makefile.genericheaders.

Signed-off-by: Remis Lima Baima <remis.developer@googlemail.com>
---
 arch/powerpc/include/asm/Kbuild              |    8 ++++++++
 arch/powerpc/include/asm/div64.h             |    1 -
 arch/powerpc/include/asm/emergency-restart.h |    1 -
 arch/powerpc/include/asm/irq_regs.h          |    2 --
 arch/powerpc/include/asm/poll.h              |    1 -
 arch/powerpc/include/asm/resource.h          |    1 -
 arch/powerpc/include/asm/statfs.h            |    6 ------
 arch/powerpc/include/asm/xor.h               |    1 -
 8 files changed, 8 insertions(+), 13 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/div64.h
 delete mode 100644 arch/powerpc/include/asm/emergency-restart.h
 delete mode 100644 arch/powerpc/include/asm/irq_regs.h
 delete mode 100644 arch/powerpc/include/asm/poll.h
 delete mode 100644 arch/powerpc/include/asm/resource.h
 delete mode 100644 arch/powerpc/include/asm/statfs.h
 delete mode 100644 arch/powerpc/include/asm/xor.h

diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index 5ab7d7f..8eea68e 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -35,3 +35,11 @@ unifdef-y += spu_info.h
 unifdef-y += termios.h
 unifdef-y += types.h
 unifdef-y += unistd.h
+
+generic-y += div64.h
+generic-y += emergency-restart.h
+generic-y += irq_regs.h
+generic-y += poll.h
+generic-y += resource.h
+generic-y += statfs.h
+generic-y += xor.h
diff --git a/arch/powerpc/include/asm/div64.h b/arch/powerpc/include/asm/div64.h
deleted file mode 100644
index 6cd978c..0000000
--- a/arch/powerpc/include/asm/div64.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/div64.h>
diff --git a/arch/powerpc/include/asm/emergency-restart.h b/arch/powerpc/include/asm/emergency-restart.h
deleted file mode 100644
index 3711bd9..0000000
--- a/arch/powerpc/include/asm/emergency-restart.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/emergency-restart.h>
diff --git a/arch/powerpc/include/asm/irq_regs.h b/arch/powerpc/include/asm/irq_regs.h
deleted file mode 100644
index ba94b51..0000000
--- a/arch/powerpc/include/asm/irq_regs.h
+++ /dev/null
@@ -1,2 +0,0 @@
-#include <asm-generic/irq_regs.h>
-
diff --git a/arch/powerpc/include/asm/poll.h b/arch/powerpc/include/asm/poll.h
deleted file mode 100644
index c98509d..0000000
--- a/arch/powerpc/include/asm/poll.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/poll.h>
diff --git a/arch/powerpc/include/asm/resource.h b/arch/powerpc/include/asm/resource.h
deleted file mode 100644
index 04bc4db..0000000
--- a/arch/powerpc/include/asm/resource.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/resource.h>
diff --git a/arch/powerpc/include/asm/statfs.h b/arch/powerpc/include/asm/statfs.h
deleted file mode 100644
index 5244834..0000000
--- a/arch/powerpc/include/asm/statfs.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef _ASM_POWERPC_STATFS_H
-#define _ASM_POWERPC_STATFS_H
-
-#include <asm-generic/statfs.h>
-
-#endif
diff --git a/arch/powerpc/include/asm/xor.h b/arch/powerpc/include/asm/xor.h
deleted file mode 100644
index c82eb12..0000000
--- a/arch/powerpc/include/asm/xor.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/xor.h>
-- 
1.5.6.3

