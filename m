Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6D73BCD14;
	Tue,  8 Sep 2026 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899675; cv=none; b=MqMcFF2Qtp6u2p+lOQ/vBb4UjevblwQcClmb3fQFGdlWXcsD5JBcGQ5Esr0Fre125iams3kp99waVP2Zb1fZmanXA1La+sAFIQ0Oy3BiC3bjqlve9vnH6QRIbi6r8ieqDBVGduSnvNNAVaFgZwPp9dug1pv1H/BGLIj+3D99mxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899675; c=relaxed/simple;
	bh=arz7Z99v5DH5MJW76D5py8+52dz5qdc8kjnhb04V490=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucI+IbepHyHfdKO1XjMMWjyOJyJJsXtsW1QwyPUaFcj75hX4YdBQ7P//2C7qfvnFrL6Px8QmJE1TKpzXrVqXsOTRCxEthsvHWQsa9tWWvPuJQh5OMaeTWy/0enPJGjHiXALydMvCVzA48GcdNMtksZ8Rw0i+ufSxGpVJpoRbJDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKho3uem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKho3uem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B4F1F00A3F;
	Tue,  8 Sep 2026 20:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899673;
	bh=yeoYxTwkYVyKLW23eiw0I1lEKmI+ZjiGRpK7f9g5Xjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AKho3uemSqRR4hoFfmMa+y0+cwbSGll/98BY/Cru5K2gBMmlBPVxnJwss+HrJpjLC
	 Gzjj3AWuWpMaqy2v/WLvvLkjHtTfAATG4e+7WUcQSyAw16tZi9hApqlKLxIth/KGqM
	 u9+mWVRI5FVTzPgMbnz6+58er397VZxfy5A/gXw+6ZoIlZLFAtxcLSwcFYb+zbdlav
	 8mokBui9+CG0QJbQEwu+Gd0hU+gks0D/zH0OXilKexOrphUYU7ad1T8jB4iMhKM1Iy
	 iIdfC/CKWzjAKUt+9T4GGhdToxi3G7Lr5RX/sSZXCBSxIxtJl4G4Jc/dZVCIS/MnOU
	 /7NfUaAemHkow==
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
Subject: [PATCH v2 10/27] objtool: Add ANNOTATE_IGNORE_NORETURN()
Date: Tue,  8 Sep 2026 13:33:22 -0700
Message-ID: <4e85afe32c6e7b68f6b6a77cf25e6a29981a23cb.1788899473.git.jpoimboe@kernel.org>
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

