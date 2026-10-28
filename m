Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188893;
	b=1lV5peNw5Cwwq4n65Zve1rlOBRxh+poKFWhuL23CxytU4dHfxnQ14gsrOZMZXnI3iq3v
	 lRzAmLB1wraEF5gegMr63Jt5Io9XdLZFUohK72Bjs2Yu4XBnfLhyjmGbiGyyPP9uJYytE
	 W6vAD9gTl9qTqgAkFjPXde/IpinCmYLx81W4I2CIToISNcR+/Qm+/fsfSzft6J386w94q
	 iW/7TbsvXAZ3QfH++L8RJkTmLT/F64KqR7GqoigCY5tkHKwiuet3HMMkxsmnZtJflxpg8
	 mezJ8hBEGmIktk6hy/kVZOTxSWsZE0rFYcAWPrwubhiSPLdFAJBuieI2VZi2VUg7p+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188893;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=06P3NBYjMCtOrztfs1wSnGlXZi7V2R3u1OzmTPpiQ+w=;
	b=VNBu6bfMAe1irbjCdGJg3G5fiyIpkjTa1fn8zkTuq9bGApnhHZrL44FkoD32LptJS1ZR
	 vnNsY7KHQTdT9/V7/WxmTxlpktH/PE1NiAVDtrw0GFKoQxnqFNhsGs20jcOvSzM/ffZgs
	 R57sY1VBryALpo3b5VBBa7BLoYrv0baEx+z6N0LBb4ZhZnShWo3LJv0ZNiUUptRFQPBd6
	 lKi91jO8m+bOqBhZiaHlh4MJtsZfkiBUPIvRtEQl81HuuzcuRibLWFTDlhfO1b0+nptNL
	 6eNcFGLT1czdWpP3DyJL1omm774WJ9bcsviJzXPDo0tnNZWrgv7+5jcJU1nfGqGgoRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLRqsRQc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246060A3824;
	Wed, 28 Oct 2026 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLRqsRQc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12C81F031E2;
	Wed, 28 Oct 2026 12:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188893;
	bh=06P3NBYjMCtOrztfs1wSnGlXZi7V2R3u1OzmTPpiQ+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oLRqsRQcwlbnosapGQ949rNbWgQONbmo9cTZV4Y6jsPad+EJuOLSxE6rlyMXvrVcq
	 lZsM0Z6XRbnyYUrxHN+JRqqhwNiGDcorB2MR9uZ47HNnn+nGfX7388O226XDWi2vY2
	 Jrp4vePmcn6pZpspdgFmwg2tl5ypHdP8MV339iwPZ/BGemrU5Foyo2oN69Ft+COI7Z
	 TvRhYZPlGgfWEDnI/0Rj72VMApTrnQvuBv3dpaXPeUDzhoOjc51UPQqTr1e92IkiZa
	 Maqu0WlvgCN6f01Ylxs8RxIZDuGaBY5GTyC1gE7jB2Wb0NfYzreDNf/FDw1D+RLrcs
	 o4lNryOnLls0w==
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
Subject: [RFC PATCH 19/20] gcov: add MC/DC condition coverage support
Date: Wed, 28 Oct 2026 07:59:43 -0400
Message-ID: <20261028120034.871983-20-sashal@kernel.org>
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

Support CONFIG_COVERAGE_MCDC with gcov, using GCC's MC/DC condition
coverage instrumentation (-fcondition-coverage), which is available
since GCC 14. The data is shown by "gcov --conditions".

Add -fcondition-coverage and -Wno-error=coverage-too-many-conditions to
the gcov compiler flags when enabled. Both flags are gated on the config
option to avoid Clang warnings about unknown options.

Also add -fcondition-coverage to CFLAGS_REMOVE in the x86 UML vDSO
Makefile to prevent instrumentation of userspace vDSO code.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/um/vdso/Makefile | 4 ++--
 kernel/coverage/Kconfig   | 7 +++++--
 kernel/coverage/gcov/fs.c | 5 +++--
 scripts/Makefile.gcov     | 3 +++
 4 files changed, 13 insertions(+), 6 deletions(-)

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
index fab3da51305bb..5990e366db994 100644
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
 	  Decisions that the compiler can't instrument produce build warnings
 	  and are not measured.
 
+	  With gcov this requires GCC 14 or later, and the data is shown by
+	  "gcov --conditions".
+
 	  If unsure, say N.
 
 config LLVM_COV_MCDC_MAX_CONDITIONS
diff --git a/kernel/coverage/gcov/fs.c b/kernel/coverage/gcov/fs.c
index 23d366dcfc2f7..dfaccc01e06f3 100644
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
index 1620b81398eaa..b00dd40f2167d 100644
--- a/scripts/Makefile.gcov
+++ b/scripts/Makefile.gcov
@@ -19,4 +19,7 @@ CFLAGS_COVERAGE	+= $(call try-run,\
 	cmp -s "$$TMP.ubase" "$$TMP.utest",\
 	-fprofile-update=prefer-atomic)
 endif
+ifdef CONFIG_COVERAGE_MCDC
+CFLAGS_COVERAGE	+= -fcondition-coverage -Wno-error=coverage-too-many-conditions
+endif
 export CFLAGS_COVERAGE
-- 
2.53.0

