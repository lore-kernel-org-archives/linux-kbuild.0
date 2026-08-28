Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1728A3C9ECF;
	Fri, 28 Aug 2026 04:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892726; cv=none; b=NcHQQMnoTBqzNJeMXObVKi+93qGqWsvyUBxArEDBoMS7mzS0aJyKYdpIf2T4CMKOOADbK6ij3B9TQjkZqrEy53dZEeA2nopgRw6kTYXa9T85fxaZYbOwb1e/UXw2SiRjs6rB3CZfDvkdLNW3i/zXsbUKhPYFCJbAjgFUxlwGLpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892726; c=relaxed/simple;
	bh=PeDmX7SDU6AhEihArIs5iRLSLqZA5rMMhmXqtc46rtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IhxDdRZcuhjGUgwcAQNX5uPKDi+K19838H6k4hpUeVQdYxrokRq/sJoAo5IsPjTFQrCxu9fZ6IuGLx9ImR+6WztRQYnjCqtbOgm1pF+KkineZSHCjn0dcXF2rSca9bQQDiUblbY/iz/XoxbKfjgIQnWUiW/7YroWaPgkywIbUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V32UyxX3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V32UyxX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9CB1F00A3F;
	Fri, 28 Aug 2026 04:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892725;
	bh=LTJClFvbim3RR6e7TU+Sb/F6dppOoOMqDF4GEGzM61E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V32UyxX3t3s7rlqOwv0L5v26vYMEI0QAIw1icU5mQANTyCQ0ZL0ucMM+kwG+4xACw
	 bhgJxNNwMVojQ5dHrSJOUcdc1MKaojyatPIot2QGJIC5DZkGjqWgFBV8XaqgSXt/U2
	 fCegkBcwHxH/lhnNQkfxWfa5OI+WUgNusH3CUO109LGbugDqV4dDUbLT3HPv7hofQz
	 k5UyTbzrltYX5xNX2pCVNO6F4k74zCxZYJSHl5Enwabp3lPm+H+34waVrfRQhAGSyr
	 z9Prwbkbd4gQU1cHBk79tIInuh9UBKelKLBxIRkTJ8ktq0yduqXwJ50zixgRdWmQZ1
	 srBeXr2tXlaZQ==
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
Subject: [PATCH 10/27] objtool: Add ANNOTATE_IGNORE_NORETURN()
Date: Thu, 27 Aug 2026 21:51:39 -0700
Message-ID: <49da10e66e03e9acdbb66677afe5b4a89500ba79.1787890035.git.jpoimboe@kernel.org>
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
index 7333b0ed86818..ddb8dbe7f71d9 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -246,6 +246,9 @@ static bool is_noreturn(struct symbol *func)
 {
 	func = func->alias->pfunc;
 
+	if (func->ignore_noreturn)
+		return false;
+
 	if (is_listed_noreturn(func))
 		return true;
 
@@ -2389,6 +2392,18 @@ static int __annotate_early(struct objtool_file *file, int type, struct instruct
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
@@ -2435,6 +2450,10 @@ static int __annotate_late(struct objtool_file *file, int type, struct instructi
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

