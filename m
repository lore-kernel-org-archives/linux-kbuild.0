Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36623 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfH0AmH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Aug 2019 20:42:07 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] kbuild: Do not enable -Wimplicit-fallthrough for clang for now
Date: Mon, 26 Aug 2019 17:41:55 -0700
Message-Id: <20190827004155.11366-1-natechancellor@gmail.com>
In-Reply-To: <20190815225844.145726-1-nhuck@google.com>
References: <20190815225844.145726-1-nhuck@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nathan Huckleberry <nhuck@google.com>, Joe Perches <joe@perches.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>

This functionally reverts commit bfd77145f35c ("Makefile: Convert
-Wimplicit-fallthrough=3 to just -Wimplicit-fallthrough for clang").

clang enabled support for -Wimplicit-fallthrough in C in r369414 [1],
which causes a lot of warnings when building the kernel for two reasons:

1. Clang does not support the /* fall through */ comments. There seems
   to be a general consensus in the LLVM community that this is not
   something they want to support. Joe Perches wrote a script to convert
   all of the comments to a "fallthrough" keyword that will be added to
   compiler_attributes.h [2] [3], which catches the vast majority of the
   comments. There doesn't appear to be any consensus in the kernel
   community when to do this conversion.

2. Clang and GCC disagree about falling through to final case statements
   with no content or cases that simply break:

   https://godbolt.org/z/c8csDu

   This difference contributes at least 50 warnings in an allyesconfig
   build for x86, not considering other architectures. This difference
   will need to be discussed to see which compiler is right [4] [5].

[1]: https://github.com/llvm/llvm-project/commit/1e0affb6e564b7361b0aadb38805f26deff4ecfc
[2]: https://lore.kernel.org/lkml/61ddbb86d5e68a15e24ccb06d9b399bbf5ce2da7.camel@perches.com/
[3]: https://lore.kernel.org/lkml/1d2830aadbe9d8151728a7df5b88528fc72a0095.1564549413.git.joe@perches.com/
[4]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91432
[5]: https://github.com/ClangBuiltLinux/linux/issues/636

Given these two problems need discussion and coordination, do not enable
-Wimplicit-fallthrough with clang right now. Add a comment to explain
what is going on as well. This commit should be reverted once these two
issues are fully flushed out and resolved.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index f125625efd60..6007a56bdbee 100644
--- a/Makefile
+++ b/Makefile
@@ -751,6 +751,11 @@ else
 # These warnings generated too much noise in a regular build.
 # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
 KBUILD_CFLAGS += -Wno-unused-but-set-variable
+
+# Warn about unmarked fall-throughs in switch statement.
+# Disabled for clang while comment to attribute conversion happens and
+# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
 endif
 
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
@@ -845,9 +850,6 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 # warn about C99 declaration after statement
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
-# Warn about unmarked fall-throughs in switch statement.
-KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
-
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
 
-- 
2.23.0
