Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC65293E9;
	Mon, 21 Sep 2026 22:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029907; cv=none; b=fklBCc3fNFG7EHumI2Ty9KKEWRsIag7SoYVYX84Qae9PidI+JJwOvpQJsR6SSpx1keh7GF6ycMGHg6xo8drZynvNMozcLIGjq6nnPDaWqT37fa+boOFA+WnsFcsy33YGQRS3MGw0ihXsQS0LKKnMJ5KZktlj9jgCvM9Z7U7AiNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029907; c=relaxed/simple;
	bh=QbTtzBwQJMl+/z4jMTqcEG57LpBKwdizgICybt4/1bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMjQThvTmNkoaJ3lOr5RsjFR3+3Y14R/ygQCwMrQg1AzUTb+yQIubJ2M3b669PnROgqfPRNvlFZRrVPw8v9SMSTXiFuK6UHcn6cdt1qNE/O0b/HR9Iy2i86pRH7xmU4QXheAePunyWYV6LHHggG1XILte7AmoVwEBo86FD+PFPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dkl/MrLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dkl/MrLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AD51F00898;
	Mon, 21 Sep 2026 22:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029906;
	bh=jQYi6Sazt3VmKUUaLRWK7bvt/PaO/0f/TIlcV87yU+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dkl/MrLzADU04GewlPj6qirIx0Ksk0KHi/fnsoGEmw67mBhFetIB4eCS73mrFyxws
	 290q8kjb8AXz3ppA6eqcxktJPCEcimqx10pZ3UM9h4HGcVE78MN9NUtYD82IJ8cizg
	 fv40SNNQPH63FapVmlCnkhepVbYq+Bp2vGMECvEwrZnnjqunIV5L+IgjwqpHawAe1S
	 UGQsY52j5dtYYt98KulB6x8hmFzi3G1OgP/Bkn71wEuA0ihpGKOa36wk0Gb/txTOhl
	 oHXr5vq8QCcs5Lj/+lhcZo8miTXmuLvRazleyNk6MSPiEFaHsCHk+J4krwKPv7p+BM
	 LEVawcnuzl/kw==
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
Subject: [PATCH v3 17/28] x86/entry: Make rewind_stack_and_make_dead() a real function
Date: Mon, 21 Sep 2026 15:31:18 -0700
Message-ID: <cb7a0790917aceb1089548bff7963d1e846ddca8.1790028654.git.jpoimboe@kernel.org>
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

