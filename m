Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:34419 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfEKDOY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 23:14:24 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] .gitignore: exclude .get_maintainer.ignore and .gitattributes
Date: Sat, 11 May 2019 12:13:54 +0900
Message-Id: <1557544434-21126-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Also, sort the patterns alphabetically. Update the comment since
we have non-git files here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/.gitignore b/.gitignore
index d263ca9..7587ef56 100644
--- a/.gitignore
+++ b/.gitignore
@@ -81,12 +81,14 @@ modules.builtin
 /tar-install/
 
 #
-# git files that we don't want to ignore even if they are dot-files
+# We don't want to ignore the following even if they are dot-files
 #
+!.clang-format
+!.cocciconfig
+!.get_maintainer.ignore
+!.gitattributes
 !.gitignore
 !.mailmap
-!.cocciconfig
-!.clang-format
 
 #
 # Generated include files
-- 
2.7.4
