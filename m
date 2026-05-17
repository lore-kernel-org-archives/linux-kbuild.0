Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC763D75CE;
	Sun, 17 May 2026 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059167; cv=none; b=Zk2oaA+EFAWhb8xoHm9zMYMOzFRoi3odBlmTGjx/FKi2avgHw4mDJfhUPoCXAK/qKmo/a7ATyyxM3nxNS38+/4G2PJ4Z1u3c7ATfwwoqBA/QKtY3tJJ+okLNgkKHdfuiCTyk956RsnRk6vixynL0dpb1Sl15mkxzQ5/GCVExVVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059167; c=relaxed/simple;
	bh=tEPEsU1+X7p+io0HSiFQT1P4YOo34mXIWX4b6NPdcCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hoxwnHNnJ7Anzy0hbPksHBYuLXT9CAu0puEugNKsYHLTazs9V2kooYmfNd6oG4tuSH8sUFsoLvNGnbIz8BNjix9rIEbq2H+o4hWSlRhcUFAiSk90QYTGGiIQU7MfjardTWkzOxvobaPR1W13CpzNtlC+GZ9L9gugliIMqMjlSPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPzQ2ik3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPzQ2ik3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C885C2BCF6;
	Sun, 17 May 2026 23:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059167;
	bh=tEPEsU1+X7p+io0HSiFQT1P4YOo34mXIWX4b6NPdcCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QPzQ2ik3EMRlvQUzGwoujEPSyJbuFVf8oZv0mZKJnvrFbaXT02Ibnb32y4Vu+Tp6N
	 rk1Qb4CKCki6M5j67JDkkG22lnm9/zrhDtQXs8au4C/0zr5+RwypreKFa+yC9fd0/Y
	 4ltTIpvzq2wb1HWHc1pN0ApDht80VfAggYIAbKOV+f4lCOw1y0MurCxTE9+1hFFh47
	 Rf2tx6bt0MD82xvBooxnsBtLiwhz1TrJ2Rhmf1SdQflEwToc7UJDy/qNR2B0KH9zAS
	 IT0oCpCuFzhkRMPuHapNYUQ4y6MPJTa9wxwH1hxtbHF+lj9JZQwFeR7wmtu1mDJiT+
	 AEZNhd1iOxb4w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:17 -1000
Subject: [PATCH v2 14/16] kbuild: Remove check for broken scoping with
 clang < 17 in CC_HAS_ASM_GOTO_OUTPUT
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-14-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=nathan@kernel.org;
 h=from:subject:message-id; bh=tEPEsU1+X7p+io0HSiFQT1P4YOo34mXIWX4b6NPdcCs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnpujkpweWu8TMSr+/aLPvHaFjP6Lxz3/NY5Yxn3S+
 jz96NVjHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAihx4xMnRMSu7fKSMrJzDl
 za1H7ZZLzvBI7qw6wyvdViLG+m3NBGZGhp1qh6dqFDjd4GGujY5xWv7gdZXF97P/ttQdviI55+I
 UH2YA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the check added to CC_HAS_ASM_GOTO_OUTPUT by
commit e2ffa15b9baa ("kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang <
17") can be removed, as the issue it detects is guaranteed to be fixed.

Acked-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 init/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 2937c4d308ae..6da6cf019d1a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -118,10 +118,7 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
 config CC_HAS_ASM_GOTO_OUTPUT
 	def_bool y
 	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
-	# Detect basic support
 	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
-	# Detect clang (< v17) scoped label issues
-	depends on $(success,echo 'void b(void **);void* c(void);int f(void){{asm goto(""::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b)))=c();{asm goto(""::::l1);return 2;l1:return 3;}}' | $(CC) -x c - -c -o /dev/null)
 
 config CC_HAS_ASM_GOTO_TIED_OUTPUT
 	depends on CC_HAS_ASM_GOTO_OUTPUT

-- 
2.54.0

