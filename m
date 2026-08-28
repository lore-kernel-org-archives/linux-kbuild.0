Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EB83E1228;
	Fri, 28 Aug 2026 04:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892735; cv=none; b=jN+KcQ8dGBje2yUmsnSPody8XM8DorMdHgElQ3EvHwKM6aEw4rrjvJmJwR+8TgMqg6DLSlpuXXp1YH8Sg+/VbW19Hai8IU9nm4YU1TZRjLYZ08s83jFHrgMIPIbnOrhHwbMPelPHLHj/64Yzudxu3isR3VAVc7NhNinlKQqY4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892735; c=relaxed/simple;
	bh=Dw8ImwHNGI02o5j54nBfeDGmPkNrpZp/8y2VAHk5ErE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrCB0p7krSjuZgobMP/bpbuepCdgcMZu+a6L+sb0x0ulA3kDZDLLef6qjSkX/x4HoS8O1bEzyhS8HMmE8sZjIJNoyEpyffquSGev452f2DsY/a0qBDcdy+DTNKG1ZauMh3v0J8/69vkwhWf7/UpTry4obCFlYUcuD+Ai479+ABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzLqzhAy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzLqzhAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE55D1F00A3D;
	Fri, 28 Aug 2026 04:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892734;
	bh=MdNWGB7r1kZ2AVLhJlwhGUFr2V6cniFkjQc9iSIwdDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LzLqzhAyGoPT6aU7jtQSacKeArRTY4UoNz1Ek70iHUbRVI+87PgqUKzmP0P3ABb/D
	 on86dt2LxAUdO13ICKEegTwzBNQJzatRe89eTNGBfhu/nzcei5WBve/ufyNXAfRN8n
	 Z7xk8MM/eYmw2hRdwfzcI0AAPYn6qFl8Nb6TOTzy2xkNRaacDVuMXH+IoEC5MlMq/z
	 mj1kKjf5amFTj60WYpSTgtMhy0q07SntIPISOU17DNClAVEeRcPiuYhXrgCkdYD/b6
	 DBjcJRyCBO1jJJxRZveeKsXwJOOjEDK6SfJy4K+dNnosZS2NJvB/CRNlOr0tZWj2aX
	 behGhSr4faM+A==
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
Subject: [PATCH 25/27] objtool: Add ANNOTATE_EXPORTED_NORETURN()
Date: Thu, 27 Aug 2026 21:51:54 -0700
Message-ID: <5cb3ce81ac9bc1087313397d5e4b9fc066748dea.1787890035.git.jpoimboe@kernel.org>
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

Add ANNOTATE_EXPORTED_NORETURN() for the rare case where a module
exports a noreturn function.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 include/linux/annotate.h | 17 +++++++++++++++++
 tools/objtool/check.c    | 27 +++++++++++++++++++++++++++
 tools/objtool/klp-diff.c | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/include/linux/annotate.h b/include/linux/annotate.h
index a81ca04b4c501..70450eeec3186 100644
--- a/include/linux/annotate.h
+++ b/include/linux/annotate.h
@@ -25,6 +25,15 @@
 	"912: "								\
 	__stringify(__ASM_ANNOTATE(.discard.annotate_data, 912b, type))
 
+/*
+ * Annotate a symbol by name rather than by relocation, so it can optionally be
+ * used in a header file.
+ */
+#define ASM_ANNOTATE_NAME(section, sym)					\
+	".pushsection " section ", \"MS\", @progbits, 1\n\t"		\
+	".asciz \"" __stringify(sym) "\"\n\t"				\
+	".popsection"
+
 #else /* __ASSEMBLY__ */
 
 .macro ANNOTATE type
@@ -44,6 +53,7 @@
 #define ASM_ANNOTATE_LABEL(label, type) ""
 #define ASM_ANNOTATE(type)
 #define ASM_ANNOTATE_DATA(type)
+#define ASM_ANNOTATE_NAME(section, sym) ""
 #else /* __ASSEMBLY__ */
 .macro ANNOTATE type
 .endm
@@ -112,6 +122,13 @@
  */
 #define ANNOTATE_IGNORE_NORETURN(sym)	asm(ASM_ANNOTATE_LABEL(sym, ANNOTYPE_IGNORE_NORETURN))
 
+/*
+ * Tell objtool running on a module that a function exported by another module
+ * is __noreturn.  Objtool has no way of communicating that between modules due
+ * to the parallel nature of module linking in kbuild.
+ */
+#define ANNOTATE_EXPORTED_NORETURN(sym)	asm(ASM_ANNOTATE_NAME(".discard.annotate_noreturn", sym))
+
 /*
  * Annotate a special section entry.  This emables livepatch module generation
  * to find and extract individual special section entries as needed.
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 583d86220e040..6eaac32374722 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -409,6 +409,31 @@ static int read_noreturns(struct objtool_file *file)
 	return 0;
 }
 
+static void read_annotate_noreturn(struct objtool_file *file)
+{
+	struct section *sec;
+	struct symbol *func;
+	unsigned long off;
+	const char *name;
+
+	sec = find_section_by_name(file->elf, ".discard.annotate_noreturn");
+	if (!sec || !sec->data)
+		return;
+
+	for (off = 0; off < sec_size(sec); off += strlen(name) + 1) {
+		name = sec->data->d_buf + off;
+		if (!*name)
+			continue;
+
+		func = find_global_symbol_by_name(file->elf, name);
+		if (!func)
+			continue;
+
+		if (is_undef_sym(func))
+			func->_noreturn = 1;
+	}
+}
+
 static void init_cfi_state(struct cfi_state *cfi)
 {
 	int i;
@@ -4984,6 +5009,8 @@ int check(struct objtool_file *file)
 			goto out;
 	}
 
+	read_annotate_noreturn(file);
+
 	ret = decode_file(file);
 	if (ret)
 		goto out;
diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 16681a76f13d0..5719a8e016cb3 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -361,6 +361,7 @@ static bool is_special_section(struct section *sec)
 
 	static const char * const non_special_discards[] = {
 		".discard.addressable",
+		".discard.annotate_noreturn",
 		".discard.sym_checksum",
 	};
 
@@ -2217,6 +2218,34 @@ static int copy_import_ns(struct elfs *e)
 	return 0;
 }
 
+/*
+ * ANNOTATE_EXPORTED_NORETURN() annotations reference their functions by name
+ * rather than by relocation, so individual entries can't be extracted.  Copy
+ * the (tiny) section as-is.
+ */
+static int copy_annotate_noreturn(struct elfs *e)
+{
+	struct section *patched_sec, *out_sec;
+
+	patched_sec = find_section_by_name(e->patched, ".discard.annotate_noreturn");
+	if (!patched_sec || !patched_sec->data || !sec_size(patched_sec))
+		return 0;
+
+	out_sec = elf_create_section(e->out, patched_sec->name, 0,
+				     patched_sec->sh.sh_entsize,
+				     patched_sec->sh.sh_type,
+				     patched_sec->sh.sh_addralign,
+				     patched_sec->sh.sh_flags);
+	if (!out_sec)
+		return -1;
+
+	if (!elf_add_data(e->out, out_sec, patched_sec->data->d_buf,
+			  sec_size(patched_sec)))
+		return -1;
+
+	return 0;
+}
+
 int cmd_klp_diff(int argc, const char **argv)
 {
 	struct elfs e = {0};
@@ -2288,6 +2317,9 @@ int cmd_klp_diff(int argc, const char **argv)
 	if (copy_import_ns(&e))
 		return -1;
 
+	if (copy_annotate_noreturn(&e))
+		return -1;
+
 	if  (elf_write(e.out))
 		return -1;
 
-- 
2.55.0

