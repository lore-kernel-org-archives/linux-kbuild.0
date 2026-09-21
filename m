Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E852188F;
	Mon, 21 Sep 2026 22:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029901; cv=none; b=Q//fsjH2JIpFS3SB15XM9aOzPT4wJ11crIcfiMUxesXka/pfrPCdmjjy15u3No8tSmfAbl3VvcKBcd2StT1EI30QdxciZ3clLzv70qJJhzB0RJ84PQk6MmkEchR0PvQkeYq29kBg8axZHVCijy/93l8t7oxacUJyj49qwrXiE0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029901; c=relaxed/simple;
	bh=a5y1EEkZOPnedpEWtUdzuXTqnsPBymub40I1Wh60MPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWxhDexpyOl20kVYIIpAk8XisFYQdDmjfJJkH+CdWvkCKIuTzJSDwUXiPK5FmarkzcGE3QYvFoS2849kVbHEAxvxpZlYFRF235ObDpV9xB0FIEYnlZjmvkooh0yCeGQsFBP5N2AFUS+dPOLuXgLHHfEgBjTAqFqGWpaIBCNqxuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0jDDg2U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0jDDg2U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3D61F00893;
	Mon, 21 Sep 2026 22:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029900;
	bh=SxeKWlCwxhAr4gBBKtFFL+Dx5orsIMBJtg6I3hC4V0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q0jDDg2U8SF+QcZ5Sg0XVS4Co9Cc8FJLXnZM4D68HrORre6dHwBZiDViFxXIvECC1
	 Peqovkp374Yc2i27zR47wZ7VpM2f0TJ/CAcxUCcDssm3LTIROh2A6Aetk+qI0pEEr+
	 3kBjoO1ziOpRfc/951P8qzE5OehZAn7cgv/OpuTMOw8tnyzxStHS+XmiEsQmNMRPv9
	 4PYkOo2k75uVTExeBYyNRmqRALLQ5Ta5/evR5g37IhrV3sQdjUkyb1UHs7LYdskbZv
	 9TmCadRJHAsgLv4TBxa8ST/sgDrns+kcIzWB1503aNcweLEismFPYx5HVgJXJc/9l1
	 1z1wHd0BcEOAg==
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
Subject: [PATCH v3 07/28] objtool: Make .discard.stack_frame_non_standard non-allocatable
Date: Mon, 21 Sep 2026 15:31:08 -0700
Message-ID: <fa44b9cc993effa3d69d2c12eaaa029800803c30.1790028654.git.jpoimboe@kernel.org>
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

Convert STACK_FRAME_NON_STANDARD() to an asm macro to prevent it section
from being allocatable.

This will help it survive being used in libstub, which renames all
allocatable sections.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 include/linux/objtool.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index af2e68e496e5d..e9c78e026c7a3 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -4,6 +4,7 @@
 
 #include <linux/objtool_types.h>
 #include <linux/annotate.h>
+#include <linux/compiler.h>
 
 #ifdef CONFIG_OBJTOOL
 
@@ -30,9 +31,11 @@
  *
  * For more information, see tools/objtool/Documentation/objtool.txt.
  */
-#define STACK_FRAME_NON_STANDARD(func) \
-	static void __used __section(".discard.func_stack_frame_non_standard") \
-		*__func_stack_frame_non_standard_##func = func
+#define STACK_FRAME_NON_STANDARD(func)					\
+	__ADDRESSABLE(func);						\
+	asm(".pushsection .discard.func_stack_frame_non_standard\n\t"	\
+	    ".long " #func " - .\n\t"					\
+	    ".popsection")
 
 /*
  * STACK_FRAME_NON_STANDARD_FP() is a frame-pointer-specific function ignore
@@ -91,8 +94,8 @@
 .endm
 
 .macro STACK_FRAME_NON_STANDARD func:req
-	.pushsection .discard.func_stack_frame_non_standard, "aw"
-	.quad \func
+	.pushsection .discard.func_stack_frame_non_standard, ""
+	.long \func - .
 	.popsection
 .endm
 
-- 
2.55.0

