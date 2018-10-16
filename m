Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36316 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbeJPKDp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Oct 2018 06:03:45 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] Kbuild: Hide Clang's -Wempty-body behind W=1
Date: Mon, 15 Oct 2018 19:14:55 -0700
Message-Id: <20181016021454.11953-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, Nathan Chancellor <natechancellor@gmail.com>

There are only a few instances of this warning in an arm64 allyesconfig
build but none of them appear useful. I believe the intention of the
warning is to avoid situations like this:

if (condition);
        statement;

where the user really intended

if (condition)
        statement;

However, these instances have already been caught by GCC's warning about
misleading indentation so the remaining warnings are about loops that
fall into one of three categories:

1. Execute a function unconditionally (avoiding a useless variable to
   hold the return value):

drivers/isdn/hisax/hfc_pci.c:131:34: warning: if statement has empty body
[-Wempty-body]
        if (Read_hfc(cs, HFCPCI_INT_S1));
                                        ^

2. Advancing a value to be used later on in the function like a pointer
   or a count:

drivers/atm/eni.c:244:48: warning: for loop has empty body
[-Wempty-body]
        for (order = 0; (1 << order) < *size; order++);
                                                      ^

3. Busy waiting:

drivers/atm/zatm.c:513:7: warning: while loop has empty body
[-Wempty-body]
        zwait;
             ^

None of these uses are problematic or need to be addressed. Clang
suggests moving the semi-colon to the next line to silence these
warnings but that defeats the purpose of the compact nature of these
constructs so just hide the warning behind W=1 so its use can still be
audited but it won't polute a regular build.

Link: https://github.com/ClangBuiltLinux/linux/issues/42
Link: https://github.com/ClangBuiltLinux/linux/issues/66
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 scripts/Makefile.extrawarn | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index cf6cd0ef6975..8709d9d6faf1 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -11,6 +11,7 @@
 # are not supported by all versions of the compiler
 # ==========================================================================
 
+KBUILD_CFLAGS += $(call cc-disable-warning, empty-body)
 KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
 
 ifeq ("$(origin W)", "command line")
@@ -32,6 +33,7 @@ warning-1 += $(call cc-option, -Wpacked-not-aligned)
 warning-1 += $(call cc-option, -Wstringop-truncation)
 warning-1 += $(call cc-disable-warning, missing-field-initializers)
 warning-1 += $(call cc-disable-warning, sign-compare)
+warning-1 += $(call cc-option, -Wempty-body)
 
 warning-2 := -Waggregate-return
 warning-2 += -Wcast-align
-- 
2.19.1
