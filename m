Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C57252B1F0;
	Mon, 21 Sep 2026 22:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029908; cv=none; b=KYZG6sYkS1MTKmkCzHRgWhODiyote4mo+PxfBqNA/VKqy7JiqJuHEZbqeyIkS97CyKVsJbGOqA0G0TlPAj61tYcUYJ8lE8mdLncChktUj7UY+Htn+bPBtkdSfqjApVBKsq/OjCVGCeBcUTDiiQS0RGlBty4jKjtwCDYQ4Xwkra8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029908; c=relaxed/simple;
	bh=/7jIcjgOxFNGI7ubXzY3AcMW0+R1rsx2kBOe6fYE6Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMCzMGJRjtfr0qHbMt2Py70DJ632aX1wLTJYsBDqOi3s65evfoonsKHGzrjQffTPQy7dtIrP+s9E4Fxfjy+Vkcao8YqQfE2ggCQTIXLfYwkzC/hkftXP56YjQ2EO18kjbK+d3HpBdlsJ0WokpryH2KzngfC9EedINb8R58R0agc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgeRip2k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgeRip2k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB16D1F0089A;
	Mon, 21 Sep 2026 22:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029907;
	bh=LpssU78NKD8pmI7WdfWJNnR20LDRSOoXQsuYdchzvVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cgeRip2kUSDRfSIaxll/uG8A+yjr3qQdvUxUNBj5ViMS2VVrS5HrY4JkDvT2zO2DQ
	 SJO/POxRn1fIXmlRjVlQqDoI/ssgQwBU9+yxdMU+6mSm/K4dw1sQNkCgf6jpZl11Yo
	 P0I3ORYoFHPq3BP9+8yywcBYMgzOfDx5DCbuMyze3QAEmvMo6iQtKgpdio/azEh4ao
	 zB8bw9GKi3IJ3IMdcZHq+w/gUg8Wdoyl5lHtn6rWZ1WX1jTj1TXNi7va/N4ase0EQf
	 NZ7BXyJJEb2UKjfpnRlMazNicC43w4c5hZxnBmthWEevupJYeTI6PkBEDTJhMoN47D
	 H3DktxyK2Ha+Q==
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
Subject: [PATCH v3 19/28] x86/xen: Make xen_start_kernel() noreturn
Date: Mon, 21 Sep 2026 15:31:20 -0700
Message-ID: <880ea4268a03af398766861860797f157b6e05cd.1790028654.git.jpoimboe@kernel.org>
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
index 47eebbb3684ab..d830807cfffca 100644
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

