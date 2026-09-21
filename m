Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641852268E;
	Mon, 21 Sep 2026 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029903; cv=none; b=d7YJxwYYt7Db3IAtbmCiqQ93TRAQ8/pfx0eZNy0VWtQnV3wZbDBXw9qjbvgzPWX4f9DiVbvZCl00iNEQMm3KoIdOUD7LNOq7ggMXg8ZcXEUo0+VEXf1Jrvjzsgo6/+dbBbWjqJ5qWpFZoA70r0bDUqlqjdG9cR4wJvbBEVVkAm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029903; c=relaxed/simple;
	bh=FBkhZIHsOVOAFGLvGjoaJHbxp5/Ieql+9q6x8eCPjYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzMVgB+HTmloLlwOqh/HNvl4yHi4xCR9HTXcBjvL7KP4hQylGphS6P06UaGRkQ54GchNVCJW3ncUphBRh0Av9rTx1aH8+658PVjY/ov20kQL7WP8w5vEjcb0+p00JP/LPHuU8BaZFoknAwSUSrH/fM0wvEkGGKyVoq2Vm1NzPEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aadI4s4j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aadI4s4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2286E1F0089A;
	Mon, 21 Sep 2026 22:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029901;
	bh=xeZZ3CRnRZyMKMMDVT6aWXfxyAdK+QQqPR0MFpev8r0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aadI4s4jBAfXU/9Q1hIN6wwW/BK6WxW0CDuRNj7NQcPvcZW7nk7cbanOjGN29GRwB
	 DQXIhmOseUw16QbftXY969wagHGaL/aOKZkoh8eA4sGm6fykbjOtHPXlSAAYPDIzVX
	 IUNImwBRVelhXzLMvTi8m+h/4Y3iRkdiYUnMBGZzHAolFM6/BiJP1m3ldkowvCbm5Q
	 uKd+xwOhKxy1z3VHsxoa/9c4gI7Pa/f6UWYzA1NSbVnjcfzn+ZpNXIUScz3Xy6r8yP
	 x07GRXjuaKpAYawekgt2XmcLGKa0q/hYzlLJyRn5jxu/2+7ECniiIUbv6e7N3QU+o3
	 BC5KRH/sH5ZZw==
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
Subject: [PATCH v3 09/28] efi/loongarch: Mark loongarch efi_boot_kernel() non-standard for objtool
Date: Mon, 21 Sep 2026 15:31:10 -0700
Message-ID: <57cd503675283a0bd598d2336ab0dfe1341c495a.1790028654.git.jpoimboe@kernel.org>
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

efi_boot_kernel() ends with a tail call through a __noreturn function
pointer, so the compiler emits nothing after it.  Objtool can't tell that
in indirect call doesn't return, so it sees execution fall off the end
of the function:

  vmlinux.o: warning: objtool: __efistub_efi_boot_kernel() falls through to next function __efistub_efi_get_memory_map()

This is boot code for which objtool/ORC coverage doesn't matter, so tell
objtool to ignore it.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 drivers/firmware/efi/libstub/loongarch.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 2b0c87dc99088..737de9afd6a40 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 
+#include <linux/objtool.h>
 #include <asm/efi.h>
 #include <asm/addrspace.h>
 #include "efistub.h"
@@ -103,3 +104,10 @@ efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
 	real_kernel_entry(true, (unsigned long)cmdline_ptr,
 			  (unsigned long)efi_system_table);
 }
+
+/*
+ * Objtool has no way of knowing the real_kernel_entry() indirect call is
+ * noreturn. Just tell it to ignore this function: it's boot code anyway, so
+ * ORC coverage isn't needed.
+ */
+STACK_FRAME_NON_STANDARD(efi_boot_kernel);
-- 
2.55.0

