Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188886;
	b=FlzS0QvAIHE1mGhx9zH7yPAY4Nym3LHEUZrdvpqg1YMviG2aGwuXdxy0/4FWJ91H75l7
	 7JmwLl+VFrZsB0asIwggpZsVJ1LnC6CaNGCJQj9EiEfmcaxtcgYX5gCXVY4Ay/d2qfGv/
	 772yyQUYqcXcORvWLVCxtRvYI4hVSgF14cS5EhSkfDeYQooQPQ8XYkph/XgPTr9ZtcseH
	 9LLH88D8MFqd9VuL3799M22l1X59qDDw/fOqJJAxrrIKzvkHFbWppNjb/JIvSkhhV41Gg
	 IQ1ZtxZDgI9jB/mWK7xox4g/83zbhDgjePwJKlHl3J95ZmtT5GfkInpof2hty4EHhvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188886;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=dxCumqUGHFQ9o9VUxW674GBbPqED8e6lG0oQ1wyKWI0=;
	b=UBWovPwwj/s7SmZrWN51o/WkDuUNYtYnC1CaK+GT/n6M1esGsVwBUzFp5Py9SYsPnvkU
	 RS47JyOx9W72VN11q5GpkuKG1vdqUGHPGRd5QYmnWE1TyU2fToXSLzqQiI2Fy9auYN2lE
	 D3SL5/q95plWD5XBoEG/GuYYB8XFWl4+StjWsmDcPbLZYIufny01WxQh8MNyMUvggvL+n
	 GWcHwKznR4CK10pO0AHUvRvmF4d/lvu4S120Zo9Rno99xO2juBzfWANNEq44YEXmcEyY+
	 4imbir/bRJznUNTMXpC5oKSlX6FboCpyaqjELlFvULYHYvdtesrgvrnYhWaLvRFzsPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSJYDM0j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E64606A31D;
	Wed, 28 Oct 2026 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSJYDM0j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFC91F01829;
	Wed, 28 Oct 2026 12:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188885;
	bh=dxCumqUGHFQ9o9VUxW674GBbPqED8e6lG0oQ1wyKWI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZSJYDM0jy+LeLoR7aR1f7MBy8Ucw/hl1iB9Kt12nFdE0A+g6QtX1j5DGZ+m7vgb/p
	 y6+H6EgyLsIuhylF+Al2Le5DxfI/CuUjxldoZouQpD5XH69pShgsjOKFDXwIlafBrD
	 eadVyAcAFIY2hXIRZeHpvXeiimVoxN7/5Hvy2tmF/UAFN7eWUU60RZZmnPCzpyUoGN
	 DynMZ7b9EvbkTLIxeWkiTQ13zYYA7N6SIlnjx/iIgnL/45+7+m0Sacsjka7e2LQHhQ
	 UDL4NEKkjNy8tyuyGwASUX4rU4EnJ8FV8BnqnyZR4kJkKw+70VZ4Hp0nVj+gOpE/1R
	 wCi+Xfjy1A5MQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Wentao Zhang <wentaoz5@illinois.edu>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
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
	Thomas Gleixner <tglx@kernel.org>
Subject: [RFC PATCH 16/20] coverage: add MC/DC measurement
Date: Wed, 28 Oct 2026 07:59:40 -0400
Message-ID: <20261028120034.871983-17-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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
Larger decisions, and decisions the compiler can't instrument, produce
warnings. Starting with Clang 22 they are kept from becoming errors
with CONFIG_WERROR; older versions can't be used together with it.

Link: https://en.wikipedia.org/wiki/Modified_condition%2Fdecision_coverage [1]
Link: https://digital-library.theiet.org/content/journals/10.1049/sej.1994.0025 [2]
Link: https://clang.llvm.org/docs/SourceBasedCodeCoverage.html#mc-dc-instrumentation [3]
Originally-by: Wentao Zhang <wentaoz5@illinois.edu>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/coverage/Kconfig   | 26 ++++++++++++++++++++++++++
 kernel/coverage/llvm/fs.c |  5 +++--
 scripts/Makefile.llvm-cov |  5 +++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/kernel/coverage/Kconfig b/kernel/coverage/Kconfig
index acfcce23e4c97..fab3da51305bb 100644
--- a/kernel/coverage/Kconfig
+++ b/kernel/coverage/Kconfig
@@ -106,6 +106,32 @@ config COVERAGE_PROFILE_ALL
 	  larger and run slower. Also be sure to exclude files from profiling
 	  which are not linked to the kernel image to prevent linker errors.
 
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
+	  Decisions that the compiler can't instrument produce build warnings
+	  and are not measured.
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
+	  Decisions with more conditions produce warnings and are not
+	  instrumented. MC/DC uses bitmaps to track the executed test vectors,
+	  which grow quickly with the number of conditions.
+
 # The per-subsystem COVERAGE_PROFILE_* options used to be GCOV_PROFILE_*.
 config GCOV_PROFILE_AMDGPU
 	bool
diff --git a/kernel/coverage/llvm/fs.c b/kernel/coverage/llvm/fs.c
index e90c325daeba3..16ada19650d07 100644
--- a/kernel/coverage/llvm/fs.c
+++ b/kernel/coverage/llvm/fs.c
@@ -184,8 +184,9 @@ static void llvm_cov_reset(void)
 }
 
 static const struct coverage_backend llvm_cov_backend = {
-	.name	= "llvm",
-	.reset	= llvm_cov_reset,
+	.name		= "llvm",
+	.features	= IS_ENABLED(CONFIG_COVERAGE_MCDC) ? "mcdc" : NULL,
+	.reset		= llvm_cov_reset,
 };
 
 static int __init llvm_cov_init(void)
diff --git a/scripts/Makefile.llvm-cov b/scripts/Makefile.llvm-cov
index 5babb09b6d3e6..771a033a92669 100644
--- a/scripts/Makefile.llvm-cov
+++ b/scripts/Makefile.llvm-cov
@@ -3,4 +3,9 @@
 CFLAGS_COVERAGE	:= -fprofile-instr-generate -fcoverage-mapping \
 		   -fprofile-update=atomic
 
+ifdef CONFIG_COVERAGE_MCDC
+CFLAGS_COVERAGE	+= -fcoverage-mcdc $(call cc-option,-Wno-error=pgo-coverage) \
+		   -Xclang -fmcdc-max-conditions=$(CONFIG_LLVM_COV_MCDC_MAX_CONDITIONS)
+endif
+
 export CFLAGS_COVERAGE
-- 
2.53.0

