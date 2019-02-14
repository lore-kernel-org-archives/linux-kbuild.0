Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:64821 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393851AbfBNDGS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Feb 2019 22:06:18 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/8] kbuild: turn '/' into an alias of './'
Date: Thu, 14 Feb 2019 12:05:17 +0900
Message-Id: <1550113521-23577-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

Commit 06300b21f4c7 ("kbuild: support building individual files for
external modules") introduced the '/' target. It works only for
external modules to build all .o files, but skip the modpost stage.

However, 'make /' looks a bit weird to me. 'make ./' is more sensible
if you want to build all objects under the current directory, and it
works as expected.

Let's change '/' into a phony target that is an alias of './', but
I may feel like deprecating it in the future.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/modules.txt | 2 +-
 Makefile                         | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/modules.txt b/Documentation/kbuild/modules.txt
index 3fb39e0..80295c6 100644
--- a/Documentation/kbuild/modules.txt
+++ b/Documentation/kbuild/modules.txt
@@ -140,7 +140,7 @@ executed to make module versioning work.
 		make -C $KDIR M=$PWD bar.lst
 		make -C $KDIR M=$PWD baz.o
 		make -C $KDIR M=$PWD foo.ko
-		make -C $KDIR M=$PWD /
+		make -C $KDIR M=$PWD ./
 
 
 === 3. Creating a Kbuild File for an External Module
diff --git a/Makefile b/Makefile
index fe62de3..3956e93 100644
--- a/Makefile
+++ b/Makefile
@@ -1709,8 +1709,9 @@ endif
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 
 # Modules
-/: prepare FORCE
-	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
+PHONY += /
+/: ./
+
 # Make sure the latest headers are built for Documentation
 Documentation/ samples/: headers_install
 %/: prepare FORCE
-- 
2.7.4
