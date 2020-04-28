Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726946AbgD1WOs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 18:14:48 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v4 5/5] MIPS: VDSO: Allow ld.lld to link the VDSO
Date: Tue, 28 Apr 2020 15:14:19 -0700
Message-Id: <20200428221419.2530697-6-natechancellor@gmail.com>
In-Reply-To: <20200428221419.2530697-1-natechancellor@gmail.com>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>, Nathan Chancellor <natechancellor@gmail.com>

Currently, when linking with ld.lld, this warning pops up:

    arch/mips/vdso/Makefile:70: MIPS VDSO requires binutils >= 2.25

CONFIG_LD_VERSION is set with scripts/ld-version.sh, which is specific
to GNU ld. It returns 0 for ld.lld so CONFIG_MIPS_LD_CAN_LINK_VDSO does
not set.

ld.lld has a completely different versioning scheme (as it follows
LLVM's versioning) and it does not have the issue mentioned in the
comment block so it should be allowed to link the VDSO.

With this patch, the VDSO successfully links and shows P_MIPS_PC32 in
vgettimeofday.o.

$ llvm-objdump -Dr arch/mips/vdso/vgettimeofday.o | grep R_MIPS_PC32
			00000024:  R_MIPS_PC32	_start
			000000b0:  R_MIPS_PC32	_start
			000002bc:  R_MIPS_PC32	_start
			0000036c:  R_MIPS_PC32	_start
			00000468:  R_MIPS_PC32	_start

Reported-by: Dmitry Golovin <dima@golovin.in>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/785
Link: https://github.com/llvm/llvm-project/commit/e364e2e9ce50c12eb2bf093560e1a1a8544d455a
---

v3 -> v4:

* No changes.

v2 -> v3:

* No changes.

v1 -> v2:

* Move into Kconfig so that the warning does not happen.

 arch/mips/vdso/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
index 36a52158d849b..7aec721398d59 100644
--- a/arch/mips/vdso/Kconfig
+++ b/arch/mips/vdso/Kconfig
@@ -12,7 +12,7 @@
 # the lack of relocations. As such, we disable the VDSO for microMIPS builds.
 
 config MIPS_LD_CAN_LINK_VDSO
-	def_bool LD_VERSION >= 225000000
+	def_bool LD_VERSION >= 225000000 || LD_IS_LLD
 
 config MIPS_DISABLE_VDSO
 	def_bool CPU_MICROMIPS || (!CPU_MIPSR6 && !MIPS_LD_CAN_LINK_VDSO)
-- 
2.26.2
