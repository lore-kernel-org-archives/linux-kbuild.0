Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B97A3D4138;
	Fri, 28 Aug 2026 04:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892731; cv=none; b=uTnEGZbT3Mor8wDVyeJlyv3rTkOKCcuDw/ppcyyvydV2H1B7B8dOwZhXzFgDf+mjiBpLnvh0d24pzJ1lnLxv2Y0gZQZayKHc2vQtOXV8wOA04JETzE/rFVmOUGM7c2t4PofIOAiANQiY1sMeWosuU6bpzuR3XfCA1azosN2WQHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892731; c=relaxed/simple;
	bh=JJ3QSA7Xyw9zTtk52kmDZvENRNaAW8uwuyQ2Brw8jEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTRTdLSZqm794k49kq4+3vM+tEk1It8wxF3m4YsO97wBk4lEBlg8Frh/0SpIgrGJjXq+8qQNgtBJw9+QTTz+/36YYuP0PNo/aJJ9AafhR7TDbWkOwd91UZiLeTXt1bdVLTJjoxVJzdRarWRBbYgsKgXAfyV3ccMuRN5BbFgeofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVv31qY8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVv31qY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C951F00AC4;
	Fri, 28 Aug 2026 04:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892730;
	bh=E3TFmQytdIgRWxRaZoVO/PuRJdDmyjSLZJjE10JFygM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mVv31qY8DCgFe0ybRcjigI+Ymfi92V1l1GyovUQoE2afg9eJnddx89tlQ5uvvb6yf
	 RBny/rDL7L+0MkCweBIHzwCF9vjNs33utmpCRLYZ/NzdojNVcxWg6MPw5WtEk1PsdC
	 AQAMYs9EzWCvPqSsk0+FPvFBL1mZ1M+yK8AA1aCbLRj94heoNkyrm6v4/Y3PK5LzEe
	 xgH4o/XlPl78f+ABUpDzZaWQ+JoABG2aayxR+ENDNpMt5HR/kZ7Rp5QzyY2u4bFm8u
	 I3+fXwc3k9Sfg5h6ZZhdiacnIW3ZG2Q53cx90q1yfvav83bj2IH3BvWx0MTxFYI2dY
	 dnhr6ynlu3jlA==
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
Subject: [PATCH 19/27] x86/xen: Make xen_start_kernel() noreturn
Date: Thu, 27 Aug 2026 21:51:48 -0700
Message-ID: <90d7c1943218be3c95b005e7b0fd004b9c78dbdc.1787890035.git.jpoimboe@kernel.org>
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

startup_xen() calls xen_start_kernel() with the assumption that it never
returns, otherwise it would fall off the end of SYM_CODE_END(),
triggering undefined behavior.

But startup_xen() actually can return if 'si' is NULL.  That doesn't
seem to be possible, so drop the check and mark xen_start_kernel()
__noreturn.

A NULL 'si' would now fault on the first xen_start_info dereference,
which is at least a more deterministic way to crash.

Now that the function can no longer return, objtool can derive its
noreturn attribute directly and the noreturns.h entry can be removed.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/xen/enlighten_pv.c | 5 +----
 arch/x86/xen/xen-ops.h      | 2 +-
 tools/objtool/noreturns.h   | 1 -
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c64b388f6164..8ec78df9d1d5b 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1325,15 +1325,12 @@ static void __init xen_domu_set_legacy_features(void)
 extern void early_xen_iret_patch(void);
 
 /* First C function to be called on Xen boot */
-asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
+asmlinkage __visible void __init __noreturn xen_start_kernel(struct start_info *si)
 {
 	struct physdev_set_iopl set_iopl;
 	unsigned long initrd_start = 0;
 	int rc;
 
-	if (!si)
-		return;
-
 	clear_bss();
 
 	xen_start_info = si;
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index dc265bdda24d7..20e8fb6244426 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -73,7 +73,7 @@ void xen_force_evtchn_callback(void);
 
 void xen_pv_pre_suspend(void);
 void xen_pv_post_suspend(int suspend_cancelled);
-void xen_start_kernel(struct start_info *si);
+void __noreturn xen_start_kernel(struct start_info *si);
 
 void set_pte_mfn(unsigned long vaddr, unsigned long pfn, pgprot_t flags);
 void xen_init_mmu_ops(void);
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index 01c94f20d1818..c4b93fc6e6299 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -21,4 +21,3 @@ NORETURN(panic)
 NORETURN(vpanic)
 NORETURN(rust_helper_BUG)
 NORETURN(sev_es_terminate)
-NORETURN(xen_start_kernel)
-- 
2.55.0

