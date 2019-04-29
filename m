Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:50892 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbfD2PS2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Apr 2019 11:18:28 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] .gitignore: add / prefix/suffix to generated include directories
Date: Tue, 30 Apr 2019 00:17:53 +0900
Message-Id: <1556551073-19433-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Clarify these directory paths are relative to the top of source tree.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/.gitignore b/.gitignore
index a20ac26..e7bb6c6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -90,10 +90,10 @@ modules.builtin
 #
 # Generated include files
 #
-include/config
-include/generated
-include/ksym
-arch/*/include/generated
+/include/config/
+/include/generated/
+/include/ksym/
+/arch/*/include/generated/
 
 # stgit generated dirs
 patches-*
-- 
2.7.4
