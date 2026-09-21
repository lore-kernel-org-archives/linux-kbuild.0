Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DBE52ED5B;
	Mon, 21 Sep 2026 22:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029911; cv=none; b=qGBhzVk7VeF+zVSz+bmkDhddYbZFi/UAYVMaCczXgKiuBL3+VLjBKrePKbEgLeDL26CIquybyEAFxpc+vW1sq23lE8aJzdVZAXiZp8sQymnb+4Utl7lqO3H0QMPd24IuYmT9cJB2sthK25N/qIIGspl0FFelr70ZDX+YiLIADGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029911; c=relaxed/simple;
	bh=TdVCUqyinINerC/w92CWPYR+FKlQORAiJSqM2nlGQ9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1BIRrmhf7bxMjLknlAH2c0NNL7bk6xqqpHdkFJwR2PXC2/lzh3eL4tu9qewEnp6SCgEVpug4APJu8SsPJ0nqpMjGbV1cUbPhtRm40Udq2V55FacJXRoEbc7pCkvSY650kuHl9xQECAtGzXsWZ1NOJlePV5i862Ra5L6fEc0Ec0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8vGoTGv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8vGoTGv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2601F00898;
	Mon, 21 Sep 2026 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029909;
	bh=qa9+08QLfw1v9XrtSyOcFjJO1tnt+M+hWXxgBwEsj9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B8vGoTGvSKQGaBWIty2WpKlC2Fh6JxkJOHCs8MuuuKwerfylLW1DtypV5L6Z0S3dk
	 j1mc5G5QEN4vQJkCChptD1gTOe36iyu1/uXJkoeRrtai8x8dDuLOtMncgQ+anOwC/v
	 nJW8Z2vLcPZgJ04mxmweKfzjg6tpL6rE/Q5mtiTs47UbjViC39YzT0gpkigwbcwQtA
	 Eqfif9k9aaN5CwxJzXiYfOPsZ71Yc7Y4QykEzARAqjPL+SLU+ZVSr/LiaUWXiB73mP
	 vGREON+Z8kR3K1aqRtoa5OFOpX1KX2+2gbc2TuSl6p0svYYvnRsQQ8xYqa1KI595kp
	 JfsNPXFl+Arhg==
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
Subject: [PATCH v3 22/28] objtool: Add options to write/read exported noreturns to/from a file
Date: Mon, 21 Sep 2026 15:31:23 -0700
Message-ID: <ee9a89f3c8990d2af8f5f8345680a1223e1639f0.1790028654.git.jpoimboe@kernel.org>
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

Add --noreturns-write which can be used to write vmlinux's exported
noreturns to a file, and --noreturn-read which can be used to read them
when running objtool on a module.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/builtin-check.c           |  12 ++
 tools/objtool/check.c                   | 143 +++++++++++++++++++++++-
 tools/objtool/include/objtool/builtin.h |   2 +
 tools/objtool/include/objtool/elf.h     |   1 +
 4 files changed, 157 insertions(+), 1 deletion(-)

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
index 41df5f608535f..29ef2dc678833 100644
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
@@ -2238,6 +2352,19 @@ static int add_jump_table_alts(struct objtool_file *file)
 	return 0;
 }
 
+static void read_exports(struct objtool_file *file)
+{
+	struct section *sec;
+	struct reloc *reloc;
+
+	sec = find_section_by_name(file->elf, ".export_symbol");
+	if (!sec || !sec->rsec)
+		return;
+
+	for_each_reloc(sec->rsec, reloc)
+		reloc->sym->exported = 1;
+}
+
 static void set_func_state(struct cfi_state *state)
 {
 	state->cfa = initial_func_cfi.cfa;
@@ -2722,8 +2849,10 @@ int decode_file(struct objtool_file *file)
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
@@ -4889,6 +5018,12 @@ int check(struct objtool_file *file)
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
@@ -4996,6 +5131,12 @@ int check(struct objtool_file *file)
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

