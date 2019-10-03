Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:49390 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCKaM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 06:30:12 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/4] kbuild: two minor updates for Documentation/kbuild/modules.rst
Date: Thu,  3 Oct 2019 19:29:12 +0900
Message-Id: <20191003102915.28301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Capitalize the first word in the sentence.

Use obj-m instead of obj-y. obj-y still works, but we have no built-in
objects in external module builds. So, obj-m is better IMHO.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/modules.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index d2ae799237fd..dd1d2a0688e8 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -501,7 +501,7 @@ build.
 --- 6.3 Symbols From Another External Module
 
 	Sometimes, an external module uses exported symbols from
-	another external module. kbuild needs to have full knowledge of
+	another external module. Kbuild needs to have full knowledge of
 	all symbols to avoid spitting out warnings about undefined
 	symbols. Three solutions exist for this situation.
 
@@ -521,7 +521,7 @@ build.
 		The top-level kbuild file would then look like::
 
 			#./Kbuild (or ./Makefile):
-				obj-y := foo/ bar/
+				obj-m := foo/ bar/
 
 		And executing::
 
-- 
2.17.1
