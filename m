Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC818529409;
	Mon, 21 Sep 2026 22:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029908; cv=none; b=J+MRnRIxa9AHlo8lRBSI2ITfpVICHFfdtevQzUmckYdojrHTKEKG9LJY6TtxSjX7bRYchjWw6ZnpWUJvq2dnM0+CB1OfqDpxxU+f3KMGaYIjPLIV1JQM3V3id98GEWeOlynhY1bCrlQUSwMF8/fBjX0bOXcol/QUHgUTULq99vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029908; c=relaxed/simple;
	bh=/Fh6ECh5PUipY2MuOCfqQU9wpCqGcFXXSLNL3uT0NYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxG/LTBWXta1XNmburOWcR7Op8+bDpINtjUao6uQEnXg/EI5C3xCZQqCp5t9i7SE3rAdYfNeYkyjlC1F6YpMvZh5O4FMcXavVIfiyCnTR/Y465T0XAqNa9B8Leuzs2FQkqNr2ckGJR00ODsxZRqMX2YaVvvqAgUocYGP5ynEcCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fmz4NIjF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fmz4NIjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4642B1F00899;
	Mon, 21 Sep 2026 22:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029906;
	bh=yxTbQgBZYQugQzsbsUlaD2OTcmFXado/QiZ/FDE5CKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fmz4NIjFed4HXITH18HAJB/tImfIfjjVwMyERESII/6FsGxFplK8YALNbdxxyoRcj
	 GJTw9CH2Ex8dLR7kQPXf3TAB4u6Q0ACFgWAw9jB/yiR9hKyA3kHk59uWq9bcttM9C3
	 E47D6PNNn2qH4RWofDu3dyB8fVaksdIugT+oI/umnE98iE4d2qEmBWxrO9LgDdB3ts
	 RcVgHnneAgHfGfIf/LOKRi6wOVPoN6Jki2RR0gnXVEmGaGz4KSpq0nZjJkPCXd0FvN
	 CNbntdKJ8www1R9LhyYo10u1DlK1jRePp3FkqZgiTtfR2mAoj8x5q2i+aMaf3s9YnO
	 O24+DsTGSsvnw==
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
Subject: [PATCH v3 18/28] x86/xen: Make xen_cpu_bringup_again() a real function
Date: Mon, 21 Sep 2026 15:31:19 -0700
Message-ID: <60daf4f4a293002ab73c631d48a86cfb152d1212.1790028654.git.jpoimboe@kernel.org>
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

