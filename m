Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23733AD51C;
	Tue,  8 Sep 2026 20:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899674; cv=none; b=nwk+wOTDsXRwKPjrvSAM22mSfbBNHT5JP5zvIDWWIhVUPyeHRdq82u0YdAEykKdqRujf7osV5zSEIviEjyLhvDGEG+F50gRM+loupxb+uhNo7IRrCw+poHpArpBL0x/UZsjsQG+JFwry7ZZDO657DZospHbCM2OrPC+vqWsUueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899674; c=relaxed/simple;
	bh=FBkhZIHsOVOAFGLvGjoaJHbxp5/Ieql+9q6x8eCPjYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zgkfo5SGmBC8NLKotQTlrsyhlPjuKa/awvHIzdnmOuOP5DK1fnTJMVHP+t095n3+0U6wx5ITdsZCAmvjIUzp4ZBlcaKoAbe+0e4j+TwzeF7/U94+7s0z2/Na9r6nmVhto6oyEe5ah4ZjzIQ4GeG/1+VyWboAy8yTUpRv49Q8TR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJAmf9xq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJAmf9xq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B04C1F00A3E;
	Tue,  8 Sep 2026 20:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899672;
	bh=xeZZ3CRnRZyMKMMDVT6aWXfxyAdK+QQqPR0MFpev8r0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OJAmf9xqAb4WZtd3cY1npLEnaTmqyOu7XhswZT5YV8eayxzd2xYHfj7WSBd/GEaUP
	 YUo9m/UhWdLLcSBuEhkjIGQQeqneWsY8sYVlgYjeZR3j7JFP7bma+MiBuYamSvyHiz
	 r9mFmSkgWf+b1atMJww7AVOOAoIs9RIr4CMGhZkk4Olk3aMXZFbbIG8eEqv4U94rLu
	 zJ5Kjq/wB54f6et+8jT5vn1w1KKnBCaAIgRS5O9K5kKOxSX0NeRfplZVdJ4ralvX4Z
	 E5mzaVWPttIArFCRmwHl8ctdyL1EyXowcRSHebPdi5Tp66hzjA55gK2u02Dmfh56zA
	 Jb/vZW/O+4O4w==
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
Subject: [PATCH v2 09/27] efi/loongarch: Mark loongarch efi_boot_kernel() non-standard for objtool
Date: Tue,  8 Sep 2026 13:33:21 -0700
Message-ID: <29c1a22167eb7537d92e71da8788dd4e121f2366.1788899473.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788899473.git.jpoimboe@kernel.org>
References: <cover.1788899473.git.jpoimboe@kernel.org>
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

