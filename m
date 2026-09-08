Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDCD5A986F;
	Tue,  8 Sep 2026 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899679; cv=none; b=t3y/HtJPq/U+TrrT2NH96yZ+PnlwXUUftCZ5C+oY/pP7lAY22/T6BoRrLogznUVfdC/7XTJwOZEGtvcuLERA0unPQO858rWyNM6oaEFP44DrLATw3gm5BitMUBqXLGkOnS/EzKQ0Fl4m+jN4gr7xy8I3dVyPo8lJtdbj2Az8Cck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899679; c=relaxed/simple;
	bh=/Fh6ECh5PUipY2MuOCfqQU9wpCqGcFXXSLNL3uT0NYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXDG+5jUcjRKKmobMcgGdZLSTHW2FfY3siRlHuTgcNtKRKJFk3Ou0rLxuUEG/O4pD9dotqknGr1Ph9KnQdWqgRfPuanmVoXeHWooU6vjvfG3xV8oNbHa2LJfWTj8L9KEKyLOd9zOVMG5xAthFGFCYWPX3J2l7WCRHWZbMb/59rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh9urBUq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh9urBUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853EA1F00AC4;
	Tue,  8 Sep 2026 20:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899678;
	bh=yxTbQgBZYQugQzsbsUlaD2OTcmFXado/QiZ/FDE5CKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wh9urBUqkmK9U//pFmvBi+mSZvhUTtqntZAiKKhqdoCDap/R4D0BYfwzkgdLdh3Um
	 dMbXL1hVreCMmsv6iHvcDATdQZd8VDIqjgtoUI9gAmszydcakRDKz7n/pQ0e2S+Xw0
	 +t2f3j1vYLUQTacY/65zuNZZazzBqaG7BPIWCb5MhvrqRcB4AVfMyDIou+KrXVI2+M
	 vkzT65KT0zYBwBtsdHyDPyitgl6nB6vY7DR9YDN+y/DRD+qlFTePVKrMky5F3KWA98
	 7RtHxibyizGaBM6ESsttwQIFDLMyGRwkj4g9nNhjp24l4/4aJqC7oXO3SjsShRVnGJ
	 zJW7xHcjzJn9A==
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
Subject: [PATCH v2 18/27] x86/xen: Make xen_cpu_bringup_again() a real function
Date: Tue,  8 Sep 2026 13:33:30 -0700
Message-ID: <56458958b221feef309c1b5edf78cddb07e734ff.1788899473.git.jpoimboe@kernel.org>
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

