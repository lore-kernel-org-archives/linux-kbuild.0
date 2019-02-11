Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f202.google.com ([209.85.210.202]:40688 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731469AbfBKTaj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 14:30:39 -0500
Received: by mail-pf1-f202.google.com with SMTP id g9so59971pfe.7
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2019 11:30:39 -0800 (PST)
Date: Mon, 11 Feb 2019 11:30:04 -0800
In-Reply-To: <20190211193008.24101-1-ndesaulniers@google.com>
Message-Id: <20190211193008.24101-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190211193008.24101-1-ndesaulniers@google.com>
Subject: [PATCH v2 2/4] Makefile: clang: choose GCC_TOOLCHAIN_DIR not on LD
From: ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: natechancellor@gmail.com, sedat.dilek@gmail.com, keescook@chromium.org, samitolvanen@google.com, michal.lkml@markovi.net, akpm@linux-foundation.org, hannes@cmpxchg.org, peterz@infradead.org, linux@dominikbrodowski.net, npiggin@gmail.com, mathieu.desnoyers@efficios.com, gor@linux.ibm.com, adrian@lisas.de, rgb@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>

This causes an issue when trying to build with `make LD=ld.lld` if
ld.lld and the rest of your cross tools aren't in the same directory
(ex. /usr/local/bin) (as is the case for Android's build system), as the
GCC_TOOLCHAIN_DIR then gets set based on `which $(LD)` which will point
where LLVM tools are, not GCC/binutils tools are located.

Instead, select the GCC_TOOLCHAIN_DIR based on another tool provided by
binutils for which LLVM does not provide a substitute for, such as
elfedit.

Fixes commit 785f11aa595b ("kbuild: Add better clang cross build support")

Link: https://github.com/ClangBuiltLinux/linux/issues/341
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1->V2:
* add reviewed and tested tags.

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 86cf35d1d79d..d3b65e96d183 100644
--- a/Makefile
+++ b/Makefile
@@ -492,7 +492,7 @@ endif
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
-GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
+GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)
 GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
 endif
-- 
2.20.1.791.gb4d0f1c61a-goog
