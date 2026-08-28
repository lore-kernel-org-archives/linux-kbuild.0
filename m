Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF15B3D349F;
	Fri, 28 Aug 2026 04:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892731; cv=none; b=FN1S6ipbicaqsaNuutiE15QFqb08AmcvVh1EST/o++olN+vdketxO5xa+EP685+oxc75/S4wlw/1xBCMR10mKMO7YEJfiFaIvrVGXK56uBS/wgPlKL5f0nPcSZZNMaLzLBaVGQBMRIgrnEmMVFOUgMYsvg5htA7TnzrB+H0YpkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892731; c=relaxed/simple;
	bh=/Fh6ECh5PUipY2MuOCfqQU9wpCqGcFXXSLNL3uT0NYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtWDIsOwvLzeoPTfgKu1LMtlP320sWF8iSmfjErZZLMw10ZfY2jAVRJNCJFTpm4JMLq+X6MgwgI4D/mfUcSxQVLVO/D6oD9t8iWTMnUbnkidO8LdBBqYLpKbOjdmX6dTpOm/OP4eh34EYPxxAFN+vP9rZGBUe235ymvGwGzT5pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mS3HVa76; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mS3HVa76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406601F00A3D;
	Fri, 28 Aug 2026 04:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892729;
	bh=yxTbQgBZYQugQzsbsUlaD2OTcmFXado/QiZ/FDE5CKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mS3HVa76ljubYwy3Fcb7EHMPutpNboNwj3QF6Un8P1BIqWRNIpDof0kZZxvrJdfeR
	 3PFDTFY7QOfPhuWmtfzJbFqg1mmUSoqh3JVBUCtVwFNtPXpiEkTPWYurc+lluJBQEg
	 v6o8VgVL462ung0gq4B0MBur4qSyfUzCCGy3qdoUeZtwQkT9vEyif37eElpOdZPxnE
	 9LzaQ2bBnIPXJJz4i/xnXcAIvH5UpIa9D7dvakCZxs1VVlcxhtKJY6sSHSXSamyCVt
	 VoDkaj5QcTvO2q6vu8CrTX/0K0y5JQngRSGJaYsyqieU0qcR1Q3Ns0vRAcJFiJVGOa
	 T89vtyUqfLHsw==
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
Subject: [PATCH 18/27] x86/xen: Make xen_cpu_bringup_again() a real function
Date: Thu, 27 Aug 2026 21:51:47 -0700
Message-ID: <c2d7db945dc838233b64e724a88b57d22cd3af8d.1787890035.git.jpoimboe@kernel.org>
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

xen_cpu_bringup_again() is SYM_CODE because it switches stacks, but it's
otherwise a callable function from C.

Convert it to STT_FUNC so objtool can detect that it's noreturn and its
entry can be removed from the hard-coded global noreturns list.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/xen/xen-head.S   | 5 +++--
 tools/objtool/noreturns.h | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 5dad6c51cdc34..68d769772f309 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -55,12 +55,13 @@ SYM_CODE_START(asm_cpu_bringup_and_idle)
 	call cpu_bringup_and_idle
 SYM_CODE_END(asm_cpu_bringup_and_idle)
 
-SYM_CODE_START(xen_cpu_bringup_again)
+SYM_FUNC_START(xen_cpu_bringup_again)
 	UNWIND_HINT_FUNC
 	mov	%rdi, %rsp
 	UNWIND_HINT_REGS
 	call	cpu_bringup_and_idle
-SYM_CODE_END(xen_cpu_bringup_again)
+SYM_FUNC_END(xen_cpu_bringup_again)
+STACK_FRAME_NON_STANDARD_FP(xen_cpu_bringup_again)
 .popsection
 #endif
 #endif
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index ff93e94ee09a0..01c94f20d1818 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -21,5 +21,4 @@ NORETURN(panic)
 NORETURN(vpanic)
 NORETURN(rust_helper_BUG)
 NORETURN(sev_es_terminate)
-NORETURN(xen_cpu_bringup_again)
 NORETURN(xen_start_kernel)
-- 
2.55.0

