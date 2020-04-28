Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726884AbgD1WOr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 18:14:47 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v4 3/5] MIPS: Unconditionally specify '-EB' or '-EL'
Date: Tue, 28 Apr 2020 15:14:17 -0700
Message-Id: <20200428221419.2530697-4-natechancellor@gmail.com>
In-Reply-To: <20200428221419.2530697-1-natechancellor@gmail.com>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>, Nathan Chancellor <natechancellor@gmail.com>

This was all done to work around a GCC bug that has been fixed after
4.2. The kernel requires GCC 4.6 or newer so remove all of these hacks
and just use the traditional flags.

 $ mips64-linux-gcc --version | head -n1
 mips64-linux-gcc (GCC) 4.6.3

 $ mips64-linux-gcc -EB -dM -E -C -x c /dev/null | grep MIPSE
 #define MIPSEB 1
 #define __MIPSEB__ 1
 #define _MIPSEB 1
 #define __MIPSEB 1

 $ mips64-linux-gcc -EL -dM -E -C -x c /dev/null | grep MIPSE
 #define __MIPSEL__ 1
 #define MIPSEL 1
 #define _MIPSEL 1
 #define __MIPSEL 1

This is necessary when converting the MIPS VDSO to use $(LD) instead of
$(CC) to link because the OUTPUT_FORMAT is defaulted to little endian
and only flips to big endian when '-EB' is set on the command line.
There is no issue currently because the compiler explicitly passes
'-EB' or '-EL' to the linker regardless of whether or not it was
provided by the user. Passing '-v' to VDSO_LDFLAGS shows:

<gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/collect2 ... -EB ...

even though '-EB' is nowhere to be found in KBUILD_CFLAGS. The VDSO
Makefile already supports getting '-EB' or '-EL' from KBUILD_CFLAGS
through a filter directive but '-EB' or '-EL' is not always present.

If we do not do this, we will see the following error when compiling
for big endian:

$ make -j$(nproc) ARCH=mips CROSS_COMPILE=mips64-linux- \
  64r2el_defconfig arch/mips/vdso/
...
mips64-linux-ld: arch/mips/vdso/elf.o: compiled for a big endian system
and target is little endian
mips64-linux-ld: arch/mips/vdso/elf.o: endianness incompatible with that
of the selected emulation
mips64-linux-ld: failed to merge target specific data of file
arch/mips/vdso/elf.o
...

Remove this legacy hack and just use '-EB' and '-EL' unconditionally.

Reported-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v3 -> v4:

* New patch.

 arch/mips/Makefile | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44aed81565..301efb90b51ed 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -116,33 +116,8 @@ endif
 
 cflags-y += -ffreestanding
 
-#
-# We explicitly add the endianness specifier if needed, this allows
-# to compile kernels with a toolchain for the other endianness. We
-# carefully avoid to add it redundantly because gcc 3.3/3.4 complains
-# when fed the toolchain default!
-#
-# Certain gcc versions up to gcc 4.1.1 (probably 4.2-subversion as of
-# 2006-10-10 don't properly change the predefined symbols if -EB / -EL
-# are used, so we kludge that here.  A bug has been filed at
-# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=29413.
-#
-# clang doesn't suffer from these issues and our checks against -dumpmachine
-# don't work so well when cross compiling, since without providing --target
-# clang's output will be based upon the build machine. So for clang we simply
-# unconditionally specify -EB or -EL as appropriate.
-#
-ifdef CONFIG_CC_IS_CLANG
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -EB
 cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -EL
-else
-undef-all += -UMIPSEB -U_MIPSEB -U__MIPSEB -U__MIPSEB__
-undef-all += -UMIPSEL -U_MIPSEL -U__MIPSEL -U__MIPSEL__
-predef-be += -DMIPSEB -D_MIPSEB -D__MIPSEB -D__MIPSEB__
-predef-le += -DMIPSEL -D_MIPSEL -D__MIPSEL -D__MIPSEL__
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(shell $(CC) -dumpmachine |grep -q 'mips.*el-.*' && echo -EB $(undef-all) $(predef-be))
-cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= $(shell $(CC) -dumpmachine |grep -q 'mips.*el-.*' || echo -EL $(undef-all) $(predef-le))
-endif
 
 cflags-$(CONFIG_SB1XXX_CORELIS)	+= $(call cc-option,-mno-sched-prolog) \
 				   -fno-omit-frame-pointer
-- 
2.26.2
