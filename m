Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309CF3D25CE;
	Fri, 28 Aug 2026 04:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892730; cv=none; b=a+eXLZdllZMiM/Q71GEyLrW17QQoSp2BH+/CkvdL5nZ8wbfPXf1YhRLWf1ajIMdM400hooXuBMdlElKdlh2kcDNt/IG09qszrbrYEPTVZctPbW42up1d0u4jceg2Cb5kKXfg5WSbvxFu8E+aMcvIFEuC83wB+MQj7BliEPdQz/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892730; c=relaxed/simple;
	bh=sCZ3hweuqbfpF1gSR/JkKIXGd/XRyniPEZdBWxif+Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOYML2XeqOOq/jkGWi7CZxDGUJr1J+QNaoILtiIL2A8HioNOJLMnJMR+n4FtD5teBrtAEdFEiHpFSI0UoLONZaKduh5xQgUKG/gDSvPGws5Hl+WdD9082PP8lfdzNJ/kSUfid0Y++po2EV1XCaEdVGFlecWq3Z5I7fyfclilJ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ud6Qfdpo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ud6Qfdpo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C5A1F000E9;
	Fri, 28 Aug 2026 04:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892729;
	bh=XLJeW1VlhLkwfJzchxr4ycnasjucLgUzud4kf/dIfwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ud6QfdpoRKGYeQCrIBb/kbBDMmF63SyCaOeCCkRlyJiYEeY2Qm9RQZtcWH/0LY4re
	 frjpau+HEQ6JG6rfOGbftsCW2HLfeq7Rn+Neb9o+ZG3zDHuPi1kHT4GyKKYl7kRca/
	 l3/DNdVYIosEyhVdoKXIvf7ksnn1wvmgvnYxKqEOeVUigSxLqxLL+atriTYI07iZ5i
	 sbUjKnhxl5D1bP/N+S59SSzEjSfM0kefomjArwXSN1YQFHx2QZdgwpm6xnylLW0/zM
	 zN8/g9bFqOKq0rey6oXmpXrIQt7/ukH4UpdxcHZUSF1AeuV08hL8ptZDujQnON9z9t
	 o86iO2qayKy1g==
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
Subject: [PATCH 17/27] x86/entry: Make rewind_stack_and_make_dead() a real function
Date: Thu, 27 Aug 2026 21:51:46 -0700
Message-ID: <8f13a2da7d267bffb1b2675f26152429da56a273.1787890035.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787890035.git.jpoimboe@kernel.org>
References: <cover.1787890035.git.jpoimboe@kernel.org>
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
index c6d996593f329..1184bf1f9ed7e 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -1480,9 +1480,7 @@ SYM_CODE_START(entry_SYSCALL32_ignore)
 SYM_CODE_END(entry_SYSCALL32_ignore)
 
 .pushsection .text, "ax"
-	__FUNC_ALIGN
-SYM_CODE_START_NOALIGN(rewind_stack_and_make_dead)
-	UNWIND_HINT_FUNC
+SYM_FUNC_START(rewind_stack_and_make_dead)
 	/* Prevent any naive code from trying to unwind to our caller. */
 	xorl	%ebp, %ebp
 
@@ -1491,7 +1489,8 @@ SYM_CODE_START_NOALIGN(rewind_stack_and_make_dead)
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

