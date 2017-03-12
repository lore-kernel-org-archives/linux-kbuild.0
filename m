Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33206 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755697AbdCLMLD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Mar 2017 08:11:03 -0400
From: Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH] kbuild: strip the last slash in KBUILD_EXTMOD
Date: Sun, 12 Mar 2017 20:01:14 +0800
Message-Id: <20170312120114.14296-1-richard.weiyang@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

Current kbuild will build the target again if we run "make M=dir" and "make
M=dir/" by turns, since if_changed will see the prerequisite is changed.
The behavior may confuse the user a little, since actually we are building
the same target and no difference.

According to current implementation in scripts/Makefile.build, the obj
passed to next level is a directory name with last slash stripped. This
patch strips the last slash, and slashes in case user doing so, in
KBUILD_EXTMOD which is assigned from "M=".

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
CC: Masahiro Yamada <yamada.masahiro@socionext.com>

---
v2:
   * remote the temp variable __KBUILD_EXTMOD, since this breaks the user
     case
   * use realpath to strips all the slash at the end, then remote the
     common part if it is an in tree build to make it the same behavior as
     previous version
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index b8dfb24b1911..7f12e88cc0fb 100644
--- a/Makefile
+++ b/Makefile
@@ -191,6 +191,8 @@ ifeq ("$(origin M)", "command line")
   KBUILD_EXTMOD := $(M)
 endif
 
+KBUILD_EXTMOD := $(subst $(CURDIR)/,,$(realpath $(KBUILD_EXTMOD)))
+
 # If building an external module we do not care about the all: rule
 # but instead _all depend on modules
 PHONY += all
-- 
2.11.0

