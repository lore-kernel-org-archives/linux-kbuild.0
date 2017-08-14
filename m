Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:33164 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752275AbdHNWjt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Aug 2017 18:39:49 -0400
From: Pramuka Perera <pramuka.perera@gmail.com>
Subject: [PATCH] [PATCH] linux: Makefile: 4:  Changed Makefile EXTRAVERSION to "-eudyptula"
Date: Mon, 14 Aug 2017 18:39:44 -0400
Message-Id: <1502750384-19554-1-git-send-email-pramuka.perera@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pramuka Perera <pramuka.perera@gmail.com>

As required by Task 03 of the Eudyptula Challenge, modified the EXTRAVERSION variable to "-eudyptula".

Signed-off-by: Pramuka Perera <pramuka.perera@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 37087b4..9456b24 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 VERSION = 4
 PATCHLEVEL = 13
 SUBLEVEL = 0
-EXTRAVERSION = -rc3
+EXTRAVERSION = -eudyptula
 NAME = Fearless Coyote
 
 # *DOCUMENTATION*
-- 
2.7.4

