Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:38700 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751117AbbFYI5A (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Jun 2015 04:57:00 -0400
Received: by igin14 with SMTP id n14so51209092igi.1
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jun 2015 01:57:00 -0700 (PDT)
From: Michael Lee Abir <micky.abir@gmail.com>
Subject: [PATCH] added extraversion for eudyptula challenge
Date: Thu, 25 Jun 2015 03:56:23 -0500
Message-Id: <1435222583-30434-1-git-send-email-micky.abir@gmail.com>
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
