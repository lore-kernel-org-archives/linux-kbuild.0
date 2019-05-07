Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:23556 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbfEGMtA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 May 2019 08:49:00 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] .gitignore: add more all*.config patterns
Date: Tue,  7 May 2019 21:48:46 +0900
Message-Id: <1557233326-13247-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

For completeness, ignore all the allconfig variants.

I added a leading slash because they are only searched in the
top of the tree.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 2fb1765..d263ca9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -130,7 +130,12 @@ signing_key.x509
 x509.genkey
 
 # Kconfig presets
-all.config
+/all.config
+/alldef.config
+/allmod.config
+/allno.config
+/allrandom.config
+/allyes.config
 
 # Kdevelop4
 *.kdev4
-- 
2.7.4
