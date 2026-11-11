Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794375783;
	b=Ynjs58mWMJw07fFTOFyHXwrmdy2Sv3Qq6LC4tqkIwOevjxNRJW2bd/aDVc54uYCdj9vh
	 8FIRqemfsuF8rpO/51tlQz0iXmwD4g/b2ueH0teMU/Vds7Fkbd2qDA4b4QUO4kR+BAB13
	 pJaCa+1NJckRIqVZpD+xUpxi6PKOkHuA9pCj/ropdPfD6ybEoiJlhfE2teTjlqejkSWIV
	 1/f6bNsjJ4H0oAAFr/Mf6kC2g2eQ2xLcfVvDjh5EO3gMJRTU5pnuhEJxbtGfeUOChGQBe
	 x0HBye9QsHVEL2Ba0KMzUlYjy3bMhYKKyq9DkApfDzsmlrWdFAcVBUs242k+iiGtJNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375783;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xnohpFLifCquxfQpR0Jk1g1f32o2lIACOKHu+T5Xklw=;
	b=YQUZUhrSbgeVIQLLP3GrdfKxUGrxqKo01VLsZuYtuAq1jF33K6BLWnZs0rUh1Sxzr7vW
	 zev3Q6XupDdrbdW2s7TAV3aLuI3TPKtjfdEibn0wsTap41NnAbmswbZWH2Bdes2Z28kI2
	 Zo00hIjfogaiIjqa86Bgpyl28M0Hsts1m/A26bV1XijplKapG7ad4dDnL2nvjfZQs1GcY
	 Z3AzC8qtOJi2sExy+lMl9YHqtsDXXEjRMiQ/wefL/DmiwZpnm5gPhocPMq+BvrJUmWciA
	 Ed4VULk5HhvWM1kn93S2SjxRbbiP39N9azjawQlJRCqamboMbkTVuc6txAACb+VdcXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9poKxc2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C680606A33C;
	Wed, 11 Nov 2026 05:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9poKxc2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F4E1F00A0B;
	Wed, 11 Nov 2026 05:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794375783;
	bh=xnohpFLifCquxfQpR0Jk1g1f32o2lIACOKHu+T5Xklw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G9poKxc205NwkDcvAS/AaxprMtlQoilx1qmEoh86eioo91TU4VLtr/sm7DefU/qVC
	 2pYJJtYRvbzwQcD3/4H3mnWQiTzyx2uirJREWOZ2d7ZfEmvVWLLHq0PZz8S+2vMhaN
	 mJH51gF6IXz5RnUUMxjvQIPo9wC6yPSnfbaAWRcV8P4PfsZXEAh2zegDyh1ZzYOYER
	 hbU8ebtysTtbdi/4HLo/Fp/GfaoqpYtsqxII/lVBsPVRshIF6vsjxwmog8OSiEhmQp
	 VpOlffM79RoSWG5WdiuvV1QsxrRZXeWtEjtsKFtleJsdv/Fpll1wnnHp1EcXCVeqaf
	 8W8WX7KbxbtcA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 10 Nov 2026 23:42:42 -0600
Subject: [PATCH 3/4] scripts/Kconfig.toolchain: Clean up
 '-fno-allow-store-data-races' handling
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-kconfig-toolchain-updates-v1-3-6d4fb636290e@kernel.org>
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2336; i=nathan@kernel.org;
 h=from:subject:message-id; bh=My1MbpGCsphCbN1a2yuFgz6wG85UeXrHW54FrJtdU9k=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfGCJm/L7FsVRrMze3ts266mRVgdJtV2IzXJKPVlx5L
 hAbtEq+o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkywdGht0tYvJzN077pBOf
 GTJH9HkJ58PguQvt4iPKJhyxlX/6NZ/hn1Vlu5lmyw+ejbP+Od3qXVbJtn63+bk9oc+UD0SvNrK
 PZQMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit 454e00cf8ee5 ("kbuild: avoid re-running compiler and linker
probes") added two separate symbols for the "no allow store data races"
GCC flags. These flags serve the same purpose, so combine them using the
second argument of cc-option-str to handle the old value. To avoid
setting the second value of cc-option-str for clang, add a GCC
dependency to the symbol. This will eventually allow the cc-option-str
call to be eliminated when GCC 10 is the minimum version for the kernel.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile                  | 5 -----
 scripts/Kconfig.toolchain | 7 ++-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index d73f2bbd3b93..fb2490faa8d1 100644
--- a/Makefile
+++ b/Makefile
@@ -949,12 +949,7 @@ KBUILD_RUSTFLAGS += -Cdebug-assertions=$(if $(CONFIG_RUST_DEBUG_ASSERTIONS),y,n)
 KBUILD_RUSTFLAGS += -Coverflow-checks=$(if $(CONFIG_RUST_OVERFLOW_CHECKS),y,n)
 
 # Tell gcc to never replace conditional load with a non-conditional one
-ifdef CONFIG_CC_IS_GCC
-# gcc-10 renamed --param=allow-store-data-races=0 to
-# -fno-allow-store-data-races.
-KBUILD_CFLAGS	+= $(CONFIG_CC_OPT_ALLOW_STORE_DATA_RACES_PARAM)
 KBUILD_CFLAGS	+= $(CONFIG_CC_OPT_NO_ALLOW_STORE_DATA_RACES)
-endif
 
 ifdef CONFIG_READABLE_ASM
 # Disable optimizations that make assembler listings hard to read.
diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 570c5a31016c..26a62b15e9ab 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -176,12 +176,9 @@ config CC_OPT_DIAGNOSTICS_SHOW_INLINING_CHAIN
 config CC_OPT_STRICT_FLEX_ARRAYS
 	def_string "$(cc-option-str,-fstrict-flex-arrays=3)"
 
-# gcc-10 renamed --param=allow-store-data-races=0 to -fno-allow-store-data-races
-config CC_OPT_ALLOW_STORE_DATA_RACES_PARAM
-	def_string "$(cc-option-str,--param=allow-store-data-races=0)"
-
 config CC_OPT_NO_ALLOW_STORE_DATA_RACES
-	def_string "$(cc-option-str,-fno-allow-store-data-races)"
+	# gcc-10 renamed --param=allow-store-data-races=0 to -fno-allow-store-data-races. not needed for clang
+	def_string "$(cc-option-str,-fno-allow-store-data-races,--param=allow-store-data-races=0)" if CC_IS_GCC
 
 config CC_HAS_MNOP_MCOUNT
 	def_bool $(cc-option,-mnop-mcount)

-- 
2.56.0

