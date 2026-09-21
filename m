Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A284B52843C;
	Mon, 21 Sep 2026 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029907; cv=none; b=RxIX+J2xHGLtZFqAH7Y82H7KUU51OmZLXgm0g5UZVTIqRVoyRrDBSfT11vd1pg3JHwG2zOfWUs01EQ8RI4hsq6n/HcuXbz3e3dXxOUW8VYWdMEeP1ixAWiF5N6xXrPKP6qspMKDWkAHIAQag6qzuFgQ7b04Xad1NcbWqVSBew6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029907; c=relaxed/simple;
	bh=rVSEkVR6SBUTZB2R3SgDJhSFWaqAggqtqWX5fmRiaoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEmlDIQVgE6kd3850na/GOVqjlrmMKYpcUkjXAkvQLEZ/t4sNjfpGAwWlYUUUbHhTEGPB6V03KkTDxX6pp683jp2XaXIqHqDMAJPQAbrSDBI1VltBk0Q3VAbAdK32k56IWRHFnRwyFi8oE1l1lVj14psEepe/fFrcfgfBy7cc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfaMwJKf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfaMwJKf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2619D1F00893;
	Mon, 21 Sep 2026 22:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029905;
	bh=2cHMsI6LM3UK3hCLl0uDyykDoeXWVJu3Xrmy9WRFSR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XfaMwJKfd93WsfQFeGlC4X25tE0NoQ01lcSeGU48wVFcUWnDB9vvhdCTMBH72u5XO
	 gtcXBoM+bEsnbBusDbeQIOPDXHcmHGoFNFxwvINwkOMN+eNILxSjBWbuAPVa0EBjot
	 oKmPBLxAEK+YTCV2TV1Kede7mKWMaF6EUkBaTaRLg4PLH1nAMNq8yFbvgnYVAju/Ms
	 raOJ1By3c3dW3zX5t+l66rWuEF+x9FmoTtRty3BBLJctXpaCyAF9Cms+6PLTcWbAu3
	 KW4Vqi28v1e5VNiW1JjdYdGXyY1lndewPHIISIMk15d2hMKlTLGjz7aQhQ1htb3I+C
	 TAQfWbgQ/IRnA==
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
Subject: [PATCH v3 16/28] objtool: Detect noreturns in weak functions
Date: Mon, 21 Sep 2026 15:31:17 -0700
Message-ID: <5f9d763a9aabca6100c3f228192e96ae01814d43.1790028654.git.jpoimboe@kernel.org>
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

The skipping of weak functions in the noreturn detection logic is a bit
weird, as a function's return/noreturn ABI shouldn't change regardless
of which version gets linked.

Fix that, and update the global noreturns list as needed.

Note that abort() now needs to be added to the list: while objtool on
vmlinux.o can detect that its noreturn, modules have no way of knowing.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c     | 3 ---
 tools/objtool/noreturns.h | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d3b5c372cba4a..35e24151f5785 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -262,9 +262,6 @@ static bool might_return(struct objtool_file *file, struct symbol *func)
 	struct instruction *insn;
 	struct symbol *dest;
 
-	if (is_weak_sym(func))
-		return true;
-
 	func_for_each_insn(file, func, insn) {
 		if (insn->type == INSN_RETURN)
 			return true;
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index cd41f580ccb72..26f62f98bc8ef 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -11,15 +11,14 @@ NORETURN(__kunit_abort)
 NORETURN(__module_put_and_kthread_exit)
 NORETURN(__stack_chk_fail)
 NORETURN(__ubsan_handle_builtin_unreachable)
+NORETURN(abort)
 NORETURN(acpi_processor_ffh_play_dead)
 NORETURN(do_exit)
 NORETURN(kthread_complete_and_exit)
 NORETURN(kunit_try_catch_throw)
 NORETURN(mpt_halt_firmware)
-NORETURN(nmi_panic_self_stop)
 NORETURN(panic)
 NORETURN(vpanic)
-NORETURN(panic_smp_self_stop)
 NORETURN(rewind_stack_and_make_dead)
 NORETURN(rust_helper_BUG)
 NORETURN(sev_es_terminate)
-- 
2.55.0

