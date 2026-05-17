Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5CF221540;
	Sun, 17 May 2026 23:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059144; cv=none; b=kA2a0J5c4NdlwF3AkxaZUqvJv8erQSWz9679fkkO+JLdr8bUqxZk5knSvVh0wz2XezRjIDcDr3a6hwyc3J321jmVPutPxlLPqK96tKROL4fFTE3Xm+V+H1zkk+XVwXqrceyfR5W+mNLM1LajWYEnWN0N9t3KH4u/mZkbzgihoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059144; c=relaxed/simple;
	bh=8gUcJ6jc14raMb2k8QcHLAcHl1/4TrTWMAhTkoid1Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5vtlFt84QZGOdp5wzRWzVHiX6hISUP6IsKu2ufXhABRR3BJUaPgWqRlKsXcD14kngYeDN0OYAflqaogBPm7Ruty+AZ5Wd5l2biXT6anP9RoqGFJ1nc4BUjoxXc74XTMPshvPb1mtrrRF14+fP3ywRVlNil/HdodEdMiYcAONgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xcuwhxy8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xcuwhxy8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB08DC2BCF5;
	Sun, 17 May 2026 23:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059142;
	bh=8gUcJ6jc14raMb2k8QcHLAcHl1/4TrTWMAhTkoid1Lo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xcuwhxy8XSWyGm7/cs0UUm5fhRXoxz8D4H4zZe47NyvQu/d92ebQoJWX65dzpedYQ
	 74P6HMGek5lhNbznj5t5J7KEoDDGTKdHO7GpZO3hs5TzJ7T1nKrlQrrIvkeKvSgdZV
	 4PjWvVQywUJvNqrtrpE+dVFTZBZc8kqnwtz518MyKnecgdPuCwjm881vXljhIdD3gq
	 I1uJR7JUjfKR07xWL3ZYGYp2v6diuiBm9PCIAy9vBMGJ0WdrRzAIVRCQvKHMaIA7gg
	 urvdwgDTEI0YDBFJgOeWyKCihTU6FyKekxDJA9pvfnADnSd0dbVR9aRd4Wd4/YjQ1G
	 ybtsfGbCtsAKw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:08 -1000
Subject: [PATCH v2 05/16] arch/Kconfig: Remove tautological conditions from
 HAS_LTO_CLANG
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-5-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=nathan@kernel.org;
 h=from:subject:message-id; bh=8gUcJ6jc14raMb2k8QcHLAcHl1/4TrTWMAhTkoid1Lo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhuXfq2e4a08wabkbdGKNqPfJ0Rb687e9vvwIaVZg
 1WgqYKzo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkVxIjw8n+wzEPrThcgzc5
 HeSd9u5mrOKqdfdeHNQ+8SMqO+TpRlZGhj13nxzw5Pr/+Fh28inPaeGr65es37czjv2wUPxDBua
 tNXwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, two dependency lines in CONFIG_HAS_LTO_CLANG
are always true because Clang will always be newer than 17.0.0, so they
can be removed.

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e86880045158..0d34bcafecaa 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -806,9 +806,6 @@ config HAS_LTO_CLANG
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
 	depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
-	# https://github.com/ClangBuiltLinux/linux/issues/1721
-	depends on (!KASAN || KASAN_HW_TAGS || CLANG_VERSION >= 170000) || !DEBUG_INFO
-	depends on (!KCOV || CLANG_VERSION >= 170000) || !DEBUG_INFO
 	depends on !GCOV_KERNEL
 	help
 	  The compiler and Kconfig options support building with Clang's

-- 
2.54.0

