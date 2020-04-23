Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729873AbgDWRSf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 13:18:35 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link VDSO
Date: Thu, 23 Apr 2020 10:18:06 -0700
Message-Id: <20200423171807.29713-3-natechancellor@gmail.com>
In-Reply-To: <20200423171807.29713-1-natechancellor@gmail.com>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>, Nathan Chancellor <natechancellor@gmail.com>

Currently, the VDSO is being linked through $(CC). This does not match
how the rest of the kernel links objects, which is through the $(LD)
variable.

When clang is built in a default configuration, it first attempts to use
the target triple's default linker then the system's default linker,
unless told otherwise through -fuse-ld=... We do not use -fuse-ld=
because it can be brittle and we have support for invoking $(LD)
directly. See commit fe00e50b2db8c ("ARM: 8858/1: vdso: use $(LD)
instead of $(CC) to link VDSO") and commit 691efbedc60d2 ("arm64: vdso:
use $(LD) instead of $(CC) to link VDSO") for examples of doing this in
the VDSO.

Do the same thing here. Replace the custom linking logic with $(cmd_ld)
and ldflags-y so that $(LD) is respected.

Before this patch, LD=ld.lld did nothing:

$ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
String dump of section '.comment':
[     0] ClangBuiltLinux clang version 11.0.0

After this patch, it does:

$ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
String dump of section '.comment':
[     0] Linker: LLD 11.0.0
[    62] ClangBuiltLinux clang version 11.0.0

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v2 -> v3:

* New patch.

 arch/mips/vdso/Makefile | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 92b53d1df42c3..da5db947072d5 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -60,10 +60,9 @@ ifdef CONFIG_MIPS_DISABLE_VDSO
 endif
 
 # VDSO linker flags.
-VDSO_LDFLAGS := \
-	-Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1 \
-	$(addprefix -Wl$(comma),$(filter -E%,$(KBUILD_CFLAGS))) \
-	-nostdlib -shared -Wl,--hash-style=sysv -Wl,--build-id
+ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
+	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
+	--hash-style=sysv --build-id -T
 
 CFLAGS_REMOVE_vdso.o = -pg
 
@@ -82,11 +81,7 @@ quiet_cmd_vdso_mips_check = VDSOCHK $@
 #
 
 quiet_cmd_vdsold_and_vdso_check = LD      $@
-      cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check); $(cmd_vdso_mips_check)
-
-quiet_cmd_vdsold = VDSO    $@
-      cmd_vdsold = $(CC) $(c_flags) $(VDSO_LDFLAGS) \
-                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
+      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check); $(cmd_vdso_mips_check)
 
 quiet_cmd_vdsoas_o_S = AS      $@
       cmd_vdsoas_o_S = $(CC) $(a_flags) -c -o $@ $<
-- 
2.26.2
