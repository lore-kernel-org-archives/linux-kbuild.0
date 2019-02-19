Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:52740 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfBSJd2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 04:33:28 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/5] kbuild: remove unimportant comments from ./Kbuild
Date: Tue, 19 Feb 2019 18:33:03 +0900
Message-Id: <1550568787-18710-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org

Every time we add/remove a target, we need to touch the header part,
including renumbering. This is not so important information.

Numbering targets is rather misleading because they are not necessarily
generated in this order. For example, 1) and 2) can be executed
simultaneously when the -j option is given.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Kbuild | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/Kbuild b/Kbuild
index 4cebcc7..a07bbd6 100644
--- a/Kbuild
+++ b/Kbuild
@@ -1,14 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Kbuild for top-level directory of the kernel
-# This file takes care of the following:
-# 1) Generate bounds.h
-# 2) Generate timeconst.h
-# 3) Generate asm-offsets.h (may need bounds.h and timeconst.h)
-# 4) Check for missing system calls
 
 #####
-# 1) Generate bounds.h
+# Generate bounds.h
 
 bounds-file := include/generated/bounds.h
 
@@ -19,7 +14,7 @@ $(bounds-file): kernel/bounds.s FORCE
 	$(call filechk,offsets,__LINUX_BOUNDS_H__)
 
 #####
-# 2) Generate timeconst.h
+# Generate timeconst.h
 
 timeconst-file := include/generated/timeconst.h
 
@@ -31,8 +26,7 @@ $(timeconst-file): kernel/time/timeconst.bc FORCE
 	$(call filechk,gentimeconst)
 
 #####
-# 3) Generate asm-offsets.h
-#
+# Generate asm-offsets.h
 
 offsets-file := include/generated/asm-offsets.h
 
@@ -45,8 +39,7 @@ $(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s FORCE
 	$(call filechk,offsets,__ASM_OFFSETS_H__)
 
 #####
-# 4) Check for missing system calls
-#
+# Check for missing system calls
 
 always += missing-syscalls
 targets += missing-syscalls
-- 
2.7.4
