Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F59C374185;
	Wed, 29 Apr 2026 03:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431645; cv=none; b=IxzwXzrkTYVu3BgV8riGpss8NISLzlujH127vkuiSXtq9Ce0S2TDhzIaqDzvyHTUC/COVsXoD/AIvVjVORAqBI0kZLlTEcD7VYDJRPDZr9IJpxujZq+s1BucT7ev1SjZOdRzcJICi+mQN95RLDiziaakFCEa498XDJihuk58aXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431645; c=relaxed/simple;
	bh=Aq5GmgfDmff3OP518UkeGEZ+rAWTGDqxT2c9ksNlieU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GbJEi0fTtT7ufM/iZx7AMrigdq5onNwMZuPIwFAQwqhDy+PuoZORKPvGA1ZoAHBtJEAoBTjZLK1GmAnMQkRZUDtDko+jwcOjAuaPRmU1PJ/ACLCpxyX00yLg4gExRkqmNwkemy7+6ZSMNrNC1yDu8TdJ2ea6LqArk5WTESinNmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3/COKAc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3/COKAc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2856C2BCB9;
	Wed, 29 Apr 2026 03:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431644;
	bh=Aq5GmgfDmff3OP518UkeGEZ+rAWTGDqxT2c9ksNlieU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R3/COKAc6JdE7HukEJtQUtdo0Q8ytnJ+9ii48RIe88S2IXS9R3MrWjNh5FahLAEtH
	 iUj3smY6tndVw5l8eqAJxF5IjxB2XtaNaCDTNmrFRxQ+EN25CWiIyogCr0S8qj6QxL
	 yJ/c4EmNkCtaze0OM/D/lelyL5zXk5OQWkQ2pSRIFi2jTbGBrinsgGSTKdpGN6g/c3
	 fIMCTp2h4nQBeIH+FePhn0gxTFoiYKNR2A3RTZZ1LMq1jeDzoq/6Y7v2klC2o1DOp1
	 l0O5JkpbMXJpLuwINvUCoCOzbUTuXuBOwmxDWwkRGQEm+pjLXeoz88AMkeIyLLK1dG
	 d0bfKOu5q/GHA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:19 -0400
Subject: [PATCH 13/14] x86/entry/vdso32: Remove conditional omission of
 '.cfi_offset eflags'
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-13-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Aq5GmgfDmff3OP518UkeGEZ+rAWTGDqxT2c9ksNlieU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4yDZ6094c/MXubGvlgm+XinsSjnwT3VM6bdnfn8w
 q0z0RwSHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiH9UZ/gdcniHwOpV74brT
 i92yNsmILvRYE+4q+qv4vJVQlmBstBcjw459Cg5HNSKLs1nf6P4su9X45rFESqSekxTXzx+SUSr
 eHAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the inclusion condition added by

  3e30278e0c71 ("x86/entry/vdso32: Omit '.cfi_offset eflags' for LLVM < 16")

will always be true. Revert the change to clean up the source code.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org
Cc: H. Peter Anvin <hpa@zytor.com>
---
 arch/x86/entry/vdso/vdso32/sigreturn.S | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32/sigreturn.S b/arch/x86/entry/vdso/vdso32/sigreturn.S
index b33fcc501ba3..328bd3a4ef51 100644
--- a/arch/x86/entry/vdso/vdso32/sigreturn.S
+++ b/arch/x86/entry/vdso/vdso32/sigreturn.S
@@ -22,17 +22,7 @@
 	CFI_OFFSET	cs,     IA32_SIGCONTEXT_cs
 	CFI_OFFSET	ss,     IA32_SIGCONTEXT_ss
 	CFI_OFFSET	ds,     IA32_SIGCONTEXT_ds
-/*
- * .cfi_offset eflags requires LLVM 16 or newer:
- *
- *   https://github.com/llvm/llvm-project/commit/67bd3c58c0c7389e39c5a2f4d3b1a30459ccf5b7
- *
- * Check for 16.0.1 to ensure the support is present, as 16.0.0 may be a
- * prerelease version.
- */
-#if defined(CONFIG_AS_IS_GNU) || (defined(CONFIG_AS_IS_LLVM) && CONFIG_AS_VERSION >= 160001)
 	CFI_OFFSET	eflags, IA32_SIGCONTEXT_flags
-#endif
 .endm
 
 /*

-- 
2.54.0

