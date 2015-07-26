Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:36197 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755214AbbGZVln (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 26 Jul 2015 17:41:43 -0400
Received: by wicgb10 with SMTP id gb10so87858977wic.1
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2015 14:41:42 -0700 (PDT)
Date: Sun, 26 Jul 2015 22:41:40 +0100
From: Ciprian Manea <ciprian.manea.cm@gmail.com>
Subject: [PATCH] Makefile: 8c2d815587fd: Change EXTRAVERSION from '-rc3' to
 'eudyptula'
Message-ID: <20150726214140.GA3396@ciphp>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Little Penguin <little@eudyptula-challenge.org>
Cc: linux-kbuild@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

According to Task 03 of Eudyptula Challenge, when running the newly
compiled kernel, 'eudyptula' string should be visible in the kernel
version, when running 'uname -r' command.

Signed-off-by: Ciprian Manea <ciprian.manea.cm@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a9ad490..c9580d8 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 VERSION = 4
 PATCHLEVEL = 2
 SUBLEVEL = 0
-EXTRAVERSION = -rc3
+EXTRAVERSION = -eudyptula
 NAME = Hurr durr I'ma sheep
 
 # *DOCUMENTATION*
-- 
1.9.1


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="proof-of-running.txt"

1. Modifie the EXTRAVERSION field

ciphp@ciphp:~/Workspace/Eudyptula/linusTree/linux$ git status 
On branch edyptulaTask2
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   Makefile

no changes added to commit (use "git add" and/or "git commit -a")
ciphp@ciphp:~/Workspace/Eudyptula/linusTree/linux$ git diff Makefile
diff --git a/Makefile b/Makefile
index a9ad490..c9580d8 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 VERSION = 4
 PATCHLEVEL = 2
 SUBLEVEL = 0
-EXTRAVERSION = -rc3
+EXTRAVERSION = -eudyptula
 NAME = Hurr durr I'ma sheep
 
 # *DOCUMENTATION*

2. Booting with the new compiled kernel
ciphp@ciphp:~/Workspace/Eudyptula$ uname -a
Linux ciphp 4.2.0-eudyptula-00021-g345647c #3 SMP Sun Jul 26 00:35:28 IST 2015 x86_64 x86_64 x86_64 GNU/Linux

--HlL+5n6rz5pIUxbD--
