Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f73.google.com ([209.85.166.73]:42177 "EHLO
        mail-io1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbfDBHJQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Apr 2019 03:09:16 -0400
Received: by mail-io1-f73.google.com with SMTP id i1so10238947ioq.9
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Apr 2019 00:09:15 -0700 (PDT)
Date: Tue,  2 Apr 2019 00:08:58 -0700
In-Reply-To: <CAK7LNAQw7nPwykOEV5i+yWjkxzgf1gPa5ewFhDxbbn8XXjwFUA@mail.gmail.com>
Message-Id: <20190402070858.49597-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAK7LNAQw7nPwykOEV5i+yWjkxzgf1gPa5ewFhDxbbn8XXjwFUA@mail.gmail.com>
Subject: [PATCH v3] Makefile: lld: tell clang to use lld
From: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: keescook@chromium.org, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This is needed because clang doesn't select which linker to use based on
$LD but rather -fuse-ld={bfd,gold,lld,<absolute path to linker>}.  This
is problematic especially for cc-ldoption, which checks for linker flag
support via invoking the compiler, rather than the linker.

Select the linker via absolute path from $PATH via `which`. This allows
you to build with:

$ make LD=ld.lld
$ make LD=ld.lld-8
$ make LD=/path/to/ld.lld

Add -Qunused-arguments to KBUILD_CPPFLAGS when using LLD, as otherwise
Clang likes to complain about -fuse-lld= being unused when compiling but
not linking (-c) such as when cc-option is used.

Link: https://github.com/ClangBuiltLinux/linux/issues/342
Link: https://github.com/ClangBuiltLinux/linux/issues/366
Link: https://github.com/ClangBuiltLinux/linux/issues/357
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V2->V3:
* Use absolute path based on `which $LD` as per Masahiro.
* Add -Qunused-arguments.
* Drop tested-by/reviewed-by tags, since this patched has changed enough
  to warrant re-testing/re-review, IMO.
* Add more info to the commit message.
Changes V1->V2:
* add reviewed and tested by tags.
* move this addition up 2 statments so that it's properly added to
  KBUILD_*FLAGS as per Nathan.

 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 026fbc450906..895c076b6305 100644
--- a/Makefile
+++ b/Makefile
@@ -514,6 +514,10 @@ ifneq ($(GCC_TOOLCHAIN),)
 CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
 CLANG_FLAGS	+= -no-integrated-as
+ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
+CLANG_FLAGS	+= -fuse-ld=$(shell which $(LD))
+KBUILD_CPPFLAGS += -Qunused-arguments
+endif
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
-- 
2.21.0.392.gf8f6787159e-goog
