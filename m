Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1995A43B4B3
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Oct 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791645090; cv=none; b=qW/Ope+6C72mw7GLeDAxEZWLlIRc7VaG0yyJClCzMfkpGAK3FjPSCA4+dm4DyvbCQ4QT192U3IQsOsLm4Wpkede+rwUglBPqZUe1oJIZKFkuYS7Qbud7c2zJ7m5uGTt/rPS42e/JrEm+6uXnTXx1RGEzdC/sbI0DkXa5eAzAGZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791645090; c=relaxed/simple;
	bh=ySFMmnG03VyCVo++5cjAql0XF8iCPLMUx2K9YgY79NU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bRzD8Vd8ERpBjiYiiypX4lDk3d6C1WIIya9AxC+0uRg3+79nd+LGHgTuN/tFjnwJQ4Dqf1JFhFQramlLMpfW+kWy6Edjl4dur5t+iHtaemr8DIyHxZaxvcTPbOT2f9cE2eIa2kiGn94Zev37+elZ5PpS6QdmORdxJWk5bFnxNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKvUJhTG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKvUJhTG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e618db81c0so5170635ad.2
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Oct 2026 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791645088; x=1792249888; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X+Q9LbgNCTDZTRZJ4kWRD2cLuOCk5g/aCYKk+DvIeA=;
        b=jKvUJhTGOLbJEYN+x1680kwoKvwO7EYhQ3UkbcI3stii8ZdTcOzYfd7C8bPatkqX1q
         CPTvZTh4G9K2Di0RnMhdGmV1U2VH2bvPdTawde6PYvF4bzV7ad9qmVw5TZI6j/NT12Mq
         tT7+cdy1YKJ1ZVbTnPJc3Wwk7VMN1yEF/4dWlJnWxgCQvElFRAOKSOensPGpkSWkm3tJ
         356Z3Ys3aZMybSAcXD3J/3wf1dylg6Vdjg2D0vHzIUsOY1apBNDb1m8RPFRviD83wT+7
         rrBBgp7rRLMZiDi1SZeLA9NkBvkwmPKm+PV35x3GSTp9R/lRmCdIlwSQ7uL40USOLO/f
         g07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791645088; x=1792249888;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9X+Q9LbgNCTDZTRZJ4kWRD2cLuOCk5g/aCYKk+DvIeA=;
        b=t39dvgBOty1F0WxtGrh9uxkx32po+/cuw5ilJYLP4HkKym1beW+1Gd6I6NFePhGhCu
         282YV0rzVQsntBrajW8D7nLt42Dt/J6BctOq3UFpZXNQoo043vuqGeg6AEvzPu5NlFZJ
         Kr2x7kT7RYa4qxvOVtrcA4hrSjZulxn7CPSNOH6DsGT3SmuS2MviE3L22zuejYxCVSha
         GhYDLNO05UDwnGxnYr3WBCrh16XdLFt8MEmIgw0DJn2TV2zWUkut8WUvws0JxEMu+7uU
         BzdSHRYV8Lo6/FUOpiHRTXrNyAfrwABqX0Gk1asPEtBWEEqJZTB7NN22K8ZDpf4NXBJZ
         eU/g==
X-Gm-Message-State: AFq9FYKEuy6fEiALfeYH+f5ACI3MNLJ7yKE9J/gUZJGlaJ0IFh4JL3UF
	yN1ixHLuUkFhmm6jN/sjxObbZ1npBpNsrkvgUfv7VvNgP/rIlMH3XW/UqufTAqbX
X-Gm-Gg: AYBFou2HNAcSF5DQeUjZhDqoFSam4Q3/DfEkjji+1AlfaNZvjJh5KY+N6a569hanwag
	FYGgJfqssQs34VVqOi8Bf3Z62S01anfcHYGJFn0tx6zifDFkNatn2t8OVA1s7IneEpABmYb9Koi
	13FppxcT6ivYPco74ekwF0pfPsmQfC1TGQsowG3ePFRSPVf0aCcwK0VYN0RWpjnzLmhJaGr1/7+
	bkYGkiNkmIaKn4PZa/wiNzlpMDYG5kiivfHNYU0rO/DSp+xR74nfFQ62ZSCXkeozdv5lrRMDeoZ
	nDiJnDbRg5hpQwfImcfDJ79Zbn2LUTBLKO4Wm583vooF3u+oDdMWZ1xLvx8Nws1gxeOmK3MxHpG
	CIhRnQN7VTba3UEAiWmWmtDDYJfMId0n3mAKOYXeQTpIwrwlNTP9pCE23kpnPLKihLsF7oOmkQS
	QTiscVTqlqTmtm0CJNoLw4G/u9tqC7SY1NF7bkTBpG9+ffB0Og97DB7axLojml2y3fwj0x
X-Received: by 2002:a17:902:f789:b0:2e2:e61d:85ec with SMTP id d9443c01a7336-2e842f34e0cmr40929785ad.54.1791645088257;
        Sat, 10 Oct 2026 08:11:28 -0700 (PDT)
Received: from gmail.com ([154.91.42.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4eb2sm24087245ad.74.2026.10.10.08.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:11:27 -0700 (PDT)
Date: Sat, 10 Oct 2026 15:11:22 +0000
From: Zuo An <zuoan.penguin@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: show number of search results in search UI
Message-ID: <aspVmnam3QL_DRYV@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When searching for symbols in nconfig/menuconfig, the search
results popup will now display a count of the results
in the title bar, e.g. "Search Results (42)".

This helps the user to gauge the number of matches quickly and
refine their search if needed, rather than having to scroll down
by an indefinite amount (especially for nconfig's UI which lacks
a display of the scrolling progress).

Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
---
 scripts/kconfig/lkc_proto.h |  2 +-
 scripts/kconfig/mconf.c     | 10 ++++++++--
 scripts/kconfig/nconf.c     | 10 ++++++++--
 scripts/kconfig/qconf.cc    |  2 +-
 scripts/kconfig/symbol.c    |  4 +++-
 5 files changed, 21 insertions(+), 7 deletions(-)

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
index b8b7bba84a65..f37c3f8e1f4d 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -384,8 +384,10 @@ static void show_help(struct menu *menu)
 static void search_conf(void)
 {
 	struct symbol **sym_arr;
+	int sym_cnt;
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
@@ -433,9 +435,13 @@ static void search_conf(void)
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
+
 		again = false;
 		if (dres >= '1' && dres <= '9') {
 			assert(data.target != NULL);
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 521700ed7152..e3b25940b931 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -700,8 +700,10 @@ static int do_exit(void)
 static void search_conf(void)
 {
 	struct symbol **sym_arr;
+	int sym_cnt;
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
@@ -742,10 +744,14 @@ static void search_conf(void)
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
+
 		again = false;
 		if (dres >= '1' && dres <= '9') {
 			assert(data.target != NULL);
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

