Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444750;
	b=gI150/o4UuSv+C8ClyfBN+KG8azzSJi3LG0JcgAZoI7dTt+osR3MU6VDXh4hLTv+rRbj
	 g9JdVcsCPyV+Ya9GNb4rbSS/p5wiHQO5NQXD08Pfgzwv1/4EWKekZJmB+5EriFBQZHMQk
	 zRztsMVKHXaVtBR7HuX5zAGRksuqYuLZDtejE6o1Vh4oB13JjpP9c4x6MHdXCvp/AykF6
	 zQNCqsQl+0LsWtWSNMalQtb/sW6PpA0xxLqvxd/oYHId70QBh3PDWkLBXnaeuH20GRS7M
	 hCS++ybUN+qZb9jeMPWY2lzV3M2XdjtS6SKgyYZYI0DkPw21S0MBgMRlnD/Swt2Lj9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444750;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ly+BsufNIv370j8p07TD2PGfCvrVzQv4fO91mb3IBJs=;
	b=Vxt80aqlPM/+VYq+5vQ5N+C3SAJcC0MtB5ZPjSIXBeaTea9h29CJn7el0aA7EnaL2qov
	 d+J/bD9c3DrKhcC+X1p2qIhygTqeruZqtm88XSSmtLJNTyulIOLaN6XB1xr902BD1DtLv
	 sFPr3jTcIcNTKQ2D5UB7UXoXDv++4jxZehtO3t9cDj85qDly9K+PhmZ0evJ4re3TKWybC
	 IaZq/GITX3A8F6jB3ebriNesJkWHCTzAGTW0ebqmsb79a/CEiazMw/hKhqNhFsRFz1XWq
	 eeorlRuSi8q8eG6Cexp4whU7g3PLf65A/DTsSrbqbP+UGnC1qvIVbU+zSKwWeQAhYcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUuEq9ls;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE70606A899;
	Thu, 12 Nov 2026 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUuEq9ls
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16521F00A0B;
	Thu, 12 Nov 2026 00:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444749;
	bh=Ly+BsufNIv370j8p07TD2PGfCvrVzQv4fO91mb3IBJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mUuEq9lsXu/aIFD4ZyRZXGkXJxe6URJ1JYFq337myEF5yX4rENa/6y918QHRZ/c/k
	 7rt4vH6WuM1Gh3SUWboyudomE1dQ0V2tjGq5GUgmvf216/eXasqfPDhV4I+k/Khlb5
	 MrxpwtYAl1ln2urcs6zKa4cA9pxpGvSkNQEpTsgHXSZdXzQy2nxjArDogEbfr2D4td
	 hDF28n8eH9V2hcoGkTE9Ih+BtDJw2v/55mWpnt57+DOAa1jYSncT42jIqomaRkkmUf
	 fNTCvfWC0rDXVyVhJYyYLlbYmjyWr/kpgba33Z3i6UmaNUEN1wj/R2lsSPkGpFyNoR
	 /rQoxpYxv2m4A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Nov 2026 17:52:05 -0700
Subject: [PATCH v2 3/6] scripts/Kconfig.toolchain: Clean up
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
Message-Id: <20261111-kconfig-toolchain-updates-v2-3-b2d9415c1757@kernel.org>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2314; i=nathan@kernel.org;
 h=from:subject:message-id; bh=FUuYGzRoAi4s97S6XgIIx8GQogeTcteEpGl81/L/NxA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfefedP1pppGN78luRzUPnNpWdaZocXmX+QXpnWhZ/v
 Kx6a97UjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRUm1Ghi3S9exvL7RdtD/S
 /uOdbded2rnuj7n0anqPe54xrdbLiGRkuM9yrs7qyO85yYZHmr9EzN0wK2PX+hMmR3zVS/ewe0z
 KZgMA
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
index 570c5a31016c..6520a06a9103 100644
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
+	# gcc-10 renamed --param=allow-store-data-races=0 to -fno-allow-store-data-races
+	def_string "$(cc-option-str,-fno-allow-store-data-races,--param=allow-store-data-races=0)" if CC_IS_GCC
 
 config CC_HAS_MNOP_MCOUNT
 	def_bool $(cc-option,-mnop-mcount)

-- 
2.56.0

