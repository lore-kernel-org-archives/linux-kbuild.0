Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E2A3C3C17;
	Fri, 28 Aug 2026 04:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892724; cv=none; b=l4QBxbhQikVL1j9SGIY6eali2tRZx5usNyYoKgwGLCDrJ4ra+2aFZ9jDyVveh8nvlOHvc7OSZvnPf3zWDkvQEOQbzLr6iQIBFbk/7BCqSkgWAaSdw3nvrbYhpSnmMrePFCBW2GYLagdWFULIiDCOHsvF1/fzqxwvVVobRSbddxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892724; c=relaxed/simple;
	bh=a5y1EEkZOPnedpEWtUdzuXTqnsPBymub40I1Wh60MPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqHXv+JVyJfPaUCa6/7t3d4U6Pns0FQg0vH3UzC3zdFSWDIO+vErQNKHX5XtreK+XO1ewUB+JK7003ZCdrJKHBMxOdQsS/0NBmYxemT+0bz948ovOH4XBKNVdiTpCTi+6ha6jsw8C6fJNlIJGE7HssihdBin/rV5B2y9Qdt3f5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDc7II2i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDc7II2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC691F00A3D;
	Fri, 28 Aug 2026 04:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892723;
	bh=SxeKWlCwxhAr4gBBKtFFL+Dx5orsIMBJtg6I3hC4V0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NDc7II2i+sFn8RfROoE+zIzYHQb54rXmGpR52pqgJQzYtdwPnhSOmDu1o/3kg+mhc
	 I3IoelE+qbIcI/smaWiNWA4obCwOI+GdtRFFcl+XeTO0E7J9I2Jbg3FGpi9JHZrgq3
	 6D4Up0A+ZyhDdSYTkmk3076kbl6KfMAiRYguCS+TDtRA8JcNKPNFjYnvdbcvz3OUMv
	 mAlY8p/czXAtTbaDpgsKjsdJJNKS0jPZlgL3A1mPVEZ+/wrCf6QIvnuEYVS6ejn33s
	 gscu3H311aZaPiKoTkbqCxp+h35Fr89/Dp3z913psnVJ4I3ej0li2r6GB4L12gMoq4
	 GijWoMV5aAF2w==
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
Subject: [PATCH 07/27] objtool: Make .discard.stack_frame_non_standard non-allocatable
Date: Thu, 27 Aug 2026 21:51:36 -0700
Message-ID: <b09f47f5741dc8eb2ec048e3340d626cf3e05a77.1787890035.git.jpoimboe@kernel.org>
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

