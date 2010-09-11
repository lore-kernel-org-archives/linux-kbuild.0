Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:53064 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPyD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:54:03 -0400
Received: by mail-gw0-f46.google.com with SMTP id 17so1555732gwj.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:54:02 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 07/15] kconfig: add a symbol string expansion helper
Date: Sat, 11 Sep 2010 11:51:14 -0400
Message-Id: <1284220282-3500-8-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/lkc_proto.h |    1 +
 scripts/kconfig/symbol.c    |   49 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 9a948c9..4531bad 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -28,6 +28,7 @@ P(symbol_hash,struct symbol *,[SYMBOL_HASHSIZE]);
 
 P(sym_lookup,struct symbol *,(const char *name, int flags));
 P(sym_find,struct symbol *,(const char *name));
+P(sym_expand_string_value,const char *,(const char *in));
 P(sym_re_search,struct symbol **,(const char *pattern));
 P(sym_type_name,const char *,(enum symbol_type type));
 P(sym_calc_value,void,(struct symbol *sym));
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 943712c..dc5dcf2 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -840,6 +840,55 @@ struct symbol *sym_find(const char *name)
 	return symbol;
 }
 
+/*
+ * Expand symbol's names embedded in the string given in argument. Symbols'
+ * name to be expanded shall be prefixed by a '$'. Unknown symbol expands to
+ * the empty string.
+ */
+const char *sym_expand_string_value(const char *in)
+{
+	const char *src;
+	char *res;
+	size_t reslen;
+
+	reslen = strlen(in) + 1;
+	res = malloc(reslen);
+	res[0] = '\0';
+
+	while ((src = strchr(in, '$'))) {
+		char *p, name[SYMBOL_MAXLENGTH];
+		const char *symval = "";
+		struct symbol *sym;
+		size_t newlen;
+
+		strncat(res, in, src - in);
+		src++;
+
+		p = name;
+		while (isalnum(*src) || *src == '_')
+			*p++ = *src++;
+		*p = '\0';
+
+		sym = sym_find(name);
+		if (sym != NULL) {
+			sym_calc_value(sym);
+			symval = sym_get_string_value(sym);
+		}
+
+		newlen = strlen(res) + strlen(symval) + strlen(src);
+		if (newlen > reslen) {
+			reslen = newlen;
+			realloc(res, reslen);
+		}
+
+		strcat(res, symval);
+		in = src;
+	}
+	strcat(res, in);
+
+	return res;
+}
+
 struct symbol **sym_re_search(const char *pattern)
 {
 	struct symbol *sym, **sym_arr = NULL;
-- 
1.7.2.30.gc37d7.dirty

