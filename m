Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B365304A1;
	Mon, 21 Sep 2026 22:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029912; cv=none; b=HEyZfumjUZ4/cgdjzAMyzY3MTRumyy+r4d7BrDe1o9LchfRdelLJZrqDleWYUkq3ts6cA2sFu3V6Komd/jGoqIyB00kv267tetB+UcLOiaFSnN4GhuJtekF23DzEW7PxZf8E63E/p7RktJG6Y1yZm24fLbKmvwNJPbabh2MH9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029912; c=relaxed/simple;
	bh=dsgOnfDAX5cJwX1hU0Wk12p5knwAGAE3pXL5laTYyqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILR7sO09ucpsefhrrhiWIV0D35it04jFFERv4pVSY3DZhMYPpDOO1nKHY5edWNFCrJGlY8eyebVdp66bvKfb5CVMyts4QAhnD0w8m+mas/c/V1SPUhS1x/RD+XfSrcungvibCSzdRqe0k5uJ5B0sQY2t4DUSU1SoHb5pg3oMAcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2EdFPn1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2EdFPn1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8AB1F000FF;
	Mon, 21 Sep 2026 22:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029911;
	bh=tXKsr38W0Hp9RYIwyVzbjbHByCfkbgvG32ZvcJyTzxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o2EdFPn1NSj68WRSpe8orqlScp8xHl6kKTbafHgTF8XYuGiQG6XZRYGEGO+NPLYWu
	 vRbj+dTVSmXe9GjGKO9duBprn4M2Vm7eLNqiYX8DRAknruoW7dZ6y6J3K59Vm36Jcl
	 F4JiifJEJmX14myMI6BP6C3OG/iBUIzYPFl8jxvz/SiI+P9A3VU/+4exFIG3/f3IBF
	 79FgCnPo55wOnGH6AMGiH2uxaEHmL9J7Z+Sn3e3cgjTvBOmXswCooFUgZNzyXcjRE3
	 6WUfHHGSyEsKT8LArPpJFt4UknvW1xBZ/yeNJ8pvZxBi3tV3QTvIJVM0X0XoXl7NlO
	 7GxSKJb1LOTyA==
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
Subject: [PATCH v3 25/28] objtool: Add ANNOTATE_EXPORTED_NORETURN()
Date: Mon, 21 Sep 2026 15:31:26 -0700
Message-ID: <9c3f5d7259afaf5612fdadb7f70aabd2e0e0f790.1790028654.git.jpoimboe@kernel.org>
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
index 1ac4da1eaab75..de05789b42ff5 100644
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
@@ -4978,6 +5003,8 @@ int check(struct objtool_file *file)
 			goto out;
 	}
 
+	read_annotate_noreturn(file);
+
 	ret = decode_file(file);
 	if (ret)
 		goto out;
diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 34da55e456097..8a30bf7d1eaf9 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -360,6 +360,7 @@ static bool is_special_section(struct section *sec)
 
 	static const char * const non_special_discards[] = {
 		".discard.addressable",
+		".discard.annotate_noreturn",
 		".discard.sym_checksum",
 	};
 
@@ -2216,6 +2217,34 @@ static int copy_import_ns(struct elfs *e)
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
@@ -2287,6 +2316,9 @@ int cmd_klp_diff(int argc, const char **argv)
 	if (copy_import_ns(&e))
 		return -1;
 
+	if (copy_annotate_noreturn(&e))
+		return -1;
+
 	if  (elf_write(e.out))
 		return -1;
 
-- 
2.55.0

