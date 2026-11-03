Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670800;
	b=NqvRObCZaWYxtf6hj4Yal37qV+OYtgJGufYZaStmvlie53KyJo2nxmzbyh9QNkYUGzMk
	 Inl8r4RH12bPzqDVdx7lNXPjWg+WXExcsUam+Ajuja+9CpgRaOt6FVWho+VazaZ6E37kM
	 ikMm5Ovg16kfir85qgEu1VeSgl9tMUNa/pSl7z4Fm3ZswpcS+AjH7STdYQ7oU2HunUQ2p
	 aoZHQQzaYVVbf07MiTNDOqY7MVRvR3d1sOSMeqncSIvNvKA155+SZFrtKs70+JLdFKySJ
	 CsT/xDUfgrej4xFcRvyX24UDntW0PZbth0OtmZqzSV+jZ7ON7D9M53nmQkzljRXsQ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670800;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0+mSBXLNAA0dwXnlKGB4VzBTQaYn7txRakynf3QsRrI=;
	b=5QR2DL/FhdJCHN37nD/WqQe/p/ssr4h53/E+U6MpHBc738o/ePvCAdYMqLuoBHOuHXx0
	 fTnGYH5NV+WObSh96E8AWBqbMLxOkV31E9vTEG+oxhR4WEgtbxtb73GODA0WPmYZLri6o
	 ShJZyrhzEYDR9zT3269VXynMOwUVzsQy0Aq5+cXw7rZ0JZhknQraZyLGKd/upxFfEgVyt
	 r4U10nXmramUUJakjdfgc1DAQlX5GfjAdBQXhn8KSOmHKLkjONnYi7EH3KSdwK4HZ9IBU
	 rxC4Bcuknzt5mqupJLEBCDBbYYIBzpaDOmrz9Sae/+dmSS44yq03Fe6zTILn0IfNm0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQsuSs5S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19B9606EEAC;
	Tue,  3 Nov 2026 01:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQsuSs5S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093F41F00A1C;
	Tue,  3 Nov 2026 01:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670799;
	bh=0+mSBXLNAA0dwXnlKGB4VzBTQaYn7txRakynf3QsRrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PQsuSs5Slt57uw2KiTg6p4IuEa6Ftql8y0WZ7NtYUqc9vQkDT6kH6yQipP/KsjGc0
	 Ut8f/YMCuEP/FOq7hIL2TW/FDdDrPf0IgH5nlFRRyWD085o5fQ+DUUzH7F41fdwsX1
	 HenktnIQU5lFIFkHCly1le05TUVhh2DZvy8vbOwfbRnTqb9Aqh6dLhXGnSFPb/RHYX
	 AioF/jLDPY+MCwbZAhr9sz8nhzegq76YTza92QO0PNnFUBwodcKT+b3eVM8mO4+G3l
	 wvOw5yRDQigt0zvDAbW8z+alJXSJtfDNuNlGVlm+GH1/aev489EPbP04Csf1bxkztu
	 qXhoNMfPZNM5A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	linux-kbuild@vger.kernel.org,
	linux-um@lists.infradead.org,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Subject: [PATCH v2 19/20] gcov: add MC/DC condition coverage support
Date: Mon,  2 Nov 2026 20:52:37 -0500
Message-ID: <20261103015238.3780910-20-sashal@kernel.org>
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

Support CONFIG_COVERAGE_MCDC with gcov, using GCC's MC/DC condition
coverage instrumentation (-fcondition-coverage), which is available
since GCC 14. The data is shown by "gcov --conditions".

Add -fcondition-coverage to the gcov compiler flags when enabled, and
disable the warnings about decisions it leaves out, as is done for
Clang. Both are gated on the config option to avoid Clang warnings
about unknown options.

Also add -fcondition-coverage to CFLAGS_REMOVE in the x86 UML vDSO
Makefile to prevent instrumentation of userspace vDSO code.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/um/vdso/Makefile | 4 ++--
 kernel/coverage/Kconfig   | 7 +++++--
 kernel/coverage/gcov/fs.c | 5 +++--
 scripts/Makefile.gcov     | 5 +++++
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/x86/um/vdso/Makefile b/arch/x86/um/vdso/Makefile
index 7664cbedbe30f..adfc57c1a726d 100644
--- a/arch/x86/um/vdso/Makefile
+++ b/arch/x86/um/vdso/Makefile
@@ -42,8 +42,8 @@ $(vobjs): KBUILD_CFLAGS += $(CFL)
 #
 # vDSO code runs in userspace and -pg doesn't help with profiling anyway.
 #
-CFLAGS_REMOVE_vdso-note.o = -pg -fprofile-arcs -ftest-coverage
-CFLAGS_REMOVE_um_vdso.o = -pg -fprofile-arcs -ftest-coverage
+CFLAGS_REMOVE_vdso-note.o = -pg -fprofile-arcs -ftest-coverage -fcondition-coverage
+CFLAGS_REMOVE_um_vdso.o = -pg -fprofile-arcs -ftest-coverage -fcondition-coverage
 
 #
 # The DSO images are built using a special linker script.
diff --git a/kernel/coverage/Kconfig b/kernel/coverage/Kconfig
index 8d9d5f063aea6..3429bc902c934 100644
--- a/kernel/coverage/Kconfig
+++ b/kernel/coverage/Kconfig
@@ -108,8 +108,8 @@ config COVERAGE_PROFILE_ALL
 
 config COVERAGE_MCDC
 	bool "Measure modified condition/decision coverage (MC/DC)"
-	depends on LLVM_COV_KERNEL
-	depends on CLANG_VERSION >= 220000 || !WERROR
+	depends on LLVM_COV_KERNEL || (GCOV_KERNEL && CC_HAS_CONDITION_COVERAGE)
+	depends on !LLVM_COV_KERNEL || CLANG_VERSION >= 220000 || !WERROR
 	help
 	  MC/DC verifies that each condition of a boolean decision has been
 	  shown to independently affect the outcome of the decision. It is
@@ -119,6 +119,9 @@ config COVERAGE_MCDC
 	  Decisions that the compiler can't instrument are not measured, and
 	  only get branch coverage.
 
+	  With gcov this requires GCC 14 or later, and the data is shown by
+	  "gcov --conditions".
+
 	  If unsure, say N.
 
 config LLVM_COV_MCDC_MAX_CONDITIONS
diff --git a/kernel/coverage/gcov/fs.c b/kernel/coverage/gcov/fs.c
index a761cfb837414..689b8b9a0d16a 100644
--- a/kernel/coverage/gcov/fs.c
+++ b/kernel/coverage/gcov/fs.c
@@ -866,8 +866,9 @@ void gcov_event(enum gcov_action action, struct gcov_info *info)
 }
 
 static const struct coverage_backend gcov_backend = {
-	.name	= "gcov",
-	.reset	= gcov_reset_all,
+	.name		= "gcov",
+	.features	= IS_ENABLED(CONFIG_COVERAGE_MCDC) ? "mcdc" : NULL,
+	.reset		= gcov_reset_all,
 };
 
 /* Create debugfs entries. */
diff --git a/scripts/Makefile.gcov b/scripts/Makefile.gcov
index 1cfe04d89b0a2..977c8ee023f68 100644
--- a/scripts/Makefile.gcov
+++ b/scripts/Makefile.gcov
@@ -18,4 +18,9 @@ CFLAGS_COVERAGE	+= $(call try-run,\
 	cmp -s "$$TMP.ubase" "$$TMP.utest",\
 	-fprofile-update=prefer-atomic)
 endif
+ifdef CONFIG_COVERAGE_MCDC
+CFLAGS_COVERAGE	+= -fcondition-coverage
+# As for Clang: KCFLAGS=-Wcoverage-too-many-conditions lists what's left out.
+KBUILD_CFLAGS	+= -Wno-coverage-too-many-conditions
+endif
 export CFLAGS_COVERAGE
-- 
2.53.0

