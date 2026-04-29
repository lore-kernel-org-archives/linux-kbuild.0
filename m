Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2935C185;
	Wed, 29 Apr 2026 03:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431635; cv=none; b=dbYr7McWTgyszd3fMtI9nEanhKn9qUnjTiFhyD5VZ/gjueF1UoIv900sbF9D9XsTyjBBgXgeSoOs3hRX3X23C09Mlgg0TuZuLR62BodXzczYpskbE++5g3YlXW2OIpZ4tUfrWAYYPjkGmHpYSv/ydXsH5wYnI34pn+zuJpsHM1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431635; c=relaxed/simple;
	bh=c9+QXpL1/MOlQ50MSgrezJUyfRhaKifKsnEpuNq+/fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lViqcFAaRbr02MTlArc4IFRdE0MwmrIeaHMiyrIhdck/pFrJlNMVfDdCibcbg/5zwBE9TIutJbcWrOEy7WwK83bK15pLvhYal11mxfMkbNuj5sCg8iaCzGGRPfwOLjiW2IJeFTo/lpfA1zV9jiUC7H+YmOqhu1lq41r+l2d5hlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdLOtsPX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdLOtsPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B881C2BCB7;
	Wed, 29 Apr 2026 03:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431635;
	bh=c9+QXpL1/MOlQ50MSgrezJUyfRhaKifKsnEpuNq+/fo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FdLOtsPXzwZyht00abRsUPqroa32rOWhd3YU/hL19N5hK30x5Kdz+VMtgcG3cD9Ln
	 Dh9qEkKGEmeDBzy8l0r09/iuzmexkVNn6EXJiyy4gi2fs1BBE3YImcksXz8vaGZ47l
	 SsK5inPYWw0qQuLzBsVJEFonB8+rSlV0dDPay8qC8ddhMfzElFBJI2hK0VfCQfbEsE
	 2jOCnWeAVvR71Jfe701lNlkEb58BMFX5FC4GKPsSy9+2Q9/VReXRRcTETKUvUTuVKJ
	 SGS7bAdJa3Dz0LSyAZm3HNyXvIVVuQmMkgPHfX6rL7JRMFwsEvhksBTI7Er+B1H9+C
	 oDBe4Ik/H+Alg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:16 -0400
Subject: [PATCH 10/14] scripts/Makefile.warn: Drop -Wformat handling for
 clang < 16
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-10-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=nathan@kernel.org;
 h=from:subject:message-id; bh=c9+QXpL1/MOlQ50MSgrezJUyfRhaKifKsnEpuNq+/fo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4yeP7wq8LZvlv5BuZOB3QJ94uY7fNPWRvVyeG/+Z
 DSN5/ncjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARIy5GhmUMSXw8y76Hp3LH
 XCi5nZ26fu7tZ8VCU5edrdq4UviSdC/DP6PqwA9i3QI/VASDrr0/H1K2QLA+VeJx7xnp6xW/tGz
 FWQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the block dealing with -Wformat with clang
prior to 16 can be removed since the condition for its inclusion is
always false.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.warn | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
index e77ca875aea4..35af7d6c6d18 100644
--- a/scripts/Makefile.warn
+++ b/scripts/Makefile.warn
@@ -135,16 +135,6 @@ KBUILD_CFLAGS += $(call cc-option, -Wno-stringop-truncation)
 KBUILD_CFLAGS += -Wno-override-init # alias for -Wno-initializer-overrides in clang
 
 ifdef CONFIG_CC_IS_CLANG
-# Clang before clang-16 would warn on default argument promotions.
-ifneq ($(call clang-min-version, 160000),y)
-# Disable -Wformat
-KBUILD_CFLAGS += -Wno-format
-# Then re-enable flags that were part of the -Wformat group that aren't
-# problematic.
-KBUILD_CFLAGS += -Wformat-extra-args -Wformat-invalid-specifier
-KBUILD_CFLAGS += -Wformat-zero-length -Wnonnull
-KBUILD_CFLAGS += -Wformat-insufficient-args
-endif
 KBUILD_CFLAGS += -Wno-pointer-to-enum-cast
 KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 KBUILD_CFLAGS += -Wno-unaligned-access

-- 
2.54.0

