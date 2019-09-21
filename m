Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:47051 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437304AbfIUHGJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Sep 2019 03:06:09 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove SUBDIRS support
Date: Sat, 21 Sep 2019 16:05:41 +0900
Message-Id: <20190921070542.12868-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Linux 5.3 was released. Remove the SUBDIRS support.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 88b180b2cb64..6206cd358411 100644
--- a/Makefile
+++ b/Makefile
@@ -206,24 +206,8 @@ ifndef KBUILD_CHECKSRC
   KBUILD_CHECKSRC = 0
 endif
 
-# Use make M=dir to specify directory of external module to build
-# Old syntax make ... SUBDIRS=$PWD is still supported
-# Setting the environment variable KBUILD_EXTMOD take precedence
-ifdef SUBDIRS
-  $(warning ================= WARNING ================)
-  $(warning 'SUBDIRS' will be removed after Linux 5.3)
-  $(warning )
-  $(warning If you are building an individual subdirectory)
-  $(warning in the kernel tree, you can do like this:)
-  $(warning $$ make path/to/dir/you/want/to/build/)
-  $(warning (Do not forget the trailing slash))
-  $(warning )
-  $(warning If you are building an external module,)
-  $(warning Please use 'M=' or 'KBUILD_EXTMOD' instead)
-  $(warning ==========================================)
-  KBUILD_EXTMOD ?= $(SUBDIRS)
-endif
-
+# Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the
+# directory of external module to build. Setting M= takes precedence.
 ifeq ("$(origin M)", "command line")
   KBUILD_EXTMOD := $(M)
 endif
-- 
2.17.1
