Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7F65AEC70;
	Tue,  8 Sep 2026 20:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899682; cv=none; b=Nm6D0s87EzR3pomZrX43H+wp338RclJOJ7Q5ECLSHwViJbiXyAZa+ChzS3Zdkj/i5acSrBXnUCLqL3o7sRkzUdma2AL3P6+9A/6TtVKwQCWErz1O29HbmSL5ZfC/x4J/JUbrS8/LrSLfwHxoAwZFPGNvGWmwyTHIOsMJtdsi9Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899682; c=relaxed/simple;
	bh=hRU6NhdYCFsl5XoAt2Nc5lD9b0bBFgiRtJxaU0VhAv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3aFS2aICls1n3rlvydizbxxDhZ6l4MclB8KDV/lhcKZcOW5D8ejYcq/W9SjLX24u+u0Y16BKtTZfHh1wqMkSCgECcVNhvvQREsX6Sj1QNYgrR8oQ76yA1qqMQuNBvndm4OSrqg9nh+QfFeohoOz1zZ04utfNYJ0u0FaVjMFRoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWi460V0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWi460V0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37441F01559;
	Tue,  8 Sep 2026 20:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899680;
	bh=YmKQvK5oulGxXy2MnMSFqxgKoUFyKNju51vRYceZ06U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PWi460V0LZhVMy+m7Mj/oX3DwgaTMqemF0eZMdg8ZpaeOQJI6YcMt8llSa9lnmYmV
	 UAy4gw65VuojQfoNwm/DUWNBbNgIeuWWmO6v8K2rOeFmtP3RuHhRF3TVnzWCdxe26u
	 NS2gmaq22Vs5a7eT4bgkyJAT9COryy6vuK0lX4W2skj2Whbu+3Si+Ep4R8tb5tGJpT
	 esjj/A66aUJoRcxQSYWebhTBCss31mFd6D4zjBshwvY96yONg3GMqY3e2bLrboba4G
	 gSCooUj2ApX/ZYi1ZrLdzfFTUil9rucBHuuJZFI91VxZ4dwSz8XlPiTM9XXbanQaOj
	 1pnVQW66x++Hg==
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
Subject: [PATCH v2 22/27] objtool: Add options to write/read exported noreturns to/from a file
Date: Tue,  8 Sep 2026 13:33:34 -0700
Message-ID: <5ab9be6529942121f734b9e023f6708885a27592.1788899473.git.jpoimboe@kernel.org>
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
index 41df5f608535f..b572b9ce6ada9 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -341,6 +341,120 @@ static void detect_noreturns(struct objtool_file *file)
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
@@ -2238,6 +2352,24 @@ static int add_jump_table_alts(struct objtool_file *file)
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
@@ -2722,8 +2854,10 @@ int decode_file(struct objtool_file *file)
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
@@ -4889,6 +5023,12 @@ int check(struct objtool_file *file)
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
@@ -4996,6 +5136,12 @@ int check(struct objtool_file *file)
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

