Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD983B6363;
	Tue,  8 Sep 2026 20:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899673; cv=none; b=OOrncezCJvifnGQWwNKWftOqUSKpOBO543b2DvL9IbndFn8m+iIAWa2TXrtQoD8LPkNWdiOOTG5WNlU9r20V1aZ98rzkeGb+YZlj8wgEbK4vyvxZrivook9DhxylauopN+jmDWtMQ2XdPXnaA+qMkBmALuPx6s8Uy/7fCo7L5zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899673; c=relaxed/simple;
	bh=a5y1EEkZOPnedpEWtUdzuXTqnsPBymub40I1Wh60MPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUA4u0nYaqzTNfHpbacY5NvOyew/T6t5k4iwVSGhwkbtBBpHbDhCrMBNGIfwjxMmrcuXzgjaAZwzYcGusvpXEtQVUoFid06BLT03V/kiQaEMbWIyS82zEXNXp0QieQ6ikZeek6zjiTSjNnzfAoAmxRne38zQlqQL2MtcIAXTBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8jDouDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8jDouDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB861F00A3A;
	Tue,  8 Sep 2026 20:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899671;
	bh=SxeKWlCwxhAr4gBBKtFFL+Dx5orsIMBJtg6I3hC4V0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N8jDouDGZnd+3OA/4XPlij22xKvpotyG4Q6RXkHoTfm31yDQ8QbwU1SpiHanSrIO2
	 cuTHMswe3A7bCp8vYKBLWL2fg7myh5hEQsfrOBBQJ2j0sAiG0j+tpMde5x1/chYrRt
	 7pbqvPdfyENr6YwjlPnb/wLSn+g2h3oaw9XNeb28N0HQPnCSjF9Rqto23iItez0G5P
	 2p7oM5OS+SRXqmgFsPU1oJsESOAnx0YRn1KrNvKGLzb0L9vSbaSFl+vi6y8+58t1mX
	 TxQeLuyTZohm0AfYP4N3W464KQ/aUCLkE1d5isSfhV/FechOQ4sFBGfdDjMwoWmMso
	 E+0sU62Ca7bDw==
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
Subject: [PATCH v2 07/27] objtool: Make .discard.stack_frame_non_standard non-allocatable
Date: Tue,  8 Sep 2026 13:33:19 -0700
Message-ID: <35e2d86e4ea5614b3888954b5a8e2b792eabca4b.1788899473.git.jpoimboe@kernel.org>
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

