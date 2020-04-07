Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:37547 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGSo3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 14:44:29 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 1/2] kbuild: replace AS=clang with LLVM_IA=1
Date: Wed,  8 Apr 2020 03:43:35 +0900
Message-Id: <20200407184336.14612-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: clang-built-linux@googlegroups.com, Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

The 'AS' variable is unused for building the kernel. Only the remaining
usage is to turn on the integrated assembler. A boolean flag is a better
fit for this purpose.

AS=clang was added for experts. So, I replaced it with LLVM_IA=1,
breaking the backward compatibility.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 Documentation/kbuild/llvm.rst | 5 ++++-
 Makefile                      | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index eefbdfa3e4d9..2b40afa58049 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -50,11 +50,14 @@ LLVM Utilities
 LLVM has substitutes for GNU binutils utilities. These can be invoked as
 additional parameters to `make`.
 
-	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
+	make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
 	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
 	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
 	  HOSTLD=ld.lld
 
+Currently, the integrated assembler is disabled by default. You can pass
+LLVM_IA=1 to enable it.
+
 Getting Help
 ------------
 
diff --git a/Makefile b/Makefile
index 1b2691057cb5..f9beb696d6d3 100644
--- a/Makefile
+++ b/Makefile
@@ -538,7 +538,7 @@ endif
 ifneq ($(GCC_TOOLCHAIN),)
 CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
-ifeq ($(if $(AS),$(shell $(AS) --version 2>&1 | head -n 1 | grep clang)),)
+ifneq ($(LLVM_IA),1)
 CLANG_FLAGS	+= -no-integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
-- 
2.17.1
