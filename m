Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670772;
	b=3XX4HfUAElpLVnA5ZqLuqpQA+tGq2TEE5YVH1IfSUzH64i7RaI55/X9zimg+A78gSfJv
	 5/rG9vUXzRA2XpUbOGx7mmu2dM95nJz318bDzdb3g6WbsP+79uXw+zmQhef+0/IXcbvWD
	 ckoG7X7vgRxVdwNSWaqhxKgKP3XDwq3jWmTfPwxDMJIg+IBs1r0bSfuyzInAkW/6rTWRG
	 IHjHwkWv4TFsuhj+YBAe6k0dQ9qpVZCYHLT7pgxEUhjNjX63dbfPdEeQTDUrmE1G96ojm
	 PTLr8fCFCa+6nKuy5d+V36ZBUt9MTgE3bA9U/CLfMshrcjDP+qZm4FSnTBt/6Drr4Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670772;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yhsRVfZgiE+d4WoG5KGz9RjPRmLHvtxePVTYOKg1uNs=;
	b=qswQzTlNFVHKbF/U+mb3jFyan4oa6U9I7tB50juAjJBeur4yQcr91wLgbG8tCgaRiaXA
	 p8kR6TGFefSfZagvRnmKaH3G+jtAvZKzMn6GR9P6ubuyv+e94bueBW8Aw53KXM4JbEZN2
	 AJh2QrGfN1+cR18SFl+6Q8J/VCLA62VM/xaHu2qunEo+295lP04NNdxBnVGeLyS31XR/9
	 uL+4wx8AzMJuPQ+27WGNjiAc1yjj1N5zuV6MOrh2+ePQEB4vgr4+UOp5/1UPdWsq0d7ik
	 ERHYqjyBtGNuROjfEcAs0VXuFiOZcKmK9s0+j6AV92Lt+vkoY39Pf2gGwwlvTaZ6ooA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVMkMcrM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343B1606A330;
	Tue,  3 Nov 2026 01:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVMkMcrM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4031F00A02;
	Tue,  3 Nov 2026 01:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670770;
	bh=yhsRVfZgiE+d4WoG5KGz9RjPRmLHvtxePVTYOKg1uNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZVMkMcrMdEI04P7gRFzU/7HNRRZGSP4WFgv1IUy7ja342aOY7Db/Y442shpBd3cyh
	 EbDBat1NH750rZdBywnulVaz4icDwzSzon6JIPXAWXmWDDofL6Keg9zipzhXPp8z9A
	 GY2y1FdXXWIdziowj1JoWv7wSgh4J/eWyybskEW0olqqcBP6LYKUvhcBo1xDFM6ksr
	 qnJN94gYPBbgP1iulVHQ8UemZJoD2q965+SBjewDWrWBBXphPB24eTPKRDoyP7kESH
	 XStjEkY8huzqvcDYRHYSJy4SHOiGf/vhUCEkAtzHZV0HvQ4O650XT/tIjZuIAad5iP
	 9n0ijPIDQtUzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	workflows@vger.kernel.org,
	Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH v2 02/20] kbuild: unify static coverage instrumentation as COVERAGE_PROFILE
Date: Mon,  2 Nov 2026 20:52:20 -0500
Message-ID: <20261103015238.3780910-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The gcov plumbing is written for a single coverage implementation: the
per-object and per-directory knobs are called GCOV_PROFILE, the flags
are CFLAGS_GCOV, and every dependency on "coverage instrumentation is
present" spells it as GCOV_KERNEL. Make this generic so that further
coverage implementations can share it instead of growing parallel
copies:

 - The coverage implementation becomes a choice ("Code coverage
   measurement"), with gcov as its only member besides "None" for now.
   COVERAGE_KERNEL is set whenever one is selected. allyesconfig and
   allmodconfig keep selecting gcov through a COMPILE_TEST default.

 - GCOV_PROFILE_ALL becomes COVERAGE_PROFILE_ALL. The old symbol is
   kept as a transitional one so that existing configurations keep
   profiling the entire kernel.

 - GCOV_PROFILE[_obj.o] becomes COVERAGE_PROFILE[_obj.o] tree-wide,
   with unchanged precedence (object, then directory, then
   COVERAGE_PROFILE_ALL). Out-of-tree modules that use GCOV_PROFILE
   need the same rename.

 - scripts/Makefile.gcov sets CFLAGS_COVERAGE instead of CFLAGS_GCOV.

 - The per-subsystem opt-ins GCOV_PROFILE_{NETFILTER,IPSET,IPVS,RDS,
   AMDGPU,URING,FTRACE} become COVERAGE_PROFILE_*, again with the old
   names kept as transitional symbols. The rds selftest is updated.

 - Dependencies that are about instrumented code rather than about
   gcov (LTO, the KCFI integer normalization workaround, the longest
   symbol KUnit test, the per-subsystem opt-ins and objtool's
   --no-unreachable) now use COVERAGE_KERNEL.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/dev-tools/gcov.rst              |  18 +--
 .../translations/zh_CN/dev-tools/gcov.rst     |  16 +--
 .../translations/zh_TW/dev-tools/gcov.rst     |  16 +--
 arch/Kconfig                                  |   6 +-
 arch/alpha/boot/compressed/Makefile           |   2 +-
 arch/parisc/kernel/vdso32/Makefile            |   2 +-
 arch/parisc/kernel/vdso64/Makefile            |   2 +-
 arch/powerpc/kernel/Makefile                  |   6 +-
 arch/powerpc/kernel/trace/Makefile            |   4 +-
 arch/powerpc/kexec/Makefile                   |   2 +-
 arch/powerpc/xmon/Makefile                    |   2 +-
 arch/s390/boot/Makefile                       |   2 +-
 arch/s390/kernel/Makefile                     |   2 +-
 arch/sh/mm/Makefile                           |   2 +-
 arch/x86/coco/sev/Makefile                    |   2 +-
 arch/x86/platform/efi/Makefile                |   2 +-
 arch/xtensa/boot/lib/Makefile                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig            |  12 +-
 drivers/gpu/drm/amd/amdgpu/Makefile           |   4 +-
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   2 +-
 drivers/gpu/drm/i915/Makefile                 |   2 +-
 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/s390/char/Makefile                    |   2 +-
 init/Kconfig                                  |   9 +-
 io_uring/Makefile                             |   4 +-
 kernel/coverage/Kconfig                       | 103 +++++++++++++++++-
 kernel/coverage/gcov/Kconfig                  |  55 ----------
 kernel/trace/Kconfig                          |   9 +-
 kernel/trace/Makefile                         |   4 +-
 lib/Kconfig.debug                             |   2 +-
 lib/Makefile                                  |   2 +-
 lib/crypto/Makefile                           |   2 +-
 net/bridge/Makefile                           |   8 +-
 net/bridge/netfilter/Makefile                 |   4 +-
 net/ipv4/Makefile                             |   4 +-
 net/ipv4/netfilter/Makefile                   |   4 +-
 net/ipv6/Makefile                             |   4 +-
 net/ipv6/netfilter/Makefile                   |   4 +-
 net/netfilter/Kconfig                         |   9 +-
 net/netfilter/Makefile                        |   4 +-
 net/netfilter/ipset/Kconfig                   |   9 +-
 net/netfilter/ipset/Makefile                  |   4 +-
 net/netfilter/ipvs/Kconfig                    |   9 +-
 net/netfilter/ipvs/Makefile                   |   4 +-
 net/rds/Kconfig                               |   9 +-
 net/rds/Makefile                              |   4 +-
 scripts/Makefile.gcov                         |  12 +-
 scripts/Makefile.lib                          |  14 +--
 scripts/Makefile.modfinal                     |   2 +-
 scripts/sbom/sbom/environment.py              |   2 +-
 tools/testing/selftests/net/rds/config.sh     |   9 +-
 tools/testing/selftests/net/rds/rds_run.sh    |   8 +-
 52 files changed, 241 insertions(+), 188 deletions(-)
 delete mode 100644 kernel/coverage/gcov/Kconfig

diff --git a/Documentation/dev-tools/gcov.rst b/Documentation/dev-tools/gcov.rst
index 075df6a4598d8..b6910c3fc00dd 100644
--- a/Documentation/dev-tools/gcov.rst
+++ b/Documentation/dev-tools/gcov.rst
@@ -36,10 +36,10 @@ Configure the kernel with::
 
 and to get coverage data for the entire kernel::
 
-        CONFIG_GCOV_PROFILE_ALL=y
+        CONFIG_COVERAGE_PROFILE_ALL=y
 
 Note that kernels compiled with profiling flags will be significantly
-larger and run slower. Also CONFIG_GCOV_PROFILE_ALL may not be supported
+larger and run slower. Also CONFIG_COVERAGE_PROFILE_ALL may not be supported
 on all architectures.
 
 Profiling data will only become accessible once debugfs has been
@@ -56,20 +56,20 @@ similar to the following to the respective kernel Makefile:
 
 - For a single file (e.g. main.o)::
 
-	GCOV_PROFILE_main.o := y
+	COVERAGE_PROFILE_main.o := y
 
 - For all files in one directory::
 
-	GCOV_PROFILE := y
+	COVERAGE_PROFILE := y
 
-To exclude files from being profiled even when CONFIG_GCOV_PROFILE_ALL
+To exclude files from being profiled even when CONFIG_COVERAGE_PROFILE_ALL
 is specified, use::
 
-	GCOV_PROFILE_main.o := n
+	COVERAGE_PROFILE_main.o := n
 
 and::
 
-	GCOV_PROFILE := n
+	COVERAGE_PROFILE := n
 
 Only files which are linked to the main kernel image or are compiled as
 kernel modules are supported by this mechanism.
@@ -80,7 +80,7 @@ Module specific configs
 
 Gcov kernel configs for specific modules are described below:
 
-CONFIG_GCOV_PROFILE_RDS:
+CONFIG_COVERAGE_PROFILE_RDS:
         Enables GCOV profiling on RDS for checking which functions or
         lines are executed. This config is used by the rds selftest to
         generate coverage reports. If left unset the report is omitted.
@@ -207,7 +207,7 @@ Cause
 
 Solution
     Exclude affected source files from profiling by specifying
-    ``GCOV_PROFILE := n`` or ``GCOV_PROFILE_basename.o := n`` in the
+    ``COVERAGE_PROFILE := n`` or ``COVERAGE_PROFILE_basename.o := n`` in the
     corresponding Makefile.
 
 Problem
diff --git a/Documentation/translations/zh_CN/dev-tools/gcov.rst b/Documentation/translations/zh_CN/dev-tools/gcov.rst
index ea8f94852f417..47064c4d5ff98 100644
--- a/Documentation/translations/zh_CN/dev-tools/gcov.rst
+++ b/Documentation/translations/zh_CN/dev-tools/gcov.rst
@@ -39,7 +39,7 @@ gcov分析核心支持在Linux内核中启用GCC的覆盖率测试工具 gcov_ 
 
 获取整个内核的覆盖率数据，还需要打开::
 
-        CONFIG_GCOV_PROFILE_ALL=y
+        CONFIG_COVERAGE_PROFILE_ALL=y
 
 需要注意的是，整个内核开启覆盖率统计会造成内核镜像文件尺寸的增大，
 同时内核运行也会变慢一些。
@@ -58,20 +58,20 @@ gcov分析核心支持在Linux内核中启用GCC的覆盖率测试工具 gcov_ 
 
 - 单独统计单个文件（例如main.o）::
 
-    GCOV_PROFILE_main.o := y
+    COVERAGE_PROFILE_main.o := y
 
 - 单独统计某一个路径::
 
-    GCOV_PROFILE := y
+    COVERAGE_PROFILE := y
 
-如果要在整个内核的覆盖率统计（开启CONFIG_GCOV_PROFILE_ALL）中单独排除
+如果要在整个内核的覆盖率统计（开启CONFIG_COVERAGE_PROFILE_ALL）中单独排除
 某一个文件或者路径，可以使用如下的方法::
 
-    GCOV_PROFILE_main.o := n
+    COVERAGE_PROFILE_main.o := n
 
 和::
 
-    GCOV_PROFILE := n
+    COVERAGE_PROFILE := n
 
 此机制仅支持链接到内核镜像或编译为内核模块的文件。
 
@@ -186,8 +186,8 @@ kconfig会根据编译工具链的检查自动选择合适的gcov格式。
     分析标志指定在了源文件但是没有链接到主内核，或者客制化了链接程序
 
 解决方法
-    通过在相应的Makefile中使用 ``GCOV_PROFILE := n``
-    或者 ``GCOV_PROFILE_basename.o := n`` 来将链接报错的文件排除掉
+    通过在相应的Makefile中使用 ``COVERAGE_PROFILE := n``
+    或者 ``COVERAGE_PROFILE_basename.o := n`` 来将链接报错的文件排除掉
 
 可能出现的问题2
     从sysfs复制的文件显示为空或不完整
diff --git a/Documentation/translations/zh_TW/dev-tools/gcov.rst b/Documentation/translations/zh_TW/dev-tools/gcov.rst
index 39ac3fff44cdb..7d36a5460ce12 100644
--- a/Documentation/translations/zh_TW/dev-tools/gcov.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gcov.rst
@@ -39,7 +39,7 @@ gcov分析核心支持在Linux內核中啓用GCC的覆蓋率測試工具 gcov_ 
 
 獲取整個內核的覆蓋率數據，還需要打開::
 
-        CONFIG_GCOV_PROFILE_ALL=y
+        CONFIG_COVERAGE_PROFILE_ALL=y
 
 需要注意的是，整個內核開啓覆蓋率統計會造成內核鏡像文件尺寸的增大，
 同時內核運行也會變慢一些。
@@ -58,20 +58,20 @@ gcov分析核心支持在Linux內核中啓用GCC的覆蓋率測試工具 gcov_ 
 
 - 單獨統計單個文件（例如main.o）::
 
-    GCOV_PROFILE_main.o := y
+    COVERAGE_PROFILE_main.o := y
 
 - 單獨統計某一個路徑::
 
-    GCOV_PROFILE := y
+    COVERAGE_PROFILE := y
 
-如果要在整個內核的覆蓋率統計（開啓CONFIG_GCOV_PROFILE_ALL）中單獨排除
+如果要在整個內核的覆蓋率統計（開啓CONFIG_COVERAGE_PROFILE_ALL）中單獨排除
 某一個文件或者路徑，可以使用如下的方法::
 
-    GCOV_PROFILE_main.o := n
+    COVERAGE_PROFILE_main.o := n
 
 和::
 
-    GCOV_PROFILE := n
+    COVERAGE_PROFILE := n
 
 此機制僅支持鏈接到內核鏡像或編譯爲內核模塊的文件。
 
@@ -186,8 +186,8 @@ kconfig會根據編譯工具鏈的檢查自動選擇合適的gcov格式。
     分析標誌指定在了源文件但是沒有鏈接到主內核，或者客製化了鏈接程序
 
 解決方法
-    通過在相應的Makefile中使用 ``GCOV_PROFILE := n``
-    或者 ``GCOV_PROFILE_basename.o := n`` 來將鏈接報錯的文件排除掉
+    通過在相應的Makefile中使用 ``COVERAGE_PROFILE := n``
+    或者 ``COVERAGE_PROFILE_basename.o := n`` 來將鏈接報錯的文件排除掉
 
 可能出現的問題2
     從sysfs複製的文件顯示爲空或不完整
diff --git a/arch/Kconfig b/arch/Kconfig
index 057ada4747387..b443a227e9d47 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -819,7 +819,7 @@ config HAS_LTO_CLANG
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
 	depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
-	depends on !GCOV_KERNEL
+	depends on !COVERAGE_KERNEL
 	help
 	  The compiler and Kconfig options support building with Clang's
 	  LTO.
@@ -985,7 +985,7 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
 	def_bool y
 	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
 	# With GCOV/KASAN we need this fix: https://github.com/llvm/llvm-project/pull/104826
-	depends on CLANG_VERSION >= 190103 || (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
+	depends on CLANG_VERSION >= 190103 || (!COVERAGE_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
 config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	def_bool y
@@ -993,7 +993,7 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	depends on ARM64 || X86_64
 	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/pull/129373
 	depends on RUSTC_LLVM_VERSION >= 190103 || \
-		(!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
+		(!COVERAGE_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
 config CFI_PERMISSIVE
 	bool "Use CFI in permissive mode"
diff --git a/arch/alpha/boot/compressed/Makefile b/arch/alpha/boot/compressed/Makefile
index eb930f01b4be4..26c3f62075a90 100644
--- a/arch/alpha/boot/compressed/Makefile
+++ b/arch/alpha/boot/compressed/Makefile
@@ -28,7 +28,7 @@ KBUILD_AFLAGS := -D__ASSEMBLY__ $(KBUILD_CFLAGS)
 # built with the kernel's instrumentation and -mcpu=, so build private
 # copies of the library routines the stub needs instead of linking it.
 UBSAN_SANITIZE := n
-GCOV_PROFILE := n
+COVERAGE_PROFILE := n
 
 $(obj)/memcpy.o: $(srctree)/arch/alpha/lib/memcpy.c FORCE
 	$(call if_changed_dep,cc_o_c)
diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vdso32/Makefile
index 4ee8d17da229b..e884795da088d 100644
--- a/arch/parisc/kernel/vdso32/Makefile
+++ b/arch/parisc/kernel/vdso32/Makefile
@@ -4,7 +4,7 @@ include $(srctree)/lib/vdso/Makefile.include
 KCOV_INSTRUMENT := n
 
 # Disable gcov profiling, ubsan and kasan for VDSO code
-GCOV_PROFILE := n
+COVERAGE_PROFILE := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 KCSAN_SANITIZE := n
diff --git a/arch/parisc/kernel/vdso64/Makefile b/arch/parisc/kernel/vdso64/Makefile
index c63f4069170f4..42b8b0d167e1a 100644
--- a/arch/parisc/kernel/vdso64/Makefile
+++ b/arch/parisc/kernel/vdso64/Makefile
@@ -4,7 +4,7 @@ include $(srctree)/lib/vdso/Makefile.include
 KCOV_INSTRUMENT := n
 
 # Disable gcov profiling, ubsan and kasan for VDSO code
-GCOV_PROFILE := n
+COVERAGE_PROFILE := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 KCSAN_SANITIZE := n
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 7bf6b16b2d93c..a38e82894130c 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -169,15 +169,15 @@ obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o secvar-ops.o
 obj-$(CONFIG_PPC_SECVAR_SYSFS)	+= secvar-sysfs.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
-GCOV_PROFILE_prom_init.o := n
+COVERAGE_PROFILE_prom_init.o := n
 KCOV_INSTRUMENT_prom_init.o := n
 KCSAN_SANITIZE_prom_init.o := n
 UBSAN_SANITIZE_prom_init.o := n
-GCOV_PROFILE_kprobes.o := n
+COVERAGE_PROFILE_kprobes.o := n
 KCOV_INSTRUMENT_kprobes.o := n
 KCSAN_SANITIZE_kprobes.o := n
 UBSAN_SANITIZE_kprobes.o := n
-GCOV_PROFILE_kprobes-ftrace.o := n
+COVERAGE_PROFILE_kprobes-ftrace.o := n
 KCOV_INSTRUMENT_kprobes-ftrace.o := n
 KCSAN_SANITIZE_kprobes-ftrace.o := n
 UBSAN_SANITIZE_kprobes-ftrace.o := n
diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace/Makefile
index d6c3885453bda..e5d3b15f82018 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -24,11 +24,11 @@ obj-$(CONFIG_PPC64)			+= $(obj64-y)
 obj-$(CONFIG_PPC32)			+= $(obj32-y)
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
-GCOV_PROFILE_ftrace.o := n
+COVERAGE_PROFILE_ftrace.o := n
 KCOV_INSTRUMENT_ftrace.o := n
 KCSAN_SANITIZE_ftrace.o := n
 UBSAN_SANITIZE_ftrace.o := n
-GCOV_PROFILE_ftrace_64_pg.o := n
+COVERAGE_PROFILE_ftrace_64_pg.o := n
 KCOV_INSTRUMENT_ftrace_64_pg.o := n
 KCSAN_SANITIZE_ftrace_64_pg.o := n
 UBSAN_SANITIZE_ftrace_64_pg.o := n
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index ec7a0eed75dc5..d9e7a387d058c 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
-GCOV_PROFILE_core_$(BITS).o := n
+COVERAGE_PROFILE_core_$(BITS).o := n
 KCOV_INSTRUMENT_core_$(BITS).o := n
 UBSAN_SANITIZE_core_$(BITS).o := n
 KASAN_SANITIZE_core.o := n
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index d74b147126b7a..b2ad38d5ec8d8 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for xmon
 
-GCOV_PROFILE := n
+COVERAGE_PROFILE := n
 KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
diff --git a/arch/s390/boot/Makefile b/arch/s390/boot/Makefile
index e8e43ae80dd52..8dea682626462 100644
--- a/arch/s390/boot/Makefile
+++ b/arch/s390/boot/Makefile
@@ -5,7 +5,7 @@
 
 # Tooling runtimes are unavailable and cannot be linked for early boot code
 KCOV_INSTRUMENT := n
-GCOV_PROFILE := n
+COVERAGE_PROFILE := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 KCSAN_SANITIZE := n
diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
index f84b8fb41331b..8642db1c1f234 100644
--- a/arch/s390/kernel/Makefile
+++ b/arch/s390/kernel/Makefile
@@ -18,7 +18,7 @@ CFLAGS_REMOVE_unwind_bc.o	= $(CC_FLAGS_FTRACE)
 
 endif
 
-GCOV_PROFILE_early.o		:= n
+COVERAGE_PROFILE_early.o		:= n
 KCOV_INSTRUMENT_early.o		:= n
 UBSAN_SANITIZE_early.o		:= n
 KASAN_SANITIZE_ipl.o		:= n
diff --git a/arch/sh/mm/Makefile b/arch/sh/mm/Makefile
index 7033947955d60..3911cf5e9849d 100644
--- a/arch/sh/mm/Makefile
+++ b/arch/sh/mm/Makefile
@@ -41,4 +41,4 @@ obj-$(CONFIG_IOREMAP_FIXED)	+= ioremap_fixed.o
 obj-$(CONFIG_UNCACHED_MAPPING)	+= uncached.o
 obj-$(CONFIG_HAVE_SRAM_POOL)	+= sram.o
 
-GCOV_PROFILE_pmb.o := n
+COVERAGE_PROFILE_pmb.o := n
diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
index 3111a2ee67221..be4785d766ec1 100644
--- a/arch/x86/coco/sev/Makefile
+++ b/arch/x86/coco/sev/Makefile
@@ -9,4 +9,4 @@ UBSAN_SANITIZE_noinstr.o	:= n
 KASAN_SANITIZE_noinstr.o	:= n
 KCSAN_SANITIZE_noinstr.o	:= n
 
-GCOV_PROFILE_noinstr.o		:= n
+COVERAGE_PROFILE_noinstr.o		:= n
diff --git a/arch/x86/platform/efi/Makefile b/arch/x86/platform/efi/Makefile
index 500cab4a7f7c6..b0b891f776bfb 100644
--- a/arch/x86/platform/efi/Makefile
+++ b/arch/x86/platform/efi/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 KASAN_SANITIZE := n
-GCOV_PROFILE := n
+COVERAGE_PROFILE := n
 
 obj-$(CONFIG_EFI) 		+= memmap.o quirks.o efi.o efi_$(BITS).o \
 				   efi_stub_$(BITS).o
diff --git a/arch/xtensa/boot/lib/Makefile b/arch/xtensa/boot/lib/Makefile
index 0378a22a08e33..b42c7fab56a5e 100644
--- a/arch/xtensa/boot/lib/Makefile
+++ b/arch/xtensa/boot/lib/Makefile
@@ -18,7 +18,7 @@ endif
 KASAN_SANITIZE := n
 KCSAN_SANITIZE := n
 KCOV_INSTRUMENT := n
-GCOV_PROFILE := n
+COVERAGE_PROFILE := n
 
 CFLAGS_REMOVE_inflate.o += -fstack-protector -fstack-protector-strong
 CFLAGS_REMOVE_zmem.o += -fstack-protector -fstack-protector-strong
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 50305630f5335..2328a049f2816 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -101,16 +101,16 @@ config DRM_AMDGPU_WERROR
 	  Only enable this if you are warning code for amdgpu.ko.
 
 
-config GCOV_PROFILE_AMDGPU
-	bool "Enable GCOV profiling on amdgpu"
+config COVERAGE_PROFILE_AMDGPU
+	bool "Enable code coverage profiling on amdgpu"
 	depends on DRM_AMDGPU
-	depends on GCOV_KERNEL
-	default n
+	depends on COVERAGE_KERNEL
+	default GCOV_PROFILE_AMDGPU
 	help
-	  Enable GCOV profiling on the amdgpu driver for checking which
+	  Enable code coverage profiling on the amdgpu driver for checking which
 	  functions/lines are executed during testing. This adds compiler
 	  instrumentation flags to all amdgpu source files, producing
-	  .gcda/.gcno coverage data accessible via debugfs.
+	  coverage data accessible via debugfs.
 
 	  This increases the amdgpu module size by ~50% and adds ~2-5%
 	  runtime overhead on GPU submission paths.
diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 55b5d11f19382..dc408e24f5bc6 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -27,8 +27,8 @@ FULL_AMD_PATH=$(src)/..
 DISPLAY_FOLDER_NAME=display
 FULL_AMD_DISPLAY_PATH = $(FULL_AMD_PATH)/$(DISPLAY_FOLDER_NAME)
 
-ifdef CONFIG_GCOV_PROFILE_AMDGPU
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_AMDGPU
+COVERAGE_PROFILE := y
 endif
 
 ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index d1faf2d8370ff..3cd62d0be68e7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -71,5 +71,5 @@ ifneq ($(CONFIG_DRM_AMD_DC_KUNIT_TEST),)
 obj-y += $(AMDDALPATH)/amdgpu_dm/tests/
 
 # Enable gcov for amdgpu_dm KUnit builds
-GCOV_PROFILE := y
+COVERAGE_PROFILE := y
 endif
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index d4e7764621e18..20675723fee4a 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -456,7 +456,7 @@ always-$(CONFIG_DRM_I915_WERROR) += \
 		$(shell cd $(src) && find * -name '*.h')))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; \
+      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_COVERAGE), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; \
 		$(KERNELDOC) -none -Werror $<; touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 563c2f859361f..c0f4e684268cf 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -392,7 +392,7 @@ always-$(CONFIG_DRM_XE_WERROR) += \
 	$(patsubst %.h,%.hdrtest, $(shell cd $(src) && find * -name '*.h' $(hdrtest_find_args)))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $< -include $<; \
+      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_COVERAGE), $(c_flags)) -S -o /dev/null -x c /dev/null -include $< -include $<; \
 		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
diff --git a/drivers/s390/char/Makefile b/drivers/s390/char/Makefile
index 0ad960d000a2f..0d4c144cbd994 100644
--- a/drivers/s390/char/Makefile
+++ b/drivers/s390/char/Makefile
@@ -10,7 +10,7 @@ ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_sclp_early_core.o	= $(CC_FLAGS_FTRACE)
 endif
 
-GCOV_PROFILE_sclp_early_core.o		:= n
+COVERAGE_PROFILE_sclp_early_core.o		:= n
 KCOV_INSTRUMENT_sclp_early_core.o	:= n
 UBSAN_SANITIZE_sclp_early_core.o	:= n
 KASAN_SANITIZE_sclp_early_core.o	:= n
diff --git a/init/Kconfig b/init/Kconfig
index 4013781e0a029..648106476e62f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1773,11 +1773,12 @@ config IO_URING
 	  applications to submit and complete IO through submission and
 	  completion rings that are shared between the kernel and application.
 
-config GCOV_PROFILE_URING
-	bool "Enable GCOV profiling on the io_uring subsystem"
-	depends on IO_URING && GCOV_KERNEL
+config COVERAGE_PROFILE_URING
+	bool "Enable code coverage profiling on the io_uring subsystem"
+	depends on IO_URING && COVERAGE_KERNEL
+	default GCOV_PROFILE_URING
 	help
-	  Enable GCOV profiling on the io_uring subsystem, to facilitate
+	  Enable code coverage profiling on the io_uring subsystem, to facilitate
 	  code coverage testing.
 
 	  If unsure, say N.
diff --git a/io_uring/Makefile b/io_uring/Makefile
index 965bb60e9f7b1..cb27f1f8b59fb 100644
--- a/io_uring/Makefile
+++ b/io_uring/Makefile
@@ -2,8 +2,8 @@
 #
 # Makefile for io_uring
 
-ifdef CONFIG_GCOV_PROFILE_URING
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_URING
+COVERAGE_PROFILE := y
 endif
 
 obj-$(CONFIG_IO_URING)		+= io_uring.o opdef.o kbuf.o rsrc.o notif.o \
diff --git a/kernel/coverage/Kconfig b/kernel/coverage/Kconfig
index dd90b6a61ae65..62a6fa94bd308 100644
--- a/kernel/coverage/Kconfig
+++ b/kernel/coverage/Kconfig
@@ -1,7 +1,108 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "Code coverage"
 
-source "kernel/coverage/gcov/Kconfig"
+config ARCH_HAS_GCOV_PROFILE_ALL
+	def_bool n
+
+choice
+	prompt "Code coverage measurement"
+	default GCOV_KERNEL if COMPILE_TEST
+	default COVERAGE_NONE
+	help
+	  Instrument the kernel to measure which parts of it get executed.
+	  Each mechanism produces data in the format of its toolchain, so
+	  only one of them can be enabled at a time.
+
+	  KCOV, which collects coverage for fuzzers, is configured
+	  separately and can be combined with any of them.
+
+	  The instrumentation of a single file or of all files in a
+	  directory can be controlled from the respective Makefile:
+
+	  For a single file (e.g. main.o):
+	          COVERAGE_PROFILE_main.o := y
+
+	  For all files in one directory:
+	          COVERAGE_PROFILE := y
+
+	  To exclude files from being profiled even when
+	  CONFIG_COVERAGE_PROFILE_ALL is specified, use:
+
+	          COVERAGE_PROFILE_main.o := n
+	  and:
+	          COVERAGE_PROFILE := n
+
+	  Note that the debugfs filesystem has to be mounted to access
+	  the coverage data.
+
+config COVERAGE_NONE
+	bool "None"
+
+config GCOV_KERNEL
+	bool "gcov-based kernel profiling"
+	depends on DEBUG_FS
+	depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
+	select CONSTRUCTORS
+	help
+	  This option enables gcov-based code profiling (e.g. for code coverage
+	  measurements), with GCC or Clang. The coverage data of the kernel
+	  and its modules is exported in gcov's format in /sys/kernel/debug/gcov,
+	  see Documentation/dev-tools/gcov.rst.
+
+endchoice
+
+config COVERAGE_KERNEL
+	def_bool GCOV_KERNEL
+
+config GCOV_PROFILE_ALL
+	bool
+	transitional
+	help
+	  Transitional config for GCOV_PROFILE_ALL to COVERAGE_PROFILE_ALL
+	  migration.
+
+config COVERAGE_PROFILE_ALL
+	bool "Profile entire kernel"
+	depends on !COMPILE_TEST
+	depends on GCOV_KERNEL && ARCH_HAS_GCOV_PROFILE_ALL
+	default GCOV_PROFILE_ALL
+	help
+	  This option activates coverage instrumentation for the entire kernel.
+
+	  If unsure, say N.
+
+	  Note that a kernel compiled with profiling flags will be significantly
+	  larger and run slower. Also be sure to exclude files from profiling
+	  which are not linked to the kernel image to prevent linker errors.
+
+# The per-subsystem COVERAGE_PROFILE_* options used to be GCOV_PROFILE_*.
+config GCOV_PROFILE_AMDGPU
+	bool
+	transitional
+
+config GCOV_PROFILE_URING
+	bool
+	transitional
+
+config GCOV_PROFILE_FTRACE
+	bool
+	transitional
+
+config GCOV_PROFILE_NETFILTER
+	bool
+	transitional
+
+config GCOV_PROFILE_IPSET
+	bool
+	transitional
+
+config GCOV_PROFILE_IPVS
+	bool
+	transitional
+
+config GCOV_PROFILE_RDS
+	bool
+	transitional
 
 config ARCH_HAS_KCOV
 	bool
diff --git a/kernel/coverage/gcov/Kconfig b/kernel/coverage/gcov/Kconfig
deleted file mode 100644
index 04f4ebdc3cf59..0000000000000
--- a/kernel/coverage/gcov/Kconfig
+++ /dev/null
@@ -1,55 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-menu "GCOV-based kernel profiling"
-
-config GCOV_KERNEL
-	bool "Enable gcov-based kernel profiling"
-	depends on DEBUG_FS
-	depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
-	select CONSTRUCTORS
-	default n
-	help
-	This option enables gcov-based code profiling (e.g. for code coverage
-	measurements).
-
-	If unsure, say N.
-
-	Additionally specify CONFIG_GCOV_PROFILE_ALL=y to get profiling data
-	for the entire kernel. To enable profiling for specific files or
-	directories, add a line similar to the following to the respective
-	Makefile:
-
-	For a single file (e.g. main.o):
-	        GCOV_PROFILE_main.o := y
-
-	For all files in one directory:
-	        GCOV_PROFILE := y
-
-	To exclude files from being profiled even when CONFIG_GCOV_PROFILE_ALL
-	is specified, use:
-
-	        GCOV_PROFILE_main.o := n
-	and:
-	        GCOV_PROFILE := n
-
-	Note that the debugfs filesystem has to be mounted to access
-	profiling data.
-
-config ARCH_HAS_GCOV_PROFILE_ALL
-	def_bool n
-
-config GCOV_PROFILE_ALL
-	bool "Profile entire Kernel"
-	depends on !COMPILE_TEST
-	depends on GCOV_KERNEL
-	depends on ARCH_HAS_GCOV_PROFILE_ALL
-	default n
-	help
-	This options activates profiling for the entire kernel.
-
-	If unsure, say N.
-
-	Note that a kernel compiled with profiling flags will be significantly
-	larger and run slower. Also be sure to exclude files from profiling
-	which are not linked to the kernel image to prevent linker errors.
-
-endmenu
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 35d043b19332f..e54ed136ce4ac 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1118,11 +1118,12 @@ config RING_BUFFER_RECORD_RECURSION
 
 	  This will add more overhead to cases that have recursion.
 
-config GCOV_PROFILE_FTRACE
-	bool "Enable GCOV profiling on ftrace subsystem"
-	depends on GCOV_KERNEL
+config COVERAGE_PROFILE_FTRACE
+	bool "Enable code coverage profiling on ftrace subsystem"
+	depends on COVERAGE_KERNEL
+	default GCOV_PROFILE_FTRACE
 	help
-	  Enable GCOV profiling on ftrace subsystem for checking
+	  Enable code coverage profiling on ftrace subsystem for checking
 	  which functions/lines are tested.
 
 	  If unsure, say N.
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index b0c44f438999e..ab3242265a7a8 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -44,8 +44,8 @@ KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 endif
 
 # for GCOV coverage profiling
-ifdef CONFIG_GCOV_PROFILE_FTRACE
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_FTRACE
+COVERAGE_PROFILE := y
 endif
 
 # Functions in these files can run from IRQ entry before hardirq context
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index bb939219f4cb4..8c80f3776f87a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3062,7 +3062,7 @@ config FORTIFY_KUNIT_TEST
 config LONGEST_SYM_KUNIT_TEST
 	tristate "Test the longest symbol possible" if !KUNIT_ALL_TESTS
 	depends on KUNIT && KPROBES
-	depends on !CALL_PADDING && !CFI && !GCOV_KERNEL
+	depends on !CALL_PADDING && !CFI && !COVERAGE_KERNEL
 	default KUNIT_ALL_TESTS
 	help
 	  Tests the longest symbol possible
diff --git a/lib/Makefile b/lib/Makefile
index a2afe954805cb..6e80cd0023e8e 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -88,7 +88,7 @@ obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
 obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
 ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_KASAN),yy)
 # FIXME: Clang breaks test_bitmap_const_eval when KASAN and GCOV are enabled
-GCOV_PROFILE_test_bitmap.o := n
+COVERAGE_PROFILE_test_bitmap.o := n
 endif
 
 obj-$(CONFIG_TEST_XARRAY) += test_xarray.o
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 832d170cab941..4d7b265c023a1 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -143,7 +143,7 @@ obj-$(CONFIG_CRYPTO_LIB_CURVE25519) += libcurve25519.o
 libcurve25519-y := curve25519.o
 
 # Disable GCOV in odd or sensitive code
-GCOV_PROFILE_curve25519.o := n
+COVERAGE_PROFILE_curve25519.o := n
 
 ifeq ($(CONFIG_ARCH_SUPPORTS_INT128),y)
 libcurve25519-$(CONFIG_CRYPTO_LIB_CURVE25519_GENERIC) += curve25519-hacl64.o
diff --git a/net/bridge/Makefile b/net/bridge/Makefile
index 1203dc19e15c9..79e07925c9322 100644
--- a/net/bridge/Makefile
+++ b/net/bridge/Makefile
@@ -30,8 +30,8 @@ bridge-$(CONFIG_BRIDGE_MRP)	+= br_mrp_switchdev.o br_mrp.o br_mrp_netlink.o
 
 bridge-$(CONFIG_BRIDGE_CFM)	+= br_cfm.o br_cfm_netlink.o
 
-ifdef CONFIG_GCOV_PROFILE_NETFILTER
-GCOV_PROFILE_br_nf_core.o := y
-GCOV_PROFILE_br_netfilter_hooks.o := y
-GCOV_PROFILE_br_netfilter_ipv6.o := y
+ifdef CONFIG_COVERAGE_PROFILE_NETFILTER
+COVERAGE_PROFILE_br_nf_core.o := y
+COVERAGE_PROFILE_br_netfilter_hooks.o := y
+COVERAGE_PROFILE_br_netfilter_ipv6.o := y
 endif
diff --git a/net/bridge/netfilter/Makefile b/net/bridge/netfilter/Makefile
index af0c903aa4ace..46af78735a5c5 100644
--- a/net/bridge/netfilter/Makefile
+++ b/net/bridge/netfilter/Makefile
@@ -39,6 +39,6 @@ obj-$(CONFIG_BRIDGE_EBT_SNAT) += ebt_snat.o
 obj-$(CONFIG_BRIDGE_EBT_LOG) += ebt_log.o
 obj-$(CONFIG_BRIDGE_EBT_NFLOG) += ebt_nflog.o
 
-ifdef CONFIG_GCOV_PROFILE_NETFILTER
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_NETFILTER
+COVERAGE_PROFILE := y
 endif
diff --git a/net/ipv4/Makefile b/net/ipv4/Makefile
index e8a0e9605b901..23f68b7fb3498 100644
--- a/net/ipv4/Makefile
+++ b/net/ipv4/Makefile
@@ -74,6 +74,6 @@ obj-$(CONFIG_BPF_SYSCALL) += bpf_tcp_ca.o
 obj-$(CONFIG_CGROUP_BPF) += bpf_tcp_ops.o
 endif
 
-ifdef CONFIG_GCOV_PROFILE_NETFILTER
-GCOV_PROFILE_netfilter.o := y
+ifdef CONFIG_COVERAGE_PROFILE_NETFILTER
+COVERAGE_PROFILE_netfilter.o := y
 endif
diff --git a/net/ipv4/netfilter/Makefile b/net/ipv4/netfilter/Makefile
index dbfb1c4739a87..c4c0dfeef382c 100644
--- a/net/ipv4/netfilter/Makefile
+++ b/net/ipv4/netfilter/Makefile
@@ -52,6 +52,6 @@ obj-$(CONFIG_IP_NF_ARPFILTER) += arptable_filter.o
 
 obj-$(CONFIG_NF_DUP_IPV4) += nf_dup_ipv4.o
 
-ifdef CONFIG_GCOV_PROFILE_NETFILTER
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_NETFILTER
+COVERAGE_PROFILE := y
 endif
diff --git a/net/ipv6/Makefile b/net/ipv6/Makefile
index cf5e01f83ce3d..3c7e993fefcc1 100644
--- a/net/ipv6/Makefile
+++ b/net/ipv6/Makefile
@@ -55,6 +55,6 @@ obj-y += mcast_snoop.o ndisc_snoop.o
 obj-$(CONFIG_TCP_AO) += tcp_ao.o
 endif
 
-ifdef CONFIG_GCOV_PROFILE_NETFILTER
-GCOV_PROFILE_netfilter.o := y
+ifdef CONFIG_COVERAGE_PROFILE_NETFILTER
+COVERAGE_PROFILE_netfilter.o := y
 endif
diff --git a/net/ipv6/netfilter/Makefile b/net/ipv6/netfilter/Makefile
index 72902d8005ad9..e49f0dd9526ac 100644
--- a/net/ipv6/netfilter/Makefile
+++ b/net/ipv6/netfilter/Makefile
@@ -44,6 +44,6 @@ obj-$(CONFIG_IP6_NF_TARGET_NPT) += ip6t_NPT.o
 obj-$(CONFIG_IP6_NF_TARGET_REJECT) += ip6t_REJECT.o
 obj-$(CONFIG_IP6_NF_TARGET_SYNPROXY) += ip6t_SYNPROXY.o
 
-ifdef CONFIG_GCOV_PROFILE_NETFILTER
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_NETFILTER
+COVERAGE_PROFILE := y
 endif
diff --git a/net/netfilter/Kconfig b/net/netfilter/Kconfig
index 09874c26fd135..9470494ee760a 100644
--- a/net/netfilter/Kconfig
+++ b/net/netfilter/Kconfig
@@ -1649,11 +1649,12 @@ config NETFILTER_XT_MATCH_U32
 
 endif # NETFILTER_XTABLES
 
-config GCOV_PROFILE_NETFILTER
-	bool "Enable GCOV profiling for netfilter"
-	depends on GCOV_KERNEL
+config COVERAGE_PROFILE_NETFILTER
+	bool "Enable code coverage profiling for netfilter"
+	depends on COVERAGE_KERNEL
+	default GCOV_PROFILE_NETFILTER
 	help
-	  Enable GCOV profiling for netfilter to check which functions/lines
+	  Enable code coverage profiling for netfilter to check which functions/lines
 	  are executed.
 
 	  If unsure, say N.
diff --git a/net/netfilter/Makefile b/net/netfilter/Makefile
index 6bf74d488a292..f84c622e3a70d 100644
--- a/net/netfilter/Makefile
+++ b/net/netfilter/Makefile
@@ -241,6 +241,6 @@ obj-$(CONFIG_IP_VS) += ipvs/
 # lwtunnel
 obj-$(CONFIG_LWTUNNEL) += nf_hooks_lwtunnel.o
 
-ifdef CONFIG_GCOV_PROFILE_NETFILTER
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_NETFILTER
+COVERAGE_PROFILE := y
 endif
diff --git a/net/netfilter/ipset/Kconfig b/net/netfilter/ipset/Kconfig
index 6c4d547581067..e8f05c1df8e0f 100644
--- a/net/netfilter/ipset/Kconfig
+++ b/net/netfilter/ipset/Kconfig
@@ -175,11 +175,12 @@ config IP_SET_LIST_SET
 
 	  To compile it as a module, choose M here.  If unsure, say N.
 
-config GCOV_PROFILE_IPSET
-	bool "Enable GCOV profiling for ipset"
-	depends on GCOV_KERNEL
+config COVERAGE_PROFILE_IPSET
+	bool "Enable code coverage profiling for ipset"
+	depends on COVERAGE_KERNEL
+	default GCOV_PROFILE_IPSET
 	help
-	  Enable GCOV profiling for ipset to check which functions/lines
+	  Enable code coverage profiling for ipset to check which functions/lines
 	  are executed.
 
 	  If unsure, say N.
diff --git a/net/netfilter/ipset/Makefile b/net/netfilter/ipset/Makefile
index 4f48df5406cd3..b4991815f44bb 100644
--- a/net/netfilter/ipset/Makefile
+++ b/net/netfilter/ipset/Makefile
@@ -29,6 +29,6 @@ obj-$(CONFIG_IP_SET_HASH_NETPORTNET) += ip_set_hash_netportnet.o
 
 # list types
 obj-$(CONFIG_IP_SET_LIST_SET) += ip_set_list_set.o
-ifdef CONFIG_GCOV_PROFILE_IPSET
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_IPSET
+COVERAGE_PROFILE := y
 endif
diff --git a/net/netfilter/ipvs/Kconfig b/net/netfilter/ipvs/Kconfig
index 7724cb44e6dea..959e5832be874 100644
--- a/net/netfilter/ipvs/Kconfig
+++ b/net/netfilter/ipvs/Kconfig
@@ -349,11 +349,12 @@ config	IP_VS_PE_SIP
 	help
 	  Allow persistence based on the SIP Call-ID
 
-config GCOV_PROFILE_IPVS
-	bool "Enable GCOV profiling for IPVS"
-	depends on GCOV_KERNEL
+config COVERAGE_PROFILE_IPVS
+	bool "Enable code coverage profiling for IPVS"
+	depends on COVERAGE_KERNEL
+	default GCOV_PROFILE_IPVS
 	help
-	  Enable GCOV profiling for IPVS to check which functions/lines
+	  Enable code coverage profiling for IPVS to check which functions/lines
 	  are executed.
 
 	  If unsure, say N.
diff --git a/net/netfilter/ipvs/Makefile b/net/netfilter/ipvs/Makefile
index 8e4cc67ad39d5..6cf42a7350904 100644
--- a/net/netfilter/ipvs/Makefile
+++ b/net/netfilter/ipvs/Makefile
@@ -43,6 +43,6 @@ obj-$(CONFIG_IP_VS_FTP) += ip_vs_ftp.o
 
 # IPVS connection template retrievers
 obj-$(CONFIG_IP_VS_PE_SIP) += ip_vs_pe_sip.o
-ifdef CONFIG_GCOV_PROFILE_IPVS
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_IPVS
+COVERAGE_PROFILE := y
 endif
diff --git a/net/rds/Kconfig b/net/rds/Kconfig
index f007730aa2bb6..9c35cb18a3f93 100644
--- a/net/rds/Kconfig
+++ b/net/rds/Kconfig
@@ -27,11 +27,12 @@ config RDS_DEBUG
 	depends on RDS
 	default n
 
-config GCOV_PROFILE_RDS
-	bool "Enable GCOV profiling on RDS"
-	depends on GCOV_KERNEL
+config COVERAGE_PROFILE_RDS
+	bool "Enable code coverage profiling on RDS"
+	depends on COVERAGE_KERNEL
+	default GCOV_PROFILE_RDS
 	help
-	  Enable GCOV profiling on RDS for checking which functions/lines
+	  Enable code coverage profiling on RDS for checking which functions/lines
 	  are executed.
 
 	  If unsure, say N.
diff --git a/net/rds/Makefile b/net/rds/Makefile
index 3af1ca1d965ce..84c1eb77369f5 100644
--- a/net/rds/Makefile
+++ b/net/rds/Makefile
@@ -17,6 +17,6 @@ rds_tcp-y :=		tcp.o tcp_connect.o tcp_listen.o tcp_recv.o \
 ccflags-$(CONFIG_RDS_DEBUG)	:=	-DRDS_DEBUG
 
 # for GCOV coverage profiling
-ifdef CONFIG_GCOV_PROFILE_RDS
-GCOV_PROFILE := y
+ifdef CONFIG_COVERAGE_PROFILE_RDS
+COVERAGE_PROFILE := y
 endif
diff --git a/scripts/Makefile.gcov b/scripts/Makefile.gcov
index 16c5b876440c2..1cfe04d89b0a2 100644
--- a/scripts/Makefile.gcov
+++ b/scripts/Makefile.gcov
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
-CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
+CFLAGS_COVERAGE	:= -fprofile-arcs -ftest-coverage
 ifdef CONFIG_CC_IS_GCC
-CFLAGS_GCOV	+= -fno-tree-loop-im
+CFLAGS_COVERAGE	+= -fno-tree-loop-im
 # Use atomic counter updates to avoid concurrent-access crashes in GCOV.
 # Only enable if -fprofile-update=prefer-atomic does not introduce new
 # undefined symbols (e.g. libatomic calls that the kernel cannot link).
-CFLAGS_GCOV	+= $(call try-run,\
+CFLAGS_COVERAGE	+= $(call try-run,\
 	echo 'long long x; void f(void){x++;}' | \
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_GCOV) \
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_COVERAGE) \
 	-x c - -c -o "$$TMP.base" && \
 	echo 'long long x; void f(void){x++;}' | \
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_GCOV) \
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_COVERAGE) \
 	-fprofile-update=prefer-atomic \
 	-x c - -c -o "$$TMP" && \
 	$(NM) "$$TMP.base" | grep ' U ' > "$$TMP.ubase" || true ; \
@@ -18,4 +18,4 @@ CFLAGS_GCOV	+= $(call try-run,\
 	cmp -s "$$TMP.ubase" "$$TMP.utest",\
 	-fprofile-update=prefer-atomic)
 endif
-export CFLAGS_GCOV
+export CFLAGS_COVERAGE
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 19e96b30a122f..e0dc21e009522 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -38,14 +38,14 @@ _a_flags       = $(filter-out $(AFLAGS_REMOVE_$(target-stem).o), \
 _cpp_flags     = $(KBUILD_CPPFLAGS) $(cppflags-y) $(CPPFLAGS_$(target-stem).lds)
 
 #
-# Enable gcov profiling flags for a file, directory or for all files depending
-# on variables GCOV_PROFILE_obj.o, GCOV_PROFILE and CONFIG_GCOV_PROFILE_ALL
-# (in this order)
+# Enable code coverage instrumentation for a file, directory or for all files
+# depending on variables COVERAGE_PROFILE_obj.o, COVERAGE_PROFILE and
+# CONFIG_COVERAGE_PROFILE_ALL (in this order)
 #
-ifeq ($(CONFIG_GCOV_KERNEL),y)
+ifeq ($(CONFIG_COVERAGE_KERNEL),y)
 _c_flags += $(if $(patsubst n%,, \
-		$(GCOV_PROFILE_$(target-stem).o)$(GCOV_PROFILE)$(if $(is-kernel-object),$(CONFIG_GCOV_PROFILE_ALL))), \
-		$(CFLAGS_GCOV))
+		$(COVERAGE_PROFILE_$(target-stem).o)$(COVERAGE_PROFILE)$(if $(is-kernel-object),$(CONFIG_COVERAGE_PROFILE_ALL))), \
+		$(CFLAGS_COVERAGE))
 endif
 
 #
@@ -206,7 +206,7 @@ objtool-args-$(CONFIG_MITIGATION_SLS)			+= --sls
 objtool-args-$(CONFIG_STACK_VALIDATION)			+= --stackval
 objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
 objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
-objtool-args-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
+objtool-args-$(or $(CONFIG_COVERAGE_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
 objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --werror
 
 objtool-args = $(objtool-args-y)					\
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 01a37ec872b90..2ca03eccbe291 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -19,7 +19,7 @@ __modfinal: $(modules:%.o=%.ko)
 # modname and part-of-module are set to make c_flags define proper module flags
 modname = $(notdir $(@:.mod.o=))
 part-of-module = y
-GCOV_PROFILE := n
+COVERAGE_PROFILE := n
 ccflags-remove-y := $(CC_FLAGS_CFI)
 
 %.mod.o: %.mod.c FORCE
diff --git a/scripts/sbom/sbom/environment.py b/scripts/sbom/sbom/environment.py
index 4304066fe974e..a74c96ddfe593 100644
--- a/scripts/sbom/sbom/environment.py
+++ b/scripts/sbom/sbom/environment.py
@@ -18,7 +18,7 @@ KERNEL_BUILD_VARIABLES_ALLOWLIST = [
     "CC",
     "CC_FLAGS_FPU",
     "CC_FLAGS_NO_FPU",
-    "CFLAGS_GCOV",
+    "CFLAGS_COVERAGE",
     "CFLAGS_KERNEL",
     "CFLAGS_MODULE",
     "CHECK",
diff --git a/tools/testing/selftests/net/rds/config.sh b/tools/testing/selftests/net/rds/config.sh
index 2df2226310efe..bb854f49e464d 100755
--- a/tools/testing/selftests/net/rds/config.sh
+++ b/tools/testing/selftests/net/rds/config.sh
@@ -43,13 +43,14 @@ scripts/config "${FLAGS[@]}" --enable CONFIG_RDS_TCP
 
 if [ "$GENERATE_GCOV_REPORT" -eq 1 ]; then
 	# instrument RDS and only RDS
+	scripts/config "${FLAGS[@]}" --disable CONFIG_COVERAGE_NONE
 	scripts/config "${FLAGS[@]}" --enable CONFIG_GCOV_KERNEL
-	scripts/config "${FLAGS[@]}" --disable GCOV_PROFILE_ALL
-	scripts/config "${FLAGS[@]}" --enable GCOV_PROFILE_RDS
+	scripts/config "${FLAGS[@]}" --disable COVERAGE_PROFILE_ALL
+	scripts/config "${FLAGS[@]}" --enable COVERAGE_PROFILE_RDS
 else
 	scripts/config "${FLAGS[@]}" --disable CONFIG_GCOV_KERNEL
-	scripts/config "${FLAGS[@]}" --disable GCOV_PROFILE_ALL
-	scripts/config "${FLAGS[@]}" --disable GCOV_PROFILE_RDS
+	scripts/config "${FLAGS[@]}" --disable COVERAGE_PROFILE_ALL
+	scripts/config "${FLAGS[@]}" --disable COVERAGE_PROFILE_RDS
 fi
 
 # need network namespaces to run tests with veth network interfaces
diff --git a/tools/testing/selftests/net/rds/rds_run.sh b/tools/testing/selftests/net/rds/rds_run.sh
index cdf487ec97dcc..25bb65d048abe 100755
--- a/tools/testing/selftests/net/rds/rds_run.sh
+++ b/tools/testing/selftests/net/rds/rds_run.sh
@@ -70,16 +70,16 @@ check_gcov_env()
 # Check to see if the kconfig has the required configs to generate a coverage report
 check_gcov_conf()
 {
-	if ! grep -x "CONFIG_GCOV_PROFILE_RDS=y" "$kconfig" > /dev/null 2>&1; then
-		echo "# INFO: CONFIG_GCOV_PROFILE_RDS should be enabled for coverage reports"
+	if ! grep -x "CONFIG_COVERAGE_PROFILE_RDS=y" "$kconfig" > /dev/null 2>&1; then
+		echo "# INFO: CONFIG_COVERAGE_PROFILE_RDS should be enabled for coverage reports"
 		GENERATE_GCOV_REPORT=0
 	fi
 	if ! grep -x "CONFIG_GCOV_KERNEL=y" "$kconfig" > /dev/null 2>&1; then
 		echo "# INFO: CONFIG_GCOV_KERNEL should be enabled for coverage reports"
 		GENERATE_GCOV_REPORT=0
 	fi
-	if grep -x "CONFIG_GCOV_PROFILE_ALL=y" "$kconfig" > /dev/null 2>&1; then
-		echo "# INFO: CONFIG_GCOV_PROFILE_ALL should be disabled for coverage reports"
+	if grep -x "CONFIG_COVERAGE_PROFILE_ALL=y" "$kconfig" > /dev/null 2>&1; then
+		echo "# INFO: CONFIG_COVERAGE_PROFILE_ALL should be disabled for coverage reports"
 		GENERATE_GCOV_REPORT=0
 	fi
 
-- 
2.53.0

