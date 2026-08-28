Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BBB3DCDAC;
	Fri, 28 Aug 2026 04:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892733; cv=none; b=V92yFWLSJSrWYyFk9GRKDv85xxWBCuvYHNyqFNJur6uE4juLNoWugV/aMUBU4wNZOrEk7YcP+c5wJKTfsvIr8xEELDL2A9pwvZ7uJk8TC1ej88IwlJwJYg5LLFLt6uMejO7KXviW03tC2zPcHRJlXfme7/cthhToYTF65TO1RJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892733; c=relaxed/simple;
	bh=ujeEIEMwjs/4fR1JkO8/KKz0kIVbJUN7MkzbmDnVGAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgczN9izjUD8/lGwt+8oHmFDgkIHRYSinXtWS8SzSWSoJ9nXlZmQVgCbP7pcFtCm6mvSSdx64pIAqBXLo2WmfJAw54xhc0fNVNBBZx/wvfHbM0DDX3PwdVQK/V6TuJDqfvnnPM33fqQ0XJABeTq1UmelqYWmASgwdq9ueyrELEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljTLdyh4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljTLdyh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03691F00A3E;
	Fri, 28 Aug 2026 04:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892732;
	bh=ZJmzcTeD+I+Tn3JWJgXiPZsKk0Ac7WHrXioao5XTlL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ljTLdyh4FToTTqubVVH7W5BdFXjPxTEWkqpCS2obMkktQwjfLAB9TkbJNhiTugi9V
	 xS2/AsdM9ekGv6732xKBeFueKtoOEcTBeTQtwqQE3Nmgi2rertA1ZjnhhGWvg99sy/
	 InbZ9eXMsXB/KuUPDKjuzgpDhOW+UIFfZY8UFG0vQxHF+6Cs664bu7ZhlleK1QFHfq
	 Kg82O+zCQbTFyIN9/fBAPPQF26LEeWi3l7Yy45kU3Orom+KUDBJxkVdMzMei2jpay9
	 gOimIhrKtUt3N7esf3Gmhq/KDKpWDP57iiOjv/45Soa8OECjCFfhFvbF4V00v8inQm
	 Pwj94zKsvfuCQ==
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
Subject: [PATCH 22/27] objtool: Add options to write/read exported noreturns to/from a file
Date: Thu, 27 Aug 2026 21:51:51 -0700
Message-ID: <109a1033440e9bb33a73dc42599049f18f60df1c.1787890035.git.jpoimboe@kernel.org>
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

Add --noreturns-write which can be used to write vmlinux's exported
noreturns to a file, and --noreturn-read which can be used to read them
when running objtool on a module.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/builtin-check.c           |  12 ++
 tools/objtool/check.c                   | 148 +++++++++++++++++++++++-
 tools/objtool/include/objtool/builtin.h |   2 +
 tools/objtool/include/objtool/elf.h     |   1 +
 4 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index 75b11dc85010e..c4c4210f84662 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -101,6 +101,8 @@ static const struct option check_options[] = {
 	OPT_BOOLEAN(0,		 "module", &opts.module, "object is part of a kernel module"),
 	OPT_BOOLEAN(0,		 "mnop", &opts.mnop, "nop out mcount call sites"),
 	OPT_BOOLEAN(0,		 "no-unreachable", &opts.no_unreachable, "skip 'unreachable instruction' warnings"),
+	OPT_STRING(0,		 "noreturns-read", &opts.noreturns_read, "file", "read exported noreturns from a file"),
+	OPT_STRING(0,		 "noreturns-write", &opts.noreturns_write, "file", "write exported noreturns to a file"),
 	OPT_STRING('o',		 "output", &opts.output, "file", "output file name"),
 	OPT_BOOLEAN(0,		 "sec-address", &opts.sec_address, "print section addresses in warnings"),
 	OPT_BOOLEAN(0,		 "stats", &opts.stats, "print statistics"),
@@ -180,6 +182,16 @@ static bool opts_valid(void)
 		return false;
 	}
 
+	if (opts.noreturns_write && !opts.link) {
+		ERROR("--noreturns-write requires --link");
+		return false;
+	}
+
+	if (opts.noreturns_write && !opts.stackval && !opts.orc && !opts.uaccess) {
+		ERROR("--noreturns-write requires --stackval, --orc, or --uaccess");
+		return false;
+	}
+
 	if (opts.disas			||
 	    opts.hack_jump_label	||
 	    opts.hack_noinstr		||
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d27303220c29d..086e8f9eca867 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -339,6 +339,120 @@ static void detect_noreturns(struct objtool_file *file)
 	}
 }
 
+static bool noreturns_changed(const char *buf, size_t len)
+{
+	bool changed = true;
+	char *old = NULL;
+	FILE *fp;
+
+	fp = fopen(opts.noreturns_write, "r");
+	if (!fp)
+		return true;
+
+	old = malloc(len + 1);
+	if (!old)
+		goto out;
+
+	if (fread(old, 1, len + 1, fp) != len)
+		goto out;
+
+	if (memcmp(old, buf, len))
+		goto out;
+
+	changed = false;
+
+out:
+	free(old);
+	fclose(fp);
+	return changed;
+}
+
+/*
+ * This is called for vmlinux.o.  Write the vmlinux.o noreturn list to a file
+ * so it can be read in module objtool runs by read_noreturns().
+ */
+static int write_noreturns(struct objtool_file *file)
+{
+	struct symbol *func;
+	char *buf, *pos;
+	size_t len = 0;
+	FILE *fp;
+
+	for_each_sym(file->elf, func) {
+		if (is_noreturn(func) && func->exported)
+			len += strlen(func->name) + 1;
+	}
+
+	buf = malloc(len + 1);
+	if (!buf) {
+		ERROR_GLIBC("malloc");
+		return -1;
+	}
+
+	pos = buf;
+	for_each_sym(file->elf, func) {
+		if (is_noreturn(func) && func->exported)
+			pos += sprintf(pos, "%s\n", func->name);
+	}
+
+	/*
+	 * Only write the file when the contents have change to avoid relinking
+	 * all the modules unnecessarily.
+	 */
+	if (!noreturns_changed(buf, len)) {
+		free(buf);
+		return 0;
+	}
+
+	fp = fopen(opts.noreturns_write, "w");
+	if (!fp) {
+		ERROR_GLIBC("fopen");
+		return -1;
+	}
+
+	if (fwrite(buf, 1, len, fp) != len) {
+		ERROR_GLIBC("fwrite");
+		return -1;
+	}
+
+	free(buf);
+
+	if (fclose(fp)) {
+		ERROR_GLIBC("fclose");
+		return -1;
+	}
+
+	return 0;
+}
+
+/*
+ * This is called for modules.  Read the noreturn list generated by the
+ * vmlinux.o pass and mark the corresponding undefined symbols noreturn.
+ */
+static int read_noreturns(struct objtool_file *file)
+{
+	char line[SYM_NAME_LEN];
+	struct symbol *func;
+	FILE *fp;
+
+	fp = fopen(opts.noreturns_read, "r");
+	if (!fp) {
+		ERROR("can't open '%s'", opts.noreturns_read);
+		return -1;
+	}
+
+	while (fgets(line, sizeof(line), fp)) {
+		line[strcspn(line, "\n")] = '\0';
+
+		func = find_global_symbol_by_name(file->elf, line);
+		if (func && is_undef_sym(func))
+			func->_noreturn = 1;
+	}
+
+	fclose(fp);
+	return 0;
+}
+
 static void init_cfi_state(struct cfi_state *cfi)
 {
 	int i;
@@ -2236,6 +2350,24 @@ static int add_jump_table_alts(struct objtool_file *file)
 	return 0;
 }
 
+static void read_exports(struct objtool_file *file)
+{
+	struct section *sec;
+	struct symbol *func;
+	struct reloc *reloc;
+
+	sec = find_section_by_name(file->elf, ".export_symbol");
+	if (!sec || !sec->rsec)
+		return;
+
+	for_each_reloc(sec->rsec, reloc) {
+		func = find_func_by_offset(reloc->sym->sec,
+					   reloc->sym->offset + reloc_addend(reloc));
+		if (func)
+			func->exported = 1;
+	}
+}
+
 static void set_func_state(struct cfi_state *state)
 {
 	state->cfa = initial_func_cfi.cfa;
@@ -2720,8 +2852,10 @@ int decode_file(struct objtool_file *file)
 	 * both validate_functions() and validate_noinstr_sections() -- and by
 	 * validate_unret().
 	 */
-	if (validate_branch_enabled() || opts.noinstr || opts.unret)
+	if (validate_branch_enabled() || opts.noinstr || opts.unret) {
+		read_exports(file);
 		detect_noreturns(file);
+	}
 
 	if (read_unwind_hints(file))
 		return -1;
@@ -4888,6 +5022,12 @@ int check(struct objtool_file *file)
 		objtool_disas_ctx = disas_ctx;
 	}
 
+	if (opts.noreturns_read) {
+		ret = read_noreturns(file);
+		if (ret)
+			goto out;
+	}
+
 	ret = decode_file(file);
 	if (ret)
 		goto out;
@@ -4995,6 +5135,12 @@ int check(struct objtool_file *file)
 			goto out;
 	}
 
+	if (opts.noreturns_write && !opts.dryrun) {
+		ret = write_noreturns(file);
+		if (ret)
+			goto out;
+	}
+
 	if (opts.stats) {
 		printf("nr_insns_visited: %ld\n", nr_insns_visited);
 		printf("nr_cfi: %ld\n", nr_cfi);
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index 349690bb1c50e..fb33d57a54c95 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -41,6 +41,8 @@ struct opts {
 	bool mnop;
 	bool module;
 	bool no_unreachable;
+	const char *noreturns_read;
+	const char *noreturns_write;
 	const char *output;
 	bool sec_address;
 	bool stats;
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index 0e3593d993ac8..adf6e1322c6df 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -100,6 +100,7 @@ struct symbol {
 	u8 fake		     : 1;
 	u8 _noreturn         : 1;
 	u8 ignore_noreturn   : 1;
+	u8 exported          : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 	struct section *group_sec;
-- 
2.55.0

