Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:60623 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685AbZCRRPG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2009 13:15:06 -0400
Received: by ewy9 with SMTP id 9so122750ewy.37
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Mar 2009 10:15:03 -0700 (PDT)
From: Remis Lima Baima <remis.developer@googlemail.com>
Subject: [PATCH 2/2] Apply generic headers for x86
Date: Wed, 18 Mar 2009 18:08:35 +0100
Message-Id: <1237396115-28674-3-git-send-email-remis.developer@googlemail.com>
In-Reply-To: <1237396115-28674-2-git-send-email-remis.developer@googlemail.com>
References: <20090312153150.GA11875@uranus.ravnborg.org>
 <1237396115-28674-1-git-send-email-remis.developer@googlemail.com>
 <1237396115-28674-2-git-send-email-remis.developer@googlemail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, Remis Lima Baima <remis.developer@googlemail.com>

This patch depends on patch 7354857901f03bd27db16bf8c34958dd1673a95a
("Create the infrastructure for generic headers").

Remove the dummy arch/x86/include/asm/XXX.h files.

Signed-off-by: Remis Lima Baima <remis.developer@googlemail.com>
---
 arch/x86/include/asm/cputime.h  |    1 -
 arch/x86/include/asm/errno.h    |    1 -
 arch/x86/include/asm/fcntl.h    |    1 -
 arch/x86/include/asm/ioctl.h    |    1 -
 arch/x86/include/asm/poll.h     |    1 -
 arch/x86/include/asm/resource.h |    1 -
 arch/x86/include/asm/rtc.h      |    1 -
 arch/x86/include/asm/sections.h |    1 -
 8 files changed, 0 insertions(+), 8 deletions(-)
 delete mode 100644 arch/x86/include/asm/cputime.h
 delete mode 100644 arch/x86/include/asm/errno.h
 delete mode 100644 arch/x86/include/asm/fcntl.h
 delete mode 100644 arch/x86/include/asm/ioctl.h
 delete mode 100644 arch/x86/include/asm/poll.h
 delete mode 100644 arch/x86/include/asm/resource.h
 delete mode 100644 arch/x86/include/asm/rtc.h
 delete mode 100644 arch/x86/include/asm/sections.h

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

