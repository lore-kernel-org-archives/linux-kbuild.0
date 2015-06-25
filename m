Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:35359 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751929AbbFYI5Z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Jun 2015 04:57:25 -0400
Received: by igblr2 with SMTP id lr2so92804277igb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jun 2015 01:57:24 -0700 (PDT)
From: Michael Lee Abir <micky.abir@gmail.com>
Subject: [PATCH] added extraversion for eudyptula challenge
Date: Thu, 25 Jun 2015 03:57:18 -0500
Message-Id: <1435222638-30503-1-git-send-email-micky.abir@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, Micky Abir <micky.abir@gmail.com>

From: Micky Abir <micky.abir@gmail.com>

---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6c6f146..99de322 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 VERSION = 4
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = -eudyptula
 NAME = Hurr durr I'ma sheep
 
 # *DOCUMENTATION*
-- 
2.1.4

Signed-off-by: Michael Lee Abir <micky.abir@gmail.com>

