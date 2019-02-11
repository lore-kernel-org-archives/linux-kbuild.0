Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f201.google.com ([209.85.166.201]:56347 "EHLO
        mail-it1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388262AbfBKTap (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 14:30:45 -0500
Received: by mail-it1-f201.google.com with SMTP id 135so91989itb.6
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2019 11:30:45 -0800 (PST)
Date: Mon, 11 Feb 2019 11:30:05 -0800
In-Reply-To: <20190211193008.24101-1-ndesaulniers@google.com>
Message-Id: <20190211193008.24101-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190211193008.24101-1-ndesaulniers@google.com>
Subject: [PATCH v2 3/4] Makefile: lld: tell clang to use lld
From: ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: natechancellor@gmail.com, sedat.dilek@gmail.com, keescook@chromium.org, samitolvanen@google.com, michal.lkml@markovi.net, akpm@linux-foundation.org, hannes@cmpxchg.org, peterz@infradead.org, linux@dominikbrodowski.net, npiggin@gmail.com, mathieu.desnoyers@efficios.com, gor@linux.ibm.com, adrian@lisas.de, rgb@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>

This is needed because clang doesn't select which linker to use based on
$LD but rather -fuse-ld=lld. This is problematic especially for
cc-ldoption, which checks for linker flag support via invoking the
compiler, rather than the linker.

Link: https://github.com/ClangBuiltLinux/linux/issues/342
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1->V2:
* add reviewed and tested by tags.
* move this addition up 2 statments so that it's properly added to
  KBUILD_*FLAGS as per Nathan.

 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index d3b65e96d183..00e8e01d23fc 100644
--- a/Makefile
+++ b/Makefile
@@ -500,6 +500,9 @@ ifneq ($(GCC_TOOLCHAIN),)
 CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
 CLANG_FLAGS	+= -no-integrated-as
+ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
+CLANG_FLAGS	+= -fuse-ld=lld
+endif
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
-- 
2.20.1.791.gb4d0f1c61a-goog
