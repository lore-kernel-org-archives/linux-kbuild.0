Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5123B777F;
	Tue,  8 Sep 2026 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899672; cv=none; b=oKlzMth38oBabO9zl1GFqDNkJDdAq1uZZVY41FvaPEFTIJwnUqwoRz/9iiqrS4tP2Jc5ctsCicvsJ8YUTUQrenqkCwjiubtgweVXOjBtH+DMF4FaxJzk6mARYkf7mflFqdA2HR6FcC0asSYnXLgTyWDf9J7KobQF/mlOUknV4Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899672; c=relaxed/simple;
	bh=aj/ip20n8sCr0nYkSnByns9Tm7iVGZdyMePVQA1eGrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Thma/7reHNPXz8wjl2W8Hkt3pmD0IU2tC69LfmBinCl4vq3EKOSxTUMY7eg0jWlDPLHELciSuMYNNQt8z6ABFSMQiobiVlDJSw9ehRx1t5+437P8iLZbp+r2oIHRoXvd9excxosvO6RB54J2XMJjtmncX4IvogfgU2awenm85EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIPcMbbY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIPcMbbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186991F00A3E;
	Tue,  8 Sep 2026 20:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899670;
	bh=gpZkeU1ez/jJdds8D5Mf1lVFeLdql8geXuOpgaKy+VU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HIPcMbbYtLoGC6koF7fIgFIW0rPVp020jvyitla47A9qZlqLvA2zrUMYuXkLrlAge
	 8174tDptkXeICsFSO9uyNyz1F5UpscHqxQpQ4pzahZbxxrfLYu5TOmpyWJMNhcOe1g
	 bjZswnCdyGTvP7wzeCzynSpXsEToMocsR+5nO/ZUr1JLljtDvuWvtFBOkxlXSOAiAp
	 l1cNzLt0GkobglBK/4gsagcgu19bb4DkQA45WdU1F75uEoRckoUb6zpfbCyDEhMczu
	 +3/VooH/54M0VnBt4GTJFf3gYfPWOmScyl5CbUcMc5xDo68aKmtG+FMdzhKAnjIW3l
	 pHmQpSigqjixQ==
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
Subject: [PATCH v2 05/27] objtool: Refactor the noreturn/dead-end detection
Date: Tue,  8 Sep 2026 13:33:17 -0700
Message-ID: <9d4b8ccfed745ac47a954aa2e1de62a85197122d.1788899473.git.jpoimboe@kernel.org>
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

The dead end detection (basically "is this a call to a noreturn?") is
currently derived on demand, at each call site.  Also, the answer
isn't saved anywhere, so it's redetermined each time.  It also has an
ugly recursion check.

Clean that up by just detecting all the noreturns at the beginning.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c               | 159 ++++++++++++++++------------
 tools/objtool/include/objtool/elf.h |   1 +
 2 files changed, 93 insertions(+), 67 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 1fe7efa934ebf..83b4e748d33ba 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -219,94 +219,112 @@ static bool is_rust_noreturn(const struct symbol *func)
 		str_ends_with(func->name, "_fail"));
 }
 
-/*
- * This checks to see if the given function is a "noreturn" function.
- *
- * For global functions which are outside the scope of this object file, we
- * have to keep a manual list of them.
- *
- * For local functions, we have to detect them manually by simply looking for
- * the lack of a return instruction.
- */
-static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
-				int recursion)
+static bool is_listed_noreturn(struct symbol *func)
 {
-	int i;
-	struct instruction *insn;
-	bool empty = true;
-
 #define NORETURN(func) __stringify(func),
 	static const char * const global_noreturns[] = {
 #include "noreturns.h"
 	};
 #undef NORETURN
 
-	if (!func)
+	if (is_local_sym(func))
 		return false;
 
-	if (!is_local_sym(func)) {
-		if (is_rust_noreturn(func))
+	if (is_rust_noreturn(func))
+		return true;
+
+	for (int i = 0; i < ARRAY_SIZE(global_noreturns); i++)
+		if (!strcmp(func->name, global_noreturns[i]))
 			return true;
 
-		for (i = 0; i < ARRAY_SIZE(global_noreturns); i++)
-			if (!strcmp(func->name, global_noreturns[i]))
-				return true;
-	}
+	return false;
+}
+
+/*
+ * Use this rather than reading sym->_noreturn directly: the noreturn status
+ * lives on the primary alias, and ANNOTATE_IGNORE_NORETURN() overrides it.
+ */
+static bool is_noreturn(struct symbol *func)
+{
+	func = func->alias->pfunc;
+
+	if (is_listed_noreturn(func))
+		return true;
+
+	return func->_noreturn;
+}
+
+static bool might_return(struct objtool_file *file, struct symbol *func)
+{
+	struct instruction *insn;
+	struct symbol *dest;
 
 	if (is_weak_sym(func))
-		return false;
-
-	if (!func->len)
-		return false;
-
-	insn = find_insn(file, func->sec, func->offset);
-	if (!insn || !insn_func(insn))
-		return false;
+		return true;
 
 	func_for_each_insn(file, func, insn) {
-		empty = false;
-
 		if (insn->type == INSN_RETURN)
-			return false;
-	}
-
-	if (empty)
-		return false;
-
-	/*
-	 * A function can have sibling calls instead of a return.  It's only a
-	 * dead end if *all* the sibling call targets are dead ends.
-	 */
-	func_for_each_insn(file, func, insn) {
-		struct symbol *dest;
+			return true;
 
 		if (!is_sibling_call(insn))
 			continue;
 
 		dest = insn_call_dest(insn);
-		if (!dest)
-			/* call to another file */
-			return false;
-
-		if (recursion == 5) {
-			/*
-			 * Infinite recursion: two functions have sibling
-			 * calls to each other.  This is a very rare case.
-			 * It means they aren't dead ends.
-			 */
-			return false;
-		}
-
-		if (!__dead_end_function(file, dest, recursion+1))
-			return false;
+		if (!dest || !is_noreturn(dest))
+			return true;
 	}
 
-	return true;
+	return false;
 }
 
-static bool dead_end_function(struct objtool_file *file, struct symbol *func)
+static void detect_noreturns(struct objtool_file *file)
 {
-	return __dead_end_function(file, func, 0);
+	struct symbol *func, *dest;
+	struct instruction *insn;
+	bool changed;
+
+	/* Mark all functions guilty until proven innocent */
+	for_each_sym(file->elf, func) {
+
+		/* Aliases and cold subfunctions inherit the parent's verdict */
+		if (!is_func_sym(func) || is_undef_sym(func) ||
+		    is_prefix_func(func) || func->embedded_insn ||
+		    func != func->alias->pfunc)
+			continue;
+
+		insn = find_insn(file, func->sec, func->offset);
+		if (!insn || insn_func(insn) != func)
+			continue;
+
+		func->_noreturn = 1;
+	}
+
+	/*
+	 * A function's noreturn status depends on those of its sibling call
+	 * destinations, which may not be settled yet.  Keep clearing the
+	 * noreturn bit for known cases until it stops spreading.
+	 */
+	do {
+		changed = false;
+
+		for_each_sym(file->elf, func) {
+			if (!func->_noreturn || !might_return(file, func))
+				continue;
+
+			func->_noreturn = 0;
+			changed = true;
+		}
+	} while (changed);
+
+	/* Now mark the dead end call sites */
+	for_each_insn(file, insn) {
+		if (insn->type != INSN_CALL)
+			continue;
+
+		dest = insn_call_dest(insn);
+		if (dest && is_noreturn(dest))
+			insn->dead_end = true;
+	}
 }
 
 static void init_cfi_state(struct cfi_state *cfi)
@@ -1422,9 +1440,6 @@ static int annotate_call_site(struct objtool_file *file,
 	    !insn->_call_dest->embedded_insn)
 		list_add_tail(&insn->call_node, &file->call_list);
 
-	if (!sibling && dead_end_function(file, sym))
-		insn->dead_end = true;
-
 	return 0;
 }
 
@@ -2669,6 +2684,17 @@ int decode_file(struct objtool_file *file)
 	if (add_jump_table_alts(file))
 		return -1;
 
+	/*
+	 * Must be after add_jump_table_alts(), which affects sibling call
+	 * detection (jump table branches vs indirect sibling calls).
+	 *
+	 * The dead end marks are read by validate_branch() -- reached from
+	 * both validate_functions() and validate_noinstr_sections() -- and by
+	 * validate_unret().
+	 */
+	if (validate_branch_enabled() || opts.noinstr || opts.unret)
+		detect_noreturns(file);
+
 	if (read_unwind_hints(file))
 		return -1;
 
@@ -2676,8 +2702,7 @@ int decode_file(struct objtool_file *file)
 	mark_holes(file);
 
 	/*
-	 * Must be after add_call_destinations() such that it can override
-	 * dead_end_function() marks.
+	 * Must be after detect_noreturns() so it can override dead_end marks.
 	 */
 	if (read_annotate(file, __annotate_late))
 		return -1;
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index a82517a76a0f6..46fb2230ca743 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -98,6 +98,7 @@ struct symbol {
 	u8 klp		     : 1;
 	u8 dont_correlate    : 1;
 	u8 fake		     : 1;
+	u8 _noreturn         : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 	struct section *group_sec;
-- 
2.55.0

