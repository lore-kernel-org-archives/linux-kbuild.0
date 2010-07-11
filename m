Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:58087 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754191Ab0GKSRv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Jul 2010 14:17:51 -0400
Date: Sun, 11 Jul 2010 20:17:45 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH 1/1] kconfig: Fix ignoring return value warning
In-Reply-To: <20100709213909.GB25647@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1007112015260.4741@pobox.suse.cz>
References: <20100709213909.GB25647@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jean Sacren <sakiwit@gmail.com>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

Hi Jean,

adding Michal (current kbuild maintainer) and linux-kbuild to CC. Thanks.



From: Jean Sacren <sakiwit@gmail.com>
Date: Fri, 9 Jul 2010 13:02:50 -0600
Subject: [PATCH 1/1] kconfig: Fix ignoring return value warning

This fix takes care of fwrite() either when it succeeds with writing or
when an error occurs. Also more aesthetic syntax is entered for infinite
loops.

Signed-off-by: Jean Sacren <sakiwit@gmail.com>
---
 scripts/kconfig/confdata.c |   22 +++++++++++++++++-----
 scripts/kconfig/lkc.h      |    1 +
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c4dec80..c6871d9 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -502,10 +502,10 @@ int conf_write(const char *name)
 			case S_STRING:
 				str = sym_get_string_value(sym);
 				fprintf(out, "CONFIG_%s=\"", sym->name);
-				while (1) {
+				for (;;) {
 					l = strcspn(str, "\"\\");
 					if (l) {
-						fwrite(str, l, 1, out);
+						xfwrite(str, l, 1, out);
 						str += l;
 					}
 					if (!*str)
@@ -753,11 +753,11 @@ int conf_write_autoconf(void)
 			str = sym_get_string_value(sym);
 			fprintf(out, "CONFIG_%s=\"", sym->name);
 			fprintf(out_h, "#define CONFIG_%s \"", sym->name);
-			while (1) {
+			for (;;) {
 				l = strcspn(str, "\"\\");
 				if (l) {
-					fwrite(str, l, 1, out);
-					fwrite(str, l, 1, out_h);
+					xfwrite(str, l, 1, out);
+					xfwrite(str, l, 1, out_h);
 					str += l;
 				}
 				if (!*str)
@@ -926,3 +926,15 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 		csym->flags &= ~(SYMBOL_VALID);
 	}
 }
+/*
+ * Helper function to facilitate fwrite() by Jean Sacren.
+ */
+void xfwrite(xstr, len, count, output)
+	const void *xstr;
+	size_t len;
+	size_t count;
+	FILE *output;
+{
+	if (fwrite(xstr, len, count, output) < count)
+		fprintf(stderr, "\nError in writing.\n");
+}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index ce6549c..7d7061a 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -79,6 +79,7 @@ char *conf_get_default_confname(void);
 void sym_set_change_count(int count);
 void sym_add_change_count(int count);
 void conf_set_all_new_symbols(enum conf_def_mode mode);
+void xfwrite(const void *xstr, size_t len, size_t count, FILE *output);
 
 /* kconfig_load.c */
 void kconfig_load(void);

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
