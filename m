Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgDSSFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Apr 2020 14:05:02 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 2/2] MIPS: VDSO: Do not disable VDSO when linking with ld.lld
Date: Sun, 19 Apr 2020 11:04:45 -0700
Message-Id: <20200419180445.26722-2-natechancellor@gmail.com>
In-Reply-To: <20200419180445.26722-1-natechancellor@gmail.com>
References: <20200419180445.26722-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>, Nathan Chancellor <natechancellor@gmail.com>

Currently, when linking with ld.lld, this warning pops up:

    arch/mips/vdso/Makefile:70: MIPS VDSO requires binutils >= 2.25

ld-ifversion calls ld-version, which calls scripts/ld-version.sh, which
is specific to GNU ld. ld.lld has a completely different versioning
scheme (as it follows LLVM's versioning) and it does not have the issue
mentioned in the comment above this block so it should not be subjected
to this check.

With this patch, the VDSO successfully links and shows P_MIPS_PC32 in
vgettimeofday.o.

$ llvm-objdump -Dr arch/mips/vdso/vgettimeofday.o | grep R_MIPS_PC32
			00000024:  R_MIPS_PC32	_start
			000000b0:  R_MIPS_PC32	_start
			000002bc:  R_MIPS_PC32	_start
			0000036c:  R_MIPS_PC32	_start
			00000468:  R_MIPS_PC32	_start

Link: https://github.com/ClangBuiltLinux/linux/issues/785
Link: https://github.com/llvm/llvm-project/commit/e364e2e9ce50c12eb2bf093560e1a1a8544d455a
Reported-by: Dmitry Golovin <dima@golovin.in>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/vdso/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index d7fe8408603e..f99e583d14a1 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -65,9 +65,11 @@ DISABLE_VDSO := n
 # the comments on that file.
 #
 ifndef CONFIG_CPU_MIPSR6
-  ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
-    $(warning MIPS VDSO requires binutils >= 2.25)
-    DISABLE_VDSO := y
+  ifndef CONFIG_LD_IS_LLD
+    ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
+      $(warning MIPS VDSO requires binutils >= 2.25)
+      DISABLE_VDSO := y
+    endif
   endif
 endif
 
-- 
2.26.1
