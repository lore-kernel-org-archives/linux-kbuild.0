Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765125A5154;
	Tue,  8 Sep 2026 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899678; cv=none; b=PtFmoBzXy8aXpM6soXkRAo7XlzmJHs8k++0fEGvr1G9kWjCqp9Hk8eXBkfqHhya8a290JK+XMevT2+QN83vwZ8zXxC2+Ti4NZ3hE2T6iFB9vioiHJRwD/rvmCTg+LvJHtnujSZxtqc1POfaPmgWJL8Mjz3QlKBrHufwKjRzOM+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899678; c=relaxed/simple;
	bh=QbTtzBwQJMl+/z4jMTqcEG57LpBKwdizgICybt4/1bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OM3Yq8auEaklZYeB9nBKc/NF6gYfG1RMOLztU18YdeeY/Z3oeDmSuKOeSddbdZtUk0JQvrWLur+FnOw55Wz1Q6RcgiHPvMh7a1HCiU0ahfXyM7iVUAh8AREFmhtU1l08duVO0fnX5r+Gdh9vPVtMzevdXZNnIV8H5NWWMhrCDgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQSrFsii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQSrFsii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40B41F00A3D;
	Tue,  8 Sep 2026 20:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899677;
	bh=jQYi6Sazt3VmKUUaLRWK7bvt/PaO/0f/TIlcV87yU+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HQSrFsiiKWa3oFD3IrkjxUsUDOVfXzezN76E6FiBJSWLrmIhMspJH97StseS9vs8i
	 Y0iBX0VNO61rmGu0gZxQjI+Cvfzl9O8QaZfD0ML5FWIdiMelcVincnCklbCcym9ywx
	 10dLAJq6TuWHjFp8hbRD7NCMlNpCE0DMKORisiFE4BMEvnMpLAYeAuA1S0eTD2CC2u
	 GaDu66vkc9vHze+exfMeye2AtPWV3mASLe3AebH/ykkTmYE7JD5zKeNtZ+OOwmbnh+
	 nF6DRdDGkIu2KdZhv2GO+1ahHomubDKKS+KiDVOI0vUPq1Yj3D3SGR5KJ8MYSySely
	 h5KZ0k5eTxuog==
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
Subject: [PATCH v2 17/27] x86/entry: Make rewind_stack_and_make_dead() a real function
Date: Tue,  8 Sep 2026 13:33:29 -0700
Message-ID: <5d9d1c26b10f9706284b72cbad84a7e92b69eb14.1788899473.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788899473.git.jpoimboe@kernel.org>
References: <cover.1788899473.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rewind_stack_and_make_dead() is SYM_CODE because it switches stacks, but
it's otherwise a callable function from C.

Convert it to SYM_FUNC so objtool can detect that it's noreturn and its
entry can be removed from the hard-coded global noreturns list.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/entry/entry_64.S | 7 +++----
 tools/objtool/noreturns.h | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 253f0a585927f..2f4d930d9977d 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -1486,9 +1486,7 @@ SYM_CODE_START(entry_SYSCALL32_ignore)
 SYM_CODE_END(entry_SYSCALL32_ignore)
 
 .pushsection .text, "ax"
-	__FUNC_ALIGN
-SYM_CODE_START_NOALIGN(rewind_stack_and_make_dead)
-	UNWIND_HINT_FUNC
+SYM_FUNC_START(rewind_stack_and_make_dead)
 	/* Prevent any naive code from trying to unwind to our caller. */
 	xorl	%ebp, %ebp
 
@@ -1497,7 +1495,8 @@ SYM_CODE_START_NOALIGN(rewind_stack_and_make_dead)
 	UNWIND_HINT_REGS
 
 	call	make_task_dead
-SYM_CODE_END(rewind_stack_and_make_dead)
+SYM_FUNC_END(rewind_stack_and_make_dead)
+STACK_FRAME_NON_STANDARD_FP(rewind_stack_and_make_dead)
 .popsection
 
 /*
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index 26f62f98bc8ef..ff93e94ee09a0 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -19,7 +19,6 @@ NORETURN(kunit_try_catch_throw)
 NORETURN(mpt_halt_firmware)
 NORETURN(panic)
 NORETURN(vpanic)
-NORETURN(rewind_stack_and_make_dead)
 NORETURN(rust_helper_BUG)
 NORETURN(sev_es_terminate)
 NORETURN(xen_cpu_bringup_again)
-- 
2.55.0

