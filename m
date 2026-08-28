Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584683E2769;
	Fri, 28 Aug 2026 04:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892736; cv=none; b=K3LaCNDwmhJP4fc4ED8k7KW2pzlpWOac0FMwaFJbzxALz6alyVeuIcG6qGuiCF3Ig4NQUNLx4O0OPZ/0hVsstPThUt1rJ28T6WO5UCMMNMSiDE9AJoQWjVNLySCY8KsQkGNxst+31IFYrQRyWqA0OMXFRSRZqG8mY+gIdgyE9rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892736; c=relaxed/simple;
	bh=RzfTI7uQBvp9k+BuIqEdlBvxw7qN7SgpzwRaqcp27vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8V+/yrt2BcMASpW3hcEzx7aibRFP7WSGqJDBNSMiCImSOsl1cLesZoV69pyrrUtFC6lh8GFyEgNLA1cvEG0R2YKIf2u8yQ8TLtWKa38qQEEB5FIX4fv4EiGRL2j+T4OAd/BKY48gOWGUxlSCyxR6YEqwopy8Z9UdfOjPAcJv1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fyo6yvQI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fyo6yvQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF24B1F00A3F;
	Fri, 28 Aug 2026 04:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892735;
	bh=DzRLb9fVOui+CIzGA5sRoi6KZ73tjqkQTajZiUXBPHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fyo6yvQIpYn/xjlsR3HT78bAIlhJc956175EsMmalq4D+krEgOKkZcqZj2B4rto0x
	 iHG958pXTC9LfwVCPvYFmOaVLLxX1nTfC6ouXWHRoAHqvxNGuPE+o3kfKWk+bKfE9d
	 1O+qlNyugSzjOdHB0oolgbyN2eNrDtIoD76X9WbZvuz4EpXb9Lo1uzvO5Nb8CqLDu1
	 0OxhLpxcXNfrA3lCIHX9vDJfkYKSd79aIcfYJwLNmvZ40DQjo7JHxhGSV9aWJ1OMDO
	 p46Rlq4B9D0ZIV43oxgZe5jrJkQPaPoaYX48Lj4me24URhZPL9a+ccYcmDpyjSl4ha
	 mXy6DyDbWCWVw==
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
Subject: [PATCH 27/27] objtool: Warn about missing/stale ANNOTATE_EXPORTED_NORETURN() usage
Date: Thu, 27 Aug 2026 21:51:56 -0700
Message-ID: <4db947677ac3e655a094335c8a23fc0dfe5b2e56.1787890035.git.jpoimboe@kernel.org>
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

Add some warnings to keep ANNOTATE_EXPORTED_NORETURN() annotations
correct.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/Documentation/objtool.txt | 22 ++++++++-
 tools/objtool/check.c                   | 59 ++++++++++++++++++++-----
 tools/objtool/include/objtool/elf.h     |  1 +
 3 files changed, 71 insertions(+), 11 deletions(-)

diff --git a/tools/objtool/Documentation/objtool.txt b/tools/objtool/Documentation/objtool.txt
index d5ac48bc203ec..950e88c713d1d 100644
--- a/tools/objtool/Documentation/objtool.txt
+++ b/tools/objtool/Documentation/objtool.txt
@@ -393,7 +393,7 @@ the objtool maintainers.
 
    a) funcA()'s last instruction is a call to a "noreturn" function like
       panic(), and objtool doesn't know that function never returns.  See
-      warning 3 above.
+      warnings 3 and 13.
 
    b) funcA() uses the unreachable() annotation in a section of code
       that is actually reachable.
@@ -455,6 +455,26 @@ the objtool maintainers.
     macros to create them.
 
 
+13. file.o: warning: objtool: func() is exported and noreturn, its declaration needs __noreturn and ANNOTATE_EXPORTED_NORETURN()
+
+    func() is exported and never returns, but is defined in a module, so
+    its noreturn status needs to be manually annotated.  Put an
+    ANNOTATE_EXPORTED_NORETURN() next to its declaration.
+
+    Mark the declaration __noreturn while you're there, if it isn't
+    already.  The two go together: __noreturn stops the compiler from
+    emitting code after the call, and the annotation tells objtool the
+    call doesn't return.
+
+
+14. file.o: warning: objtool: func() has ANNOTATE_EXPORTED_NORETURN() but returns
+
+    func() is annotated as never returning, but it does.  Usually this
+    means the annotation outlived the fact: the function grew a return path
+    and the ANNOTATE_EXPORTED_NORETURN() next to its declaration was left
+    behind.  Remove it, along with the __noreturn.
+
+
 If the error doesn't seem to make sense, it could be a bug in objtool.
 Feel free to ask objtool maintainers for help.
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index aced52ad6fc81..ac6ae823a2d45 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -224,6 +224,22 @@ static bool might_return(struct objtool_file *file, struct symbol *func)
 	return false;
 }
 
+static bool is_noreturn_candidate(struct objtool_file *file, struct symbol *func)
+{
+	struct instruction *insn;
+
+	if (!is_func_sym(func) || is_undef_sym(func) ||
+	    is_prefix_func(func) || func->embedded_insn ||
+	    func != func->alias->pfunc)
+		return false;
+
+	insn = find_insn(file, func->sec, func->offset);
+	if (!insn || insn_func(insn) != func)
+		return false;
+
+	return true;
+}
+
 static void detect_noreturns(struct objtool_file *file)
 {
 	struct symbol *func, *dest;
@@ -232,15 +248,7 @@ static void detect_noreturns(struct objtool_file *file)
 
 	/* Mark all functions guilty until proven innocent */
 	for_each_sym(file->elf, func) {
-
-		/* Aliases and cold subfunctions inherit the parent's verdict */
-		if (!is_func_sym(func) || is_undef_sym(func) ||
-		    is_prefix_func(func) || func->embedded_insn ||
-		    func != func->alias->pfunc)
-			continue;
-
-		insn = find_insn(file, func->sec, func->offset);
-		if (!insn || insn_func(insn) != func)
+		if (!is_noreturn_candidate(file, func))
 			continue;
 
 		func->_noreturn = 1;
@@ -410,9 +418,38 @@ static void read_annotate_noreturn(struct objtool_file *file)
 
 		if (is_undef_sym(func))
 			func->_noreturn = 1;
+
+		func->annotate_noreturn = 1;
 	}
 }
 
+static int validate_noreturns(struct objtool_file *file)
+{
+	struct symbol *func;
+	int warnings = 0;
+
+	for_each_sym(file->elf, func) {
+		if (!is_noreturn_candidate(file, func))
+			continue;
+
+		if (opts.module && is_noreturn(func) && func->exported &&
+		    !func->annotate_noreturn) {
+			WARN("%s() is exported and noreturn, its declaration needs __noreturn and ANNOTATE_EXPORTED_NORETURN()",
+			     func->name);
+			warnings++;
+		}
+
+		if (func->annotate_noreturn && !func->ignore_noreturn &&
+		    !is_noreturn(func)) {
+			WARN("%s() has ANNOTATE_EXPORTED_NORETURN() but returns",
+			     func->name);
+			warnings++;
+		}
+	}
+
+	return warnings;
+}
+
 static void init_cfi_state(struct cfi_state *cfi)
 {
 	int i;
@@ -5005,8 +5042,10 @@ int check(struct objtool_file *file)
 
 		w += validate_functions(file);
 		w += validate_unwind_hints(file, NULL);
-		if (!w)
+		if (!w) {
 			w += validate_reachable_instructions(file);
+			w += validate_noreturns(file);
+		}
 
 		warnings += w;
 
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index adf6e1322c6df..e79cdabf09c26 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -100,6 +100,7 @@ struct symbol {
 	u8 fake		     : 1;
 	u8 _noreturn         : 1;
 	u8 ignore_noreturn   : 1;
+	u8 annotate_noreturn : 1;
 	u8 exported          : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
-- 
2.55.0

