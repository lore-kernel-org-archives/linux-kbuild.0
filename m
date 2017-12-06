Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:48266 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754867AbdLFKdb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Dec 2017 05:33:31 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: pkg: make out-of-tree rpm/deb-pkg build immediately fail
Date: Wed,  6 Dec 2017 19:32:57 +0900
Message-Id: <1512556378-13310-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

We do not support out-of-tree building of rpm-pkg / deb-pkg.  If O=
is given, the build should be terminated, but the "false" command is
not effective because it is not the last command in the cmd_src_tar.
Then, rpm-pkg / deb-pkg tries to continue building, and fails for a
different reason.

Set -e option so that the "false" terminates the building immediately.

I also put the error messages to stderr, and made it stand out more.

For example, "make O=foo rpm-pkg" will fail as follows:

  /bin/bash ../scripts/package/mkspec >./kernel.spec
    TAR     kernel-4.15.0_rc2+.tar.gz

    ERROR:
    Building source tarball is not possible outside the
    kernel source tree. Don't set KBUILD_OUTPUT, or use the
    binrpm-pkg or bindeb-pkg target instead.

  ../scripts/package/Makefile:53: recipe for target 'rpm-pkg' failed

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 61e29da..9fbcf5e 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -32,10 +32,14 @@ MKSPEC     := $(srctree)/scripts/package/mkspec
 
 quiet_cmd_src_tar = TAR     $(2).tar.gz
       cmd_src_tar = \
+set -e; \
 if test "$(objtree)" != "$(srctree)"; then \
-	echo "Building source tarball is not possible outside the"; \
-	echo "kernel source tree. Don't set KBUILD_OUTPUT, or use the"; \
-	echo "binrpm-pkg or bindeb-pkg target instead."; \
+	echo >&2; \
+	echo >&2 "  ERROR:"; \
+	echo >&2 "  Building source tarball is not possible outside the"; \
+	echo >&2 "  kernel source tree. Don't set KBUILD_OUTPUT, or use the"; \
+	echo >&2 "  binrpm-pkg or bindeb-pkg target instead."; \
+	echo >&2; \
 	false; \
 fi ; \
 $(srctree)/scripts/setlocalversion --save-scmversion; \
-- 
2.7.4

