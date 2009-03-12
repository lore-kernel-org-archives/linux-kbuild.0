Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f164.google.com ([209.85.219.164]:39279 "EHLO
	mail-ew0-f164.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755178AbZCLNnS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2009 09:43:18 -0400
Received: by mail-ew0-f164.google.com with SMTP id 8so337400ewy.13
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2009 06:43:16 -0700 (PDT)
From: Remis Lima Baima <remis.developer@googlemail.com>
Subject: [PATCH 2/3] Apply generic headers for x86
Date: Thu, 12 Mar 2009 14:43:07 +0100
Message-Id: <1236865388-31590-3-git-send-email-remis.developer@googlemail.com>
In-Reply-To: <1236865388-31590-2-git-send-email-remis.developer@googlemail.com>
References: <1236865388-31590-1-git-send-email-remis.developer@googlemail.com>
 <1236865388-31590-2-git-send-email-remis.developer@googlemail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Remis Lima Baima <remis.developer@googlemail.com>

This patch depends on patch d8b392b37469f570bd180f37be783367259f1d4b
("Create the infrastructure for generic headers").

Remove the dummy arch/x86/include/asm/XXX.h files.

Add in the arch/x86/include/asm/Kbuild file the variable generic-y
with the names of the removed arch/x86/include/asm/XXX.h files.

The removed files will be automatically generated during the build
process by the script scripts/Makefile.genericheaders.

Signed-off-by: Remis Lima Baima <remis.developer@googlemail.com>
---
 arch/x86/include/asm/Kbuild     |    9 +++++++++
 arch/x86/include/asm/cputime.h  |    1 -
 arch/x86/include/asm/errno.h    |    1 -
 arch/x86/include/asm/fcntl.h    |    1 -
 arch/x86/include/asm/ioctl.h    |    1 -
 arch/x86/include/asm/poll.h     |    1 -
 arch/x86/include/asm/resource.h |    1 -
 arch/x86/include/asm/rtc.h      |    1 -
 arch/x86/include/asm/sections.h |    1 -
 9 files changed, 9 insertions(+), 8 deletions(-)
 delete mode 100644 arch/x86/include/asm/cputime.h
 delete mode 100644 arch/x86/include/asm/errno.h
 delete mode 100644 arch/x86/include/asm/fcntl.h
 delete mode 100644 arch/x86/include/asm/ioctl.h
 delete mode 100644 arch/x86/include/asm/poll.h
 delete mode 100644 arch/x86/include/asm/resource.h
 delete mode 100644 arch/x86/include/asm/rtc.h
 delete mode 100644 arch/x86/include/asm/sections.h

diff --git a/arch/x86/include/asm/Kbuild b/arch/x86/include/asm/Kbuild
index 4a8e80c..ae936b1 100644
--- a/arch/x86/include/asm/Kbuild
+++ b/arch/x86/include/asm/Kbuild
@@ -22,3 +22,12 @@ unifdef-y += unistd_32.h
 unifdef-y += unistd_64.h
 unifdef-y += vm86.h
 unifdef-y += vsyscall.h
+
+generic-y += cputime.h
+generic-y += errno.h
+generic-y += fcntl.h
+generic-y += ioctl.h
+generic-y += poll.h
+generic-y += resource.h
+generic-y += rtc.h
+generic-y += sections.h
diff --git a/arch/x86/include/asm/cputime.h b/arch/x86/include/asm/cputime.h
deleted file mode 100644
index 6d68ad7..0000000
--- a/arch/x86/include/asm/cputime.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/cputime.h>
diff --git a/arch/x86/include/asm/errno.h b/arch/x86/include/asm/errno.h
deleted file mode 100644
index 4c82b50..0000000
--- a/arch/x86/include/asm/errno.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/errno.h>
diff --git a/arch/x86/include/asm/fcntl.h b/arch/x86/include/asm/fcntl.h
deleted file mode 100644
index 46ab12d..0000000
--- a/arch/x86/include/asm/fcntl.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/fcntl.h>
diff --git a/arch/x86/include/asm/ioctl.h b/arch/x86/include/asm/ioctl.h
deleted file mode 100644
index b279fe0..0000000
--- a/arch/x86/include/asm/ioctl.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/ioctl.h>
diff --git a/arch/x86/include/asm/poll.h b/arch/x86/include/asm/poll.h
deleted file mode 100644
index c98509d..0000000
--- a/arch/x86/include/asm/poll.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/poll.h>
diff --git a/arch/x86/include/asm/resource.h b/arch/x86/include/asm/resource.h
deleted file mode 100644
index 04bc4db..0000000
--- a/arch/x86/include/asm/resource.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/resource.h>
diff --git a/arch/x86/include/asm/rtc.h b/arch/x86/include/asm/rtc.h
deleted file mode 100644
index f71c3b0..0000000
--- a/arch/x86/include/asm/rtc.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/rtc.h>
diff --git a/arch/x86/include/asm/sections.h b/arch/x86/include/asm/sections.h
deleted file mode 100644
index 2b8c516..0000000
--- a/arch/x86/include/asm/sections.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/sections.h>
-- 
1.5.6.3

