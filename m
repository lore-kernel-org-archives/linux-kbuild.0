Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729470AbeLZWlb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Dec 2018 17:41:31 -0500
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 52/59] kbuild: fix false positive warning/error about missing libelf
Date: Wed, 26 Dec 2018 17:38:32 -0500
Message-Id: <20181226223839.150262-52-sashal@kernel.org>
In-Reply-To: <20181226223839.150262-1-sashal@kernel.org>
References: <20181226223839.150262-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit ef7cfd00b2caf6edeb7f169682b64be2d0a798cf ]

For the same reason as commit 25896d073d8a ("x86/build: Fix compiler
support check for CONFIG_RETPOLINE"), you cannot put this $(error ...)
into the parse stage of the top Makefile.

Perhaps I'd propose a more sophisticated solution later, but this is
the best I can do for now.

Link: https://lkml.org/lkml/2017/12/25/211
Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Reported-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
Reported-by: Qian Cai <cai@lca.pw>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Tested-by: Qian Cai <cai@lca.pw>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 280c7193e246..f72fb4b403b7 100644
--- a/Makefile
+++ b/Makefile
@@ -954,11 +954,6 @@ ifdef CONFIG_STACK_VALIDATION
   ifeq ($(has_libelf),1)
     objtool_target := tools/objtool FORCE
   else
-    ifdef CONFIG_UNWINDER_ORC
-      $(error "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
-    else
-      $(warning "Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
-    endif
     SKIP_STACK_VALIDATION := 1
     export SKIP_STACK_VALIDATION
   endif
@@ -1102,6 +1097,14 @@ uapi-asm-generic:
 
 PHONY += prepare-objtool
 prepare-objtool: $(objtool_target)
+ifeq ($(SKIP_STACK_VALIDATION),1)
+ifdef CONFIG_UNWINDER_ORC
+	@echo "error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel" >&2
+	@false
+else
+	@echo "warning: Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel" >&2
+endif
+endif
 
 # Check for CONFIG flags that require compiler support. Abort the build
 # after .config has been processed, but before the kernel build starts.
-- 
2.19.1
