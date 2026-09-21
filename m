Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342DF522EE5;
	Mon, 21 Sep 2026 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029903; cv=none; b=NhucSizl3Op8Og+2XJhxkDP8arRSezRc3H+wP3LglH7T2elZTuKr/HxMf/BZ7efNEk9+9W6RipBu5T+5Iu38T/Ee4/U259fV3dGCrYDcSWWRUhCljkp9yqgYm6ZgmhwOnhQIQ2ryIMmWV0WJYidFv0u2xApuFgvHcxIDlbG0PQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029903; c=relaxed/simple;
	bh=arz7Z99v5DH5MJW76D5py8+52dz5qdc8kjnhb04V490=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q461lSTGVLeHWim+GmkprsiEYwnHn2jn9jR+rQZ7gP9kEOsjYbj5RmPNUn9HcYthbEL6huK+uBCGNIJqZQR8DCA0PN3LLfbGssmZ+6KIGHQPRpqyXlFrvpVSeKJXOTfsfVZdI63yaPLjl2EdTKCJVdCNaLzjPZe+rZVE1YKibJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULqkVDVK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULqkVDVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BEF1F0089C;
	Mon, 21 Sep 2026 22:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029902;
	bh=yeoYxTwkYVyKLW23eiw0I1lEKmI+ZjiGRpK7f9g5Xjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ULqkVDVK1M8fQ3mKpFEpT0ZD81ClS+eoUF9EqqM8L+rfbpnNR3MNia1t4FMoMMtgx
	 QDzlZu4tbi14s2Ctvfb42e2cK+4bdBg5gIiuNCsuah8mebRNTax1y1VjQifNFNlTgc
	 7WBbpBRpBK8Rt1OEP4R02ioCMtU1v2u9ElbiHpBHYeHbBDiz2EvVfxrsL4jkmusaGE
	 GzYG7pobjZWE/7LwBCaDamaQAgA4X6J1QdZ7YiHDng19r1NUzGF2DHalzCJKc5Oolz
	 VV0lpeL5QC7Kos11b650AL0S5CLnrAY2+FLb+joRnX7G04/cLfI+34+7bHrM+uRtFK
	 xfspo+BqYqLhQ==
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
Subject: [PATCH v3 10/28] objtool: Add ANNOTATE_IGNORE_NORETURN()
Date: Mon, 21 Sep 2026 15:31:11 -0700
Message-ID: <496ebf3c42a204885caf3e5ac1f36844ef11da5c.1790028654.git.jpoimboe@kernel.org>
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

A generic interface may be noreturn in one arch and returnable in
another, in which case its common declaration can't say __noreturn.

Rust has a similar issue where a few core library calls to returnable
functions are replaced after compilation with calls to a noreturn panic
function.

Add an annotation which tells objtool to ignore the noreturn status of a
given function.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 include/linux/annotate.h            |  7 +++++++
 include/linux/objtool_types.h       |  1 +
 tools/include/linux/objtool_types.h |  1 +
 tools/objtool/check.c               | 19 +++++++++++++++++++
 tools/objtool/include/objtool/elf.h |  1 +
 5 files changed, 29 insertions(+)

diff --git a/include/linux/annotate.h b/include/linux/annotate.h
index 2f1599c9e5732..a81ca04b4c501 100644
--- a/include/linux/annotate.h
+++ b/include/linux/annotate.h
@@ -3,6 +3,7 @@
 #define _LINUX_ANNOTATE_H
 
 #include <linux/objtool_types.h>
+#include <linux/stringify.h>
 
 #ifdef CONFIG_OBJTOOL
 
@@ -105,6 +106,12 @@
  */
 #define ANNOTATE_NOCFI_SYM(sym)		asm(ASM_ANNOTATE_LABEL(sym, ANNOTYPE_NOCFI))
 
+/*
+ * Treat a function as returnable by its callers despite objtool classifying it
+ * as noreturn.
+ */
+#define ANNOTATE_IGNORE_NORETURN(sym)	asm(ASM_ANNOTATE_LABEL(sym, ANNOTYPE_IGNORE_NORETURN))
+
 /*
  * Annotate a special section entry.  This emables livepatch module generation
  * to find and extract individual special section entries as needed.
diff --git a/include/linux/objtool_types.h b/include/linux/objtool_types.h
index c24e9ea392696..ce08ecc808c67 100644
--- a/include/linux/objtool_types.h
+++ b/include/linux/objtool_types.h
@@ -66,6 +66,7 @@ struct unwind_hint {
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
 #define ANNOTYPE_NOCFI			9
+#define ANNOTYPE_IGNORE_NORETURN	10
 
 #define ANNOTYPE_DATA_SPECIAL		1
 
diff --git a/tools/include/linux/objtool_types.h b/tools/include/linux/objtool_types.h
index c24e9ea392696..ce08ecc808c67 100644
--- a/tools/include/linux/objtool_types.h
+++ b/tools/include/linux/objtool_types.h
@@ -66,6 +66,7 @@ struct unwind_hint {
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
 #define ANNOTYPE_NOCFI			9
+#define ANNOTYPE_IGNORE_NORETURN	10
 
 #define ANNOTYPE_DATA_SPECIAL		1
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index f65b1b01b4fe9..d3b5c372cba4a 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -248,6 +248,9 @@ static bool is_noreturn(struct symbol *func)
 {
 	func = func->alias->pfunc;
 
+	if (func->ignore_noreturn)
+		return false;
+
 	if (is_listed_noreturn(func))
 		return true;
 
@@ -2391,6 +2394,18 @@ static int __annotate_early(struct objtool_file *file, int type, struct instruct
 		insn->noendbr = 1;
 		break;
 
+	/* Must be before detect_noreturns() */
+	case ANNOTYPE_IGNORE_NORETURN: {
+		struct symbol *sym = insn_sym(insn);
+
+		if (!sym) {
+			ERROR_INSN(insn, "dodgy IGNORE_NORETURN annotation");
+			return -1;
+		}
+		sym->ignore_noreturn = 1;
+		break;
+	}
+
 	default:
 		break;
 	}
@@ -2437,6 +2452,10 @@ static int __annotate_late(struct objtool_file *file, int type, struct instructi
 		/* early */
 		break;
 
+	case ANNOTYPE_IGNORE_NORETURN:
+		/* early */
+		break;
+
 	case ANNOTYPE_RETPOLINE_SAFE:
 		if (insn->type != INSN_JUMP_DYNAMIC &&
 		    insn->type != INSN_CALL_DYNAMIC &&
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index 46fb2230ca743..0e3593d993ac8 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -99,6 +99,7 @@ struct symbol {
 	u8 dont_correlate    : 1;
 	u8 fake		     : 1;
 	u8 _noreturn         : 1;
+	u8 ignore_noreturn   : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 	struct section *group_sec;
-- 
2.55.0

