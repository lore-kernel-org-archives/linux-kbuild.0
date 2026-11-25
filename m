Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572408;
	b=LjKKb71jzgDXnghfhPsxqKroo65gWHJG+vPEGhVvnqq+H38yt4h0ohPxBU9lMgqTc4r4
	 cV/UiHSP5E2FoQ45Jsjo8Avesr/2WEtMJ1mdVyQXIPr5FGtP6wUUxll3w43DoKvyiuz9H
	 j2A8P7ktpnUmIC1EdWmES56EF5QgP0KqpjlVp2JggioCFqW4KVa1XIrf8NNUhY7+a6sRE
	 AdZl07wb9eai5Xyci7mMVZ0WOqLIUY4mt040ACSrbsc2Mo3BE5W2U0tQXSTpqNcksRS4Z
	 5Z00Czq4lwGYRPmuDN25nBFpvUe8BS1N+rEwf74ekMz+eiamH8c7XVWjDgvic/BJlww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572408;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=dKMLUpHAjPjDR7+hpdPDRJ+1ZwsnEwOUissHcehq8Yc=;
	b=pkKJlgRVv8dbQ+Cv6/kqHULR1PGrcW8PgBt6NNrUYRAgwyBsdObozrQiLa8+ES67KwT5
	 kE0xt1lKJ4ABRVUdE3sWouIpFjR1LdwbYQN1Uy0xovt/NSpvBT8ZAppbd0CWtEC8du9eX
	 FIS3DW27bFs0EhFqdCHVOJUvlbMlsQAfmDcdNAxe7iwG6v2aGDbaB+mpU/ncXFTvYjP3L
	 8P7XPgXzVrKnvOesUVZHGKUcbC3hLwxnRMAfw11/V6euSidnpc7YImZGLdoX7fFsZqUr5
	 VQIv8rmg8202F6TFKjemRbQaaEUDL+5NVZs6JBdRYfSxuFiyN2YpgPYCTaDBU1AeWCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I5igaFBS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC36606A326;
	Wed, 25 Nov 2026 02:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I5igaFBS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000561F000EB;
	Wed, 25 Nov 2026 02:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572408;
	bh=dKMLUpHAjPjDR7+hpdPDRJ+1ZwsnEwOUissHcehq8Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I5igaFBSZKQgT+9a7KDu3gH8pxAVLfG1h6U6iEwBt+Vo0YtnbJ0LFlMtMABB2/UIZ
	 8jVgmoTgBl3uijGBTZ2BylUrKbu9xttYu78ASm18zwXa2fReCdtsHr9eMyy9r/tzSY
	 knP6ISboOprmA5Z+JfwVG3xB2QRxChh4pjplgtWzMaEIOHa2I51Tm7KWesfcBJGYR5
	 DGudX1kQYbi75m1Lct9y3rUsUYvCnhKjhQ0xe2ijeiG5vvnzAOZjnhtJpFwhKyoPEz
	 HI9kfmcZgrFmhwTgFpC8ynrik/ayAEsGP4gE7AVncjLgmcv/QRTZ7a3+fx+yJliO4Y
	 DfKwA/SSDiI6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wentao Zhang <wentaoz5@illinois.edu>
Subject: [PATCH v3 15/19] coverage: add MC/DC measurement
Date: Tue, 24 Nov 2026 21:05:59 -0500
Message-ID: <20261125020603.3934222-16-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125020603.3934222-1-sashal@kernel.org>
References: <20261125020603.3934222-1-sashal@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CONFIG_COVERAGE_MCDC to measure Modified Condition/Decision
Coverage (MC/DC) [1], which is required by several automotive and
aviation standards for certifying safety critical software [2]. Start
with Clang's source-based code coverage, which supports it since Clang
18 [3].

In the following example from arch/x86/events/probe.c, measured on
v6.11, llvm-cov gives the MC/DC measurement for the compound logic
decision at line 43:

   43|     12|			if (msr[bit].test && !msr[bit].test(bit, data))
  ------------------
  |---> MC/DC Decision Region (43:8) to (43:50)
  |
  |  Number of Conditions: 2
  |     Condition C1 --> (43:8)
  |     Condition C2 --> (43:25)
  |
  |  Executed MC/DC Test Vectors:
  |
  |     C1, C2    Result
  |  1 { T,  F  = F      }
  |  2 { T,  T  = T      }
  |
  |  C1-Pair: not covered
  |  C2-Pair: covered: (1,2)
  |  MC/DC Coverage for Decision: 50.00%
  |
  ------------------
   44|      5|				continue;

Only condition C2 was shown to independently affect the outcome of the
decision, so the MC/DC of this decision is 1 out of 2.

MC/DC uses bitmaps to track the executed test vectors, which grow
quickly with the number of conditions. CONFIG_LLVM_COV_MCDC_MAX_CONDITIONS
sets the largest decision to instrument, through -fmcdc-max-conditions.
Larger decisions, and decisions the compiler can't instrument, are left
out of the MC/DC data and only get branch coverage. The compiler warns
about each of them, which is nothing to act on in the code, so disable
those warnings; building with KCFLAGS=-Wpgo-coverage lists them. Clang
only allows disabling them since version 22. Older versions always
print them, and -Werror doesn't make them errors, so CONFIG_COVERAGE_MCDC
isn't offered for those versions when CONFIG_WERROR is set and the build
is expected to be free of warnings.

Link: https://en.wikipedia.org/wiki/Modified_condition%2Fdecision_coverage [1]
Link: https://digital-library.theiet.org/content/journals/10.1049/sej.1994.0025 [2]
Link: https://clang.llvm.org/docs/SourceBasedCodeCoverage.html#mc-dc-instrumentation [3]
Originally-by: Wentao Zhang <wentaoz5@illinois.edu>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/coverage/Kconfig   | 26 ++++++++++++++++++++++++++
 kernel/coverage/llvm/fs.c |  3 ++-
 scripts/Kconfig.toolchain |  5 +++++
 scripts/Makefile.llvm-cov |  9 +++++++++
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/kernel/coverage/Kconfig b/kernel/coverage/Kconfig
index 4d1b6190bcde1..173a321741f87 100644
--- a/kernel/coverage/Kconfig
+++ b/kernel/coverage/Kconfig
@@ -106,6 +106,32 @@ config COVERAGE_PROFILE_ALL
 	  Note that a kernel compiled with profiling flags will be significantly
 	  larger and run slower.
 
+config COVERAGE_MCDC
+	bool "Measure modified condition/decision coverage (MC/DC)"
+	depends on LLVM_COV_KERNEL
+	depends on CLANG_VERSION >= 220000 || !WERROR
+	help
+	  MC/DC verifies that each condition of a boolean decision has been
+	  shown to independently affect the outcome of the decision. It is
+	  required for certification by safety standards such as DO-178C
+	  (avionics) and ISO 26262 (automotive).
+
+	  Decisions that the compiler can't instrument are not measured, and
+	  only get branch coverage.
+
+	  If unsure, say N.
+
+config LLVM_COV_MCDC_MAX_CONDITIONS
+	int "Maximum number of conditions in a decision to instrument"
+	range 6 32767
+	depends on COVERAGE_MCDC && LLVM_COV_KERNEL
+	default 6
+	help
+	  This value is passed to the "-fmcdc-max-conditions" option of Clang.
+	  Decisions with more conditions are not instrumented. MC/DC uses
+	  bitmaps to track the executed test vectors, which grow quickly with
+	  the number of conditions.
+
 # The per-subsystem COVERAGE_PROFILE_* options used to be GCOV_PROFILE_*.
 config GCOV_PROFILE_AMDGPU
 	bool
diff --git a/kernel/coverage/llvm/fs.c b/kernel/coverage/llvm/fs.c
index 6f5bc16fea600..99fe5dc50a2fe 100644
--- a/kernel/coverage/llvm/fs.c
+++ b/kernel/coverage/llvm/fs.c
@@ -200,7 +200,8 @@ static const struct file_operations llvm_cov_reset_fops = {
 };
 
 static const struct coverage_backend llvm_cov_backend = {
-	.name	= "llvm",
+	.name		= "llvm",
+	.features	= IS_ENABLED(CONFIG_COVERAGE_MCDC) ? "mcdc" : NULL,
 };
 
 static int __init llvm_cov_init(void)
diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 2acbd40a38f16..8571cd16a2edd 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -188,6 +188,11 @@ config CC_OPT_NO_ALLOW_STORE_DATA_RACES
 config CC_HAS_MNOP_MCOUNT
 	def_bool $(cc-option,-mnop-mcount)
 
+config CC_OPT_WNO_PGO_COVERAGE
+	# clang-22: https://github.com/llvm/llvm-project/commit/80887c7de9d82c809555f52948af1a5d7484e28f
+	# gcc: not supported
+	def_string "$(cc-option-str,-Wno-pgo-coverage)"
+
 config LD_OPT_FORCE_GROUP_ALLOCATION
 	def_string "$(ld-option-str,--force-group-allocation)"
 
diff --git a/scripts/Makefile.llvm-cov b/scripts/Makefile.llvm-cov
index 764adf1730ee9..2ec97bf3cf73a 100644
--- a/scripts/Makefile.llvm-cov
+++ b/scripts/Makefile.llvm-cov
@@ -5,4 +5,13 @@
 CFLAGS_COVERAGE	:= -fprofile-instr-generate -fcoverage-mapping \
 		   -fprofile-update=atomic -fno-jump-tables
 
+ifdef CONFIG_COVERAGE_MCDC
+CFLAGS_COVERAGE	+= -fcoverage-mcdc \
+		   -Xclang -fmcdc-max-conditions=$(CONFIG_LLVM_COV_MCDC_MAX_CONDITIONS)
+# Decisions that MC/DC leaves out are nothing to fix in the code. Disable the
+# warnings here rather than in CFLAGS_COVERAGE, so that KCFLAGS=-Wpgo-coverage
+# can list them. Clang only allows this since version 22.
+KBUILD_CFLAGS	+= $(CONFIG_CC_OPT_WNO_PGO_COVERAGE)
+endif
+
 export CFLAGS_COVERAGE
-- 
2.53.0

