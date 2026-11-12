Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444753;
	b=O3xfrTn7KyISwxUr5EdAVs5UvMq8E4MggmXoXScsqBPiCrMs5qIzGLDcdX4IughVDCS5
	 BLh7mIQbNGO/NeJQt5767W8UtXW2Ad3NOLr3U4/ATqilxG8LOIdiXOyt0MQkWOEoCdfjJ
	 +aRdMSnPb+2piHk69IZXylXDKvCTcIb9Pk8RkztAVDCLCl0+WDa5P4Eai3ZBNV7Rj3RmT
	 w8APeGR8Vu6ULlTD+gsHutXxJJj5GPHdVYgBUzplbDsKbjZB3rEOFyvhKdimyvB5VMaES
	 QLYKosKnCHwQGCukJ6ePSmLrMV7CdtIW7uiDquMXCYb3oyUHI8hyj74CRBsBwhpus4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444753;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DAECrafKSpt/7XFimlBzzmF1bv+Nbr5QSGfylmB/A7A=;
	b=UALVgWqx89ME4qiU4ug8jtmE4u5aamdV9eQrzWhuAsyN1wyuF6Ogce+3BGlMkTS6G+v3
	 ALNFgEY5ePesgPh4GYSHMcz980Rc2zabtTG0xrkOZ7n1c//yrcRwc97+gVGCxxxUeims9
	 1gmxrrYKEM6wpT8L7Nm2tRYCMyf2Mh4htjRrNiEVJbOTh3ks0s3ii2XnXt2u80TM+J6GZ
	 US5MC7i79Q2fVzKKNCIsSAjh/U3JYCFbcy0R7X0leJ/yXg957SK2q/ro/a2V38jMEX5YU
	 yKe6cYgrIpT4tezBp+Jm9qjQoVuhWDw5l5nTZPLm2wTztZ7E+bir1kCLZZQgmdQAfYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj62HCJ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75328606A899;
	Thu, 12 Nov 2026 00:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj62HCJ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CA71F00A0C;
	Thu, 12 Nov 2026 00:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444753;
	bh=DAECrafKSpt/7XFimlBzzmF1bv+Nbr5QSGfylmB/A7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Oj62HCJ8MNvWMgP41/0dKJ+5vZvPTeLpuOtKP6rinCdhZKwIgbqeI0lqZS+osI0HZ
	 Y+Pag783baPTNnXA+kXE8OV92FSo2SLDj2LFMtDe0sWtsR8tgAb1x34m5eOsRmqFZf
	 ikDvzXgQiBAVxayAAL0RSvJ3mdC9SaQn4pDGMV0AK7jueQBciEFia3msZiFDSgJgyz
	 4A5uhczUQ5xM3fXpUtuPt13xUJ7TDQXSKB/Xn8lIuAEeHgreKrQxx1iMh5FwhPurl5
	 +ZGCasXMeihfc8F850F9r9KGdegRu3BLVhnkyz+QiEBL7Qm0FFYKDxhTiwumuyE8Vd
	 mtJywVAbN6GDA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Nov 2026 17:52:06 -0700
Subject: [PATCH v2 4/6] riscv: checksum: Fix CC_HAS_ASM_GOTO_TIED_OUTPUT
 check
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
Message-Id: <20261111-kconfig-toolchain-updates-v2-4-b2d9415c1757@kernel.org>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=nathan@kernel.org;
 h=from:subject:message-id; bh=NbI1YZqYLAsD/6ruXbkjBAtuB6jqDayciE1k4lyC0ec=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfeff/XDRdcEEYb+n529aHG2fdjV7fzLZV7qavf6W2x
 B7nvpNFHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi/qcZ/kpLhSlwKFhJ/iur
 q3tvLdRit0aS8dEKiflqRt51NrbVugz/4zT5D9j8cq9LrLry7GtTRu2R+pmCHhvuH4ngSwm188j
 iBAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

The defined symbol is CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT, not
CC_HAS_ASM_GOTO_TIED_OUTPUT.

Fixes: 4525462dd0db ("riscv: lib: Check if output in asm goto supported")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/lib/csum.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 5d4379768e5d..c2b8986a0d39 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -142,7 +142,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
-#ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
+#ifdef CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
@@ -186,7 +186,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 		return csum >> 16;
 	}
 
-#endif /* CC_HAS_ASM_GOTO_TIED_OUTPUT */
+#endif /* CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT */
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
 	csum >>= 32;

-- 
2.56.0

