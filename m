Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEBA5304B6;
	Mon, 21 Sep 2026 22:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029913; cv=none; b=qeHmT3iEeh/c0Ascqh6Jvvm3w8MhocoChG7EzO/D1IO88nlREc2gtY2773rkR2LGL4s7pH8eGWYqnV2safkUtd4BrpPYRZ9DIpPmJCVeLCTorS6QXXKW5GMK2nu+65SCzrciwpeQbhiwfNjKaAuMl4bavi3IRakUmNhPi7+tS5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029913; c=relaxed/simple;
	bh=PNHWITRROm7ZKrJEUfVT8jMLmEZBs/qvImyRK8zYQO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xb7Ks3onuI5v4mAQpGdsQYdyBQFA8fxjiGr7BhH+wUWx4Jpk6oZtgOml10IhxRbmivaVc7HQC/hws45iQ1Ljb8kpHgVICngja0EwB7fzxwa+WNg+ct/5UiF6yBSpBSBPnvPCMbPJvehXh13WfYwhpLqnRyYdbBzZQ+frGqP7WzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMrpnDYw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMrpnDYw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3322D1F00893;
	Mon, 21 Sep 2026 22:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029911;
	bh=w9DjV985y2P0T5l1E3RaRZNA9G2dfHptNqJorcFiBKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SMrpnDYwU/tMCKR9/9QZyjil0+J4wijmqWBanlySPKdINlA1cNQ4KGgFF0TBWYoF3
	 UfSWkDSxRsqik3KA1G/NO0eGHJIexGlZUAzgI2iizMCJbLhdqgNGxZ9u+jfBvrH286
	 gUwhcU5loB38O8o+RzrS3UviG2BAPBDMcQvPTHvpjJBygF5PObbywQnw8WdrwQIHlP
	 74pnVcAPD0raFDrIAh+z+Xv2e/r3m8UUF1DusC4osrMeopz/XjI0ZIcMv6IlLnoiTl
	 cTC5uJwRq5X6LZfy3bvGjvmhzqNslOuoLODx+a1a1dSKrqX2StjIjCV+7q5poT50L2
	 so8SIR4m5AzGQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v3 26/28] objtool: Annotate all module-exported noreturns and remove noreturns.h
Date: Mon, 21 Sep 2026 15:31:27 -0700
Message-ID: <1d6a03e9236e0c5758de7ff9deaff75ff25b0b53.1790028654.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790028654.git.jpoimboe@kernel.org>
References: <cover.1790028654.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vmlinux.o objtool pass detects its exported noreturns and writes
them to scripts/noreturns.builtins to avoid needing to keep them
hard-coded in noreturns.h.

However, due to the parallel nature of module linking, module-exported
noreturns are detected too late to be included in the generated file, so
they still need noreturns.h entries.

Instead of hard-coding them in noreturns.h, annotate the functions next
to their declaration sites with ANNOTATE_EXPORTED_NORETURN(), which is a
more robust annotation, and allows us to finally be rid of noreturns.h.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 drivers/message/fusion/mptbase.h        |  2 ++
 include/kunit/test.h                    |  1 +
 include/kunit/try-catch.h               |  2 ++
 include/linux/rtc/ds1685.h              |  2 ++
 tools/objtool/Documentation/objtool.txt |  2 +-
 tools/objtool/check.c                   | 23 +----------------------
 tools/objtool/noreturns.h               |  9 ---------
 7 files changed, 9 insertions(+), 32 deletions(-)
 delete mode 100644 tools/objtool/noreturns.h

diff --git a/drivers/message/fusion/mptbase.h b/drivers/message/fusion/mptbase.h
index b406fd676da09..387b707a66742 100644
--- a/drivers/message/fusion/mptbase.h
+++ b/drivers/message/fusion/mptbase.h
@@ -49,6 +49,7 @@
 #define MPTBASE_H_INCLUDED
 /*{-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=*/
 
+#include <linux/annotate.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/mutex.h>
@@ -942,6 +943,7 @@ extern int	mpt_raid_phys_disk_get_num_paths(MPT_ADAPTER *ioc,
 extern int	 mpt_set_taskmgmt_in_progress_flag(MPT_ADAPTER *ioc);
 extern void	 mpt_clear_taskmgmt_in_progress_flag(MPT_ADAPTER *ioc);
 extern void __noreturn mpt_halt_firmware(MPT_ADAPTER *ioc);
+ANNOTATE_EXPORTED_NORETURN(mpt_halt_firmware);
 
 
 /*
diff --git a/include/kunit/test.h b/include/kunit/test.h
index da5312e0dfa57..9aa4c1d3a9821 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -723,6 +723,7 @@ void __printf(2, 3) kunit_log_append(struct string_stream *log, const char *fmt,
 #define KUNIT_SUCCEED(test) _KUNIT_SAVE_LOC(test)
 
 void __noreturn __kunit_abort(struct kunit *test);
+ANNOTATE_EXPORTED_NORETURN(__kunit_abort);
 
 void __printf(6, 7) __kunit_do_failed_assertion(struct kunit *test,
 						const struct kunit_loc *loc,
diff --git a/include/kunit/try-catch.h b/include/kunit/try-catch.h
index d4e1a5b98ed67..f3c0af4650080 100644
--- a/include/kunit/try-catch.h
+++ b/include/kunit/try-catch.h
@@ -10,6 +10,7 @@
 #ifndef _KUNIT_TRY_CATCH_H
 #define _KUNIT_TRY_CATCH_H
 
+#include <linux/annotate.h>
 #include <linux/types.h>
 
 typedef void (*kunit_try_catch_func_t)(void *);
@@ -54,6 +55,7 @@ struct kunit_try_catch {
 void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context);
 
 void __noreturn kunit_try_catch_throw(struct kunit_try_catch *try_catch);
+ANNOTATE_EXPORTED_NORETURN(kunit_try_catch_throw);
 
 static inline int kunit_try_catch_get_result(struct kunit_try_catch *try_catch)
 {
diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
index 8ec0ebfaef04f..a0e1bf99407b7 100644
--- a/include/linux/rtc/ds1685.h
+++ b/include/linux/rtc/ds1685.h
@@ -21,6 +21,7 @@
 #ifndef _LINUX_RTC_DS1685_H_
 #define _LINUX_RTC_DS1685_H_
 
+#include <linux/annotate.h>
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
 #include <linux/workqueue.h>
@@ -362,5 +363,6 @@ struct ds1685_rtc_platform_data {
  */
 extern void __noreturn
 ds1685_rtc_poweroff(struct platform_device *pdev);
+ANNOTATE_EXPORTED_NORETURN(ds1685_rtc_poweroff);
 
 #endif /* _LINUX_RTC_DS1685_H_ */
diff --git a/tools/objtool/Documentation/objtool.txt b/tools/objtool/Documentation/objtool.txt
index c7ebfb9a8ca6b..d5ac48bc203ec 100644
--- a/tools/objtool/Documentation/objtool.txt
+++ b/tools/objtool/Documentation/objtool.txt
@@ -330,7 +330,7 @@ the objtool maintainers.
    traces and want objtool to ignore it, see "Adding exceptions" below.
 
 
-3. file.o: warning: objtool: foo+0x48c: bar() missing __noreturn in .c/.h or NORETURN() in noreturns.h
+3. file.o: warning: objtool: foo+0x48c: bar() is missing __noreturn in .c/.h
 
    The call from foo() to bar() doesn't return, but bar() is incorrectly
    annotated.  A noreturn function must be marked __noreturn in both its
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index de05789b42ff5..10d89ba0844d1 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -176,24 +176,6 @@ static bool is_sibling_call(struct instruction *insn)
 	return (is_static_jump(insn) && insn_call_dest(insn));
 }
 
-static bool is_listed_noreturn(struct symbol *func)
-{
-#define NORETURN(func) __stringify(func),
-	static const char * const global_noreturns[] = {
-#include "noreturns.h"
-	};
-#undef NORETURN
-
-	if (is_local_sym(func))
-		return false;
-
-	for (int i = 0; i < ARRAY_SIZE(global_noreturns); i++)
-		if (!strcmp(func->name, global_noreturns[i]))
-			return true;
-
-	return false;
-}
-
 /*
  * Use this rather than reading sym->_noreturn directly: the noreturn status
  * lives on the primary alias, and ANNOTATE_IGNORE_NORETURN() overrides it.
@@ -205,9 +187,6 @@ static bool is_noreturn(struct symbol *func)
 	if (func->ignore_noreturn)
 		return false;
 
-	if (is_listed_noreturn(func))
-		return true;
-
 	return func->_noreturn;
 }
 
@@ -4885,7 +4864,7 @@ static int validate_reachable_instructions(struct objtool_file *file)
 		if (prev_insn && prev_insn->dead_end) {
 			call_dest = insn_call_dest(prev_insn);
 			if (call_dest) {
-				WARN_INSN(insn, "%s() missing __noreturn in .c/.h or NORETURN() in noreturns.h",
+				WARN_INSN(insn, "%s() is missing __noreturn in .c/.h",
 					  call_dest->name);
 				warnings++;
 				continue;
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
deleted file mode 100644
index 4e8007a8c2584..0000000000000
--- a/tools/objtool/noreturns.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-/*
- * This is a list of noreturn functions which are exported *by modules*.
- * No other noreturns need to be listed here.
- */
-NORETURN(__kunit_abort)
-NORETURN(kunit_try_catch_throw)
-NORETURN(mpt_halt_firmware)
-- 
2.55.0

