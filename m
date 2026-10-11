Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8592FD7C3
	for <linux-kbuild@vger.kernel.org>; Sun, 11 Oct 2026 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791737990; cv=none; b=orQCmvXepG5lutNEvG0A690qCWGr7Y3tP0wgu0CaTPiRqQcwgPMp6mrf8rF1aI6Ae9SS0QHtzOSSEGBuo1OzcdoJV7vwFidVpPg/2UEAaTR/FSYCGfyIWC+c3fFTkyPbpW5bN09nUUlGUHPs2WbD3rH3/fQ96m9C1vIuc9W5AcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791737990; c=relaxed/simple;
	bh=ZXRQKpKDBBTAUMAq0zXiY/UbRtYOd2wFovXtafSWxJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RKCuoRnUgn1QQr2SP30tAAScJAFDwdtY2cJLRE1fhejjoumo8GIKeyrUwqM0u1kreTnJVm5fYUsHGYcaGCYQOdrm2AVGhwJQ5H0zVYCqpQZ1E6ZtdqO4PQLx0tBWjV2WM2XnU85QXvpr0vP5sBar8aC6A6QFmw/e/Sg3HErln9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbVASIck; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbVASIck"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso2069422eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Oct 2026 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791737987; x=1792342787; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIbIutFr6kYcdW/vTCkwSVA4sWmZ9AaV7+PbR/7n8nE=;
        b=WbVASIckMESnnYBiu+X6nwOroVLdzBSkpkAiJu16Wt/b+vOMZ48aJ4gVkQDxQuyFYh
         WSMUUJbdW0J/4tT7ClmRoajWUiCDnnKbmAtPn+OHHjZ8+DJ5Lvqf+yk9OhlhlriPKjf9
         CQlAfWhI0/u4bhZcRnUZq0ZDVzfiFLJ5pViviZr/i0ecdoySDnS37XPLSd2RdnnBcnV3
         s6UxIbr3Brvr6oLEWIY/2e3pPdInMkh55Wtolw5DEMFx1vDIocKbGfKQz57OJ66Qwf0/
         V4lZRBOugTaokFnemnoSU/IXc02biZmJr78TW00I9wY6+fXBDmbbvvFjNywBwzRH7BV+
         EWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791737987; x=1792342787;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIbIutFr6kYcdW/vTCkwSVA4sWmZ9AaV7+PbR/7n8nE=;
        b=C50aBAlqc/WNJvZKxe95pt1gNuUgd+/wA1BYiZAJOBoxSszyoxTfRDHKO4bWAEZe2b
         3Ir6NiziBslXQr29W/GqJqdBqQIWU8rVPRAGfmFCE+EWATelFAdS8Neudto5Ec/4xE2c
         BCJeYlGbnKJf0Qt9WY5caMYIq6kRzQdlSE32aK8Efst0V5g+TM3Hez6AHOLe9nUteHV/
         7Ysk9HBSYp242A/5ELZ8BbBCrfSj+BW5n7xXNlzNc5XoOxTxZhGKmZG6wXdl84CGSpgb
         D02FaXNinzbKu6x0PBS7iI5OO2xL3vzo+2OG39Iuh6c9CWmUnca8AeZ77kRkDyZQQw/1
         9Krw==
X-Gm-Message-State: AFq9FYIJ4ivXotwcfbcZr5M2cczIxjWJUE5h9byXXAIbCy+KzYl86VRf
	GSy5m5FKbsx5iyoqPe+9ZhNrkI9V4FiZvwsCifrdVMBJuZgwwSRa/S07iR/5hCPXc3Y=
X-Gm-Gg: AYBFou1AVpLaZOYWO7FzgR4dpH6gQCVjGfG02HAcVQosakX6tDQ73qtMJv1CZLXGrTS
	DW+sJHXzLSQjkj0Fjed1Iv7iDar0MlnUG6aP5rdVLgQnnNP1ih20vC/30ypHtorkmAE3gjY96P0
	Q3Mo1UYwRfMlTg8Txv5Wm9asFT0NEjYVy6tnMZV/BYVY2a3Cf7D/mDvbhhPlRLJ+HS4D9wNJCM8
	lZR9BrjXK29hjXNgo2tVoWyO3Pn5Gmp6VAJRxGBfla9gdG5Wpf4QsAFeNnfOpdLmJGw7SyBwuBI
	xcusaaGBDDpFEjJ64E4k3fL/MxHqqO62hSonkH+otWydN24IGuHLXLhJ8LUzmgOBk0cY+vbYwnl
	CdtQ2paSH3A+3piuKgeae4iAU7EKRnKacznd29r6sVvFaPVzaXVvV/5NtuOFivK/IzWiyZKG9A3
	7bE6DuLrB4bOmc/xQ1c60AO08kYfxF2zdsKUILJ7NBwotkDarI3gc12tHSMDInh1JQ2j1Y
X-Received: by 2002:a05:7301:f24:b0:351:595:750b with SMTP id 5a478bee46e88-3537e2964f7mr11658372eec.36.1791737987050;
        Sun, 11 Oct 2026 09:59:47 -0700 (PDT)
Received: from gmail.com ([154.91.42.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-359789fde97sm9052902eec.20.2026.10.11.09.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:59:46 -0700 (PDT)
Date: Sun, 11 Oct 2026 16:59:41 +0000
From: Zuo An <zuoan.penguin@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: Julian Braha <julianbraha@gmail.com>, linux-kernel@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Subject: [PATCH v2] kconfig: show number of search results in
 nconfig/menuconfig/xconfig
Message-ID: <asvAfbLwV0lZBbyM@gmail.com>
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
Changes in v2:
- Addressed Sashiko review concerns (thanks Julian!)
- Fixed window title overflow in nconfig when no results are found

v1: https://lore.kernel.org/linux-kbuild/aspVmnam3QL_DRYV@gmail.com/

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

