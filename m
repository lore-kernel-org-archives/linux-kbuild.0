Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.zhinst.com ([212.126.164.98]:60380 "EHLO mail.zhinst.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932153AbdERMRh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 May 2017 08:17:37 -0400
From: Tobias Klauser <tklauser@distanz.ch>
Subject: [PATCH] Documentation, kbuild: fix typo "minimun" -> "minimum"
Date: Thu, 18 May 2017 14:17:29 +0200
Message-Id: <20170518121729.14776-1-tklauser@distanz.ch>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 Documentation/kbuild/makefiles.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index e18daca65ccd..659afd56ecdb 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1331,7 +1331,7 @@ See subsequent chapter for the syntax of the Kbuild file.
 	--- 7.5 mandatory-y
 
 	mandatory-y is essentially used by include/uapi/asm-generic/Kbuild.asm
-	to define the minimun set of headers that must be exported in
+	to define the minimum set of headers that must be exported in
 	include/asm.
 
 	The convention is to list one subdir per line and
-- 
2.13.0


