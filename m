Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670794;
	b=ds8qL0P4cuazucF8/byWJcfIS1USg6JtU61SAtad5Eccs6uGoY5vMuczhNsdN1xxETbL
	 BZ63PLghs3vCE3XCvuEwdZ2eIiv6/kRAG+xpmSyKf8ia7fnLfYE6acLu+mS6XIzoXW6TS
	 y7bK4F8xWYwF6emjeBZHbbSG0+tzeSjbjrjm55UPBQzmsGj2oN3+WnGlmKWBjFf+0Vzp9
	 z2UYpiJIYPvfVkpGiwVEf90cHnAafWTqT7U/z7Uhvf7+x0tRMOQ8lTdg9fHPJqtvCW6sR
	 WPnkvEm4vnnryu9HM+GTw3cIuksCrfppiX0phMETr2VrYtIYTYc2yK6RoX3HNdf5Trw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670794;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9d6Rr+p5PXOZDvPem8sLSBEFhwoGFFzLeX4U/7Xsf4c=;
	b=qO4eu1bWOdASa4AtCfnpB1SPHzx3b45vidk57DpdDNT/7KgPv5dcNY+f6tllhKXrt2vF
	 +x2TOmuY5WsSa72aCl6mRs6eIw1AXD0aKeDjO2MyeDd3PhEvuDfwB2LJZvkMpGH+662Dt
	 ysdEmhP/kY4+vFpWvCQdAFqpett7UOF8nb9B8w6Z1yurUqstCatwzbGhGtojS/LT/+mAg
	 fk0D/dm3yyJoCDazkQFVrK6DI3g32WhF5Uyv7BfcWfasfi4DuN9sd88JZ2ocgOLDi3feF
	 K6tzEdqr6AAJiG5nT3f3ZmZqw0+HBy76iidSghE/tZbjPoPHvXzIE+J2dCupHnNuDGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcBUmVen;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60350606D833;
	Tue,  3 Nov 2026 01:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcBUmVen
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3731F000C1;
	Tue,  3 Nov 2026 01:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670794;
	bh=9d6Rr+p5PXOZDvPem8sLSBEFhwoGFFzLeX4U/7Xsf4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TcBUmVengGhxr7ezJhyS1pJ8CZ71XILEQiyNBiv8LSPNZvZ6146hE2+yMr7ijSFsF
	 HO9vAe+bMZgKuXaDZfz85khH46Uv35Q0F7ayaLiQf/UV3hyUoMNtlvglcBUL3HQYYH
	 WJrKEzLvQi9zIqmLZLRCAzy6O3NSyBIh3++3suMsDvizGcmxlMhog/BmW2zjj8kZxc
	 bdvXN3Amvg11XcCuWytw+4/jE+iRDdvd2wjzgUv5zvTL9qxXSxQynyQMTfYexZr7og
	 EVEr75x2L+GTVFQ1do4ne4tCdE1yWTpk6Jp8bLCjkqHLk8LY3qKvfpdWboeI8VKhWh
	 zF/VzZx6/QmbQ==
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
Subject: [PATCH v2 16/20] coverage: add MC/DC measurement
Date: Mon,  2 Nov 2026 20:52:34 -0500
Message-ID: <20261103015238.3780910-17-sashal@kernel.org>
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
only allows disabling them since version 22: older versions keep
warning, and can't be used together with CONFIG_WERROR.

Link: https://en.wikipedia.org/wiki/Modified_condition%2Fdecision_coverage [1]
Link: https://digital-library.theiet.org/content/journals/10.1049/sej.1994.0025 [2]
Link: https://clang.llvm.org/docs/SourceBasedCodeCoverage.html#mc-dc-instrumentation [3]
Originally-by: Wentao Zhang <wentaoz5@illinois.edu>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/coverage/Kconfig   | 26 ++++++++++++++++++++++++++
 kernel/coverage/llvm/fs.c |  5 +++--
 scripts/Makefile.llvm-cov |  9 +++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/kernel/coverage/Kconfig b/kernel/coverage/Kconfig
index acfcce23e4c97..8d9d5f063aea6 100644
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
index 5babb09b6d3e6..e2875836291b8 100644
--- a/scripts/Makefile.llvm-cov
+++ b/scripts/Makefile.llvm-cov
@@ -3,4 +3,13 @@
 CFLAGS_COVERAGE	:= -fprofile-instr-generate -fcoverage-mapping \
 		   -fprofile-update=atomic
 
+ifdef CONFIG_COVERAGE_MCDC
+CFLAGS_COVERAGE	+= -fcoverage-mcdc \
+		   -Xclang -fmcdc-max-conditions=$(CONFIG_LLVM_COV_MCDC_MAX_CONDITIONS)
+# Decisions that MC/DC leaves out are nothing to fix in the code. Disable the
+# warnings here rather than in CFLAGS_COVERAGE, so that KCFLAGS=-Wpgo-coverage
+# can list them. Clang only allows this since version 22.
+KBUILD_CFLAGS	+= $(call cc-disable-warning, pgo-coverage)
+endif
+
 export CFLAGS_COVERAGE
-- 
2.53.0

