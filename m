Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9783F3C768E;
	Fri, 28 Aug 2026 04:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892726; cv=none; b=JFHoj8wVJ99IQfDK5qcdPJerbyc9oNO/RnM+eouwS6KQbK4WXnz0GJbzbEq3unKze3W+MOGaWH8JyylyTtheAwhbuFTxmvhP01HJIhPQ+KA6AGFCu4afTWMpiMyzEj6T/gcu0DiSRdNmEAhk3ogj45O8bj5PHevtoZWYwW9CNh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892726; c=relaxed/simple;
	bh=FBkhZIHsOVOAFGLvGjoaJHbxp5/Ieql+9q6x8eCPjYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AB48jdYLgA08A9/w8RqCYM7brz40xpRwBKjJNhNf8vHAMe2GVc8t2nMip2SBggYYukh1Gsz7ePqsvFeOjAU97HmUr3XuGBxFyWnEn9wQ9oHUQTnQLa0Q+wF2qCTYS2Fi6qD3xghiJPMkbk1CY5FnnbJlx0D5xeKDdJ9v9gpIzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMpKOzy6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMpKOzy6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F791F00AC4;
	Fri, 28 Aug 2026 04:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892724;
	bh=xeZZ3CRnRZyMKMMDVT6aWXfxyAdK+QQqPR0MFpev8r0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cMpKOzy6nCfKKFylzb61PrJ/VfVjuUhfbkp0uFUEZJwTKRIfWGz86nkkvsQ9Nhkaj
	 y09/Wpi3PqGmuvRtaeEQjQDl2CvIOtEP0tWHWr5hO8zPMfRTROEe2SIDyny93UWitO
	 cn0U/iOXtaKtLgTk1F0GwqJOZD9ERtnW9FUuUcheKeLBAk1yDxlmz/PH4VVhMFhwCP
	 dNtl+3qOWieXA2Qp2M8O+LoTgEUPhGsSeG+cwzrL8XArLKEyClg8+MdyNB/fitPQvw
	 n2cA1HLtlyNY2me1ymqB++8BKJL2xxOQcdKV16iX7rRMPSp2CwDVOGVLW7FbTYpPbO
	 yUKRgIYNG37ow==
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
Subject: [PATCH 09/27] efi/loongarch: Mark loongarch efi_boot_kernel() non-standard for objtool
Date: Thu, 27 Aug 2026 21:51:38 -0700
Message-ID: <b7da3bfec527a7de6399b60c500a1fa1aea2175a.1787890035.git.jpoimboe@kernel.org>
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

