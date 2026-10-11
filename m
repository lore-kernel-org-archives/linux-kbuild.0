Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902921B3925
	for <linux-kbuild@vger.kernel.org>; Sun, 11 Oct 2026 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791738357; cv=none; b=pWvsLD9HYM0SL5z9L10ALbOBovTLNjWeT6PWBksrmyY+/oiK+EhpfmMZs4HN805eEWh4viosCU7NEkATo8+RejY/uWBb08EGr1WKWAureWwqQxmCxAEVS9XeslPs1JUxG6YHWbiiwz4QqpEqFWLtZIel2pKUSBf+E4xmIqZCXPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791738357; c=relaxed/simple;
	bh=8RZYaChaQ8LIw075ZN/N4BME0t7hJ3ZBejvx4QGteP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=llbEffgRSRsoNTh/zlgMnQKcGoRRGTOS9M3UNnjFwEQdHlxNPuo2pBwigfMlDOpFL+uavmeieA9pPORTvsbgpVrhyCe8KD3wv5653H8ScuBUXuVzteETnaAim9zAScqJl+WasTYZqvXQRX1Yz50pootiTHmxx/R2+HQPI2FnZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U078sj+g; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U078sj+g"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4248127eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Oct 2026 10:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791738356; x=1792343156; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pm3Wa1Z7MFnj1XbAx62ycxvPc+ZoCJq/e+x0Bt4y5cc=;
        b=U078sj+gpRsaBim91b/1mRHFfRI00da/mm5AFlyGDRi/py6wYT10EsTjrK3bNpmyK5
         maSJ0vbwvzvfPkUwFKa2FbwSzmgGStAZcV15YYPxPNVtGqKL66eZyE+dlgIFb5S1nVxX
         dxBw4WuWLo8LDtTW/4PvAceoe4v/dkHiosxCZK3yIe7RD4j4YYAftozbYQz2yV2BuGgV
         fagRhTOTc746ofhqnK7GcYNw+NhkZc8VwMiWyeIYoaLC9kzmicQNGnzJsVvY+o9fOC1l
         M6OmmLoeLE4JVRpnwBLiDlV6Ah1Vojihd6R3Dyi5fSN0a/OY+Au7VXCNq7Xl8u/xokMK
         +SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791738356; x=1792343156;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pm3Wa1Z7MFnj1XbAx62ycxvPc+ZoCJq/e+x0Bt4y5cc=;
        b=HCA8AnUlZqHF2S5P/c6DCXDxuTKmi9mwiZJyLFQBLKEiANv8ODzMqTu8UZzQ902u59
         lZ4LACKaRsL1BMnAQuVJWIjcmvlenu/gwHJcLKYAkwQyaoTos0lDIkj+KMqcwfbx6Hyw
         c/MuhGU5h1ZTWBVZHe3r7YgDfaRyhKNaU7v9hJmRNO4Q5n/m7iEJYMq03ALsG97Z5hN0
         A774uOfNE8Lltg73+4q4lcRKoJdRB332onkuJ2I5vUAYeOPnCHthRlyI9D5Q4ADDHJ8D
         A7QcjAE9DR6Ck/w4ppMDUPZw4jckwo2zWrsBZMb/kesSEXWdtO1PN6LXCo4WcBz323c1
         kFIw==
X-Gm-Message-State: AFq9FYKnIbv7gOv5fD6Def9sEsYNcd+RnKzm9pHIPnEappbJWYLQamWd
	cSKE6Eq5a6a/qHNrgxEHPCZuJUUOCG1bQtNOYTHmHqu2hGXleaKwcTaAHlSZQkk0
X-Gm-Gg: AYBFou0F539vqHQKKs3TAFrrlqD9QxiDfxPK6VSElltsju0z5WG4D9yUwIItXpUoi4K
	/21+41iBi8BiGiw3jPw7+rcXKOgdmf/ncB0g9iNBm5mM+w2wg7ATVyoECjNFqw24hL6mm7bL+8v
	Hxl/AcKX6R3MR6JyQAvKBoiGEmEjKswQP+oRQzL45xIrUoKfR9pDdTWc77U3Z/7sH5InpO1/XFx
	pRBHTb24XbvSqkWrQO1MUQFgzrEQPeUE3NecXccFEzp+zrGyQET76pJVvidVBzaIzSqIf8SkKpo
	nd5eqQLLBKVjsW14udSUXtdeoHPTwg3ZOuWQLFLmRQiSQdNHfK/j8/iEh4UEr4IFHyF6ILuaefs
	e85eQIj3/foC6X9RPZaws//VkuRdnWTNjnd9gFTCIiYYIaBaUIOkSUnDI9uKkV0tFYsQc1P+6lL
	cekdTbsjMYpwlovKX5WNAn3dcdXjihr5Il8hIkFuzYV3YtfLKM7TbjawN/qy3wpGuidSlb
X-Received: by 2002:a05:7301:700d:b0:35a:22a4:12d with SMTP id 5a478bee46e88-35a22a420d3mr1805689eec.25.1791738355205;
        Sun, 11 Oct 2026 10:05:55 -0700 (PDT)
Received: from gmail.com ([154.91.42.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm4619130eec.19.2026.10.11.10.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:05:54 -0700 (PDT)
Date: Sun, 11 Oct 2026 17:05:49 +0000
From: Zuo An <zuoan.penguin@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Julian Braha <julianbraha@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Subject: [PATCH v3] kconfig: show number of search results in search UI
Message-ID: <asvB7fchdB8lUkMc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When searching for config symbols, the search results popup
will now display a count of the results in the title bar,
e.g. "Search Results (42)". This helps the user to gauge the
number of matches quickly and refine their search if necessary,
instead of having to scroll down by an indefinite amount (especially
for nconfig's UI).

Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
---
Changes in v3:
- Fixed wrong subject line

Changes in v2:
- Addressed Sashiko review concerns (thanks Julian!)
- Fixed window title overflow in nconfig when no results are found

v1: https://lore.kernel.org/linux-kbuild/aspVmnam3QL_DRYV@gmail.com/
v2: https://lore.kernel.org/linux-kbuild/asvAfbLwV0lZBbyM@gmail.com/

 scripts/kconfig/lkc_proto.h |  2 +-
 scripts/kconfig/mconf.c     | 11 +++++++++--
 scripts/kconfig/nconf.c     | 11 +++++++++--
 scripts/kconfig/nconf.gui.c |  2 +-
 scripts/kconfig/qconf.cc    |  2 +-
 scripts/kconfig/symbol.c    |  4 +++-
 6 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 8914b4e8f2a8..224acc142769 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -21,7 +21,7 @@ bool conf_errors(void);
 struct symbol * sym_lookup(const char *name, int flags);
 struct symbol * sym_find(const char *name);
 void print_symbol_for_listconfig(struct symbol *sym);
-struct symbol ** sym_re_search(const char *pattern);
+struct symbol ** sym_re_search(const char *pattern, int *sym_cnt);
 const char * sym_type_name(enum symbol_type type);
 void sym_calc_value(struct symbol *sym);
 bool sym_dep_errors(void);
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index b8b7bba84a65..ebfc5bd09c1c 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -384,8 +384,10 @@ static void show_help(struct menu *menu)
 static void search_conf(void)
 {
 	struct symbol **sym_arr;
+	int sym_cnt = 0;
 	struct gstr res;
 	struct gstr title;
+	struct gstr res_title;
 	char *dialog_input;
 	int dres, vscroll = 0, hscroll = 0;
 	bool again;
@@ -422,7 +424,7 @@ static void search_conf(void)
 	stpart.text = str_get(&sttext);
 	list_add_tail(&stpart.entries, &trail);
 
-	sym_arr = sym_re_search(dialog_input);
+	sym_arr = sym_re_search(dialog_input, &sym_cnt);
 	do {
 		LIST_HEAD(head);
 		struct search_data data = {
@@ -433,9 +435,14 @@ static void search_conf(void)
 		jump_key_char = 0;
 		res = get_relations_str(sym_arr, &head);
 		set_subtitle();
-		dres = show_textbox_ext("Search Results", str_get(&res), 0, 0,
+
+		res_title = str_new();
+		str_printf(&res_title, "Search Results (%d)", sym_cnt);
+		dres = show_textbox_ext(str_get(&res_title), str_get(&res), 0, 0,
 					&vscroll, &hscroll,
 					handle_search_keys, &data);
+		str_free(&res_title);
+
 		again = false;
 		if (dres >= '1' && dres <= '9') {
 			assert(data.target != NULL);
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 521700ed7152..4c9c4ee7c3a7 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -700,8 +700,10 @@ static int do_exit(void)
 static void search_conf(void)
 {
 	struct symbol **sym_arr;
+	int sym_cnt = 0;
 	struct gstr res;
 	struct gstr title;
+	struct gstr res_title;
 	char *dialog_input;
 	int dres, vscroll = 0, hscroll = 0;
 	bool again;
@@ -732,7 +734,7 @@ static void search_conf(void)
 	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
 		dialog_input += strlen(CONFIG_);
 
-	sym_arr = sym_re_search(dialog_input);
+	sym_arr = sym_re_search(dialog_input, &sym_cnt);
 
 	do {
 		LIST_HEAD(head);
@@ -742,10 +744,15 @@ static void search_conf(void)
 		};
 		jump_key_char = 0;
 		res = get_relations_str(sym_arr, &head);
+
+		res_title = str_new();
+		str_printf(&res_title, "Search Results (%d)", sym_cnt);
 		dres = show_scroll_win_ext(main_window,
-				"Search Results", str_get(&res),
+				str_get(&res_title), str_get(&res),
 				&vscroll, &hscroll,
 				handle_search_keys, &data);
+		str_free(&res_title);
+
 		again = false;
 		if (dres >= '1' && dres <= '9') {
 			assert(data.target != NULL);
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 2d097bc7ef1a..5900eba0a512 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -523,7 +523,7 @@ int show_scroll_win_ext(WINDOW *main_window, const char *title, char *text,
 	int x, y, lines, columns;
 	int start_x = 0, start_y = 0;
 	int text_lines = 0, text_cols = 0;
-	int total_cols = 0;
+	int total_cols = get_line_length(title) + 4;
 	int win_cols = 0;
 	int win_lines = 0;
 	int i = 0;
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index b02ead7a3f98..8f51dc55226d 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1245,7 +1245,7 @@ void ConfigSearchWindow::search(void)
 	list->clear();
 	info->clear();
 
-	result = sym_re_search(editField->text().toLatin1());
+	result = sym_re_search(editField->text().toLatin1(), nullptr);
 	if (!result)
 		return;
 	for (p = result; *p; p++) {
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 7e81b3676ee9..31f927bd563a 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1020,7 +1020,7 @@ static int sym_rel_comp(const void *sym1, const void *sym2)
 	return strcmp(s1->sym->name, s2->sym->name);
 }
 
-struct symbol **sym_re_search(const char *pattern)
+struct symbol **sym_re_search(const char *pattern, int *sym_cnt)
 {
 	struct symbol *sym, **sym_arr = NULL;
 	struct sym_match *sym_match_arr = NULL;
@@ -1065,6 +1065,8 @@ struct symbol **sym_re_search(const char *pattern)
 			sym_arr[i] = sym_match_arr[i].sym;
 		sym_arr[cnt] = NULL;
 	}
+	if (sym_cnt)
+		*sym_cnt = cnt;
 sym_re_search_free:
 	/* sym_match_arr can be NULL if no match, but free(NULL) is OK */
 	free(sym_match_arr);
-- 
2.56.0

