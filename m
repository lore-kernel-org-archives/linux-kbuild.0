Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:59909 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751686Ab0HDWAz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Aug 2010 18:00:55 -0400
Received: by pvc7 with SMTP id 7so2227348pvc.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Aug 2010 15:00:54 -0700 (PDT)
Date: Wed, 4 Aug 2010 16:01:02 -0600
From: Jean Sacren <sakiwit@gmail.com>
Subject: [PATCH 1/2] kconfig: Fix warning: ignoring return value of 'fwrite'
Message-ID: <20100804220102.GA10534@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jiri Kosina <jkosina@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

This fix facilitates fwrite() in both confdata.c and expr.c, either it
succeeds in writing, or an error occurs, or the end of file is reached.

Signed-off-by: Jean Sacren <sakiwit@gmail.com>
Cc: stable <stable@kernel.org>
---
 scripts/kconfig/confdata.c |    6 +++---
 scripts/kconfig/expr.c     |    2 +-
 scripts/kconfig/lkc.h      |    7 +++++++
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c4dec80..0fe158c 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -505,7 +505,7 @@ int conf_write(const char *name)
 				while (1) {
 					l = strcspn(str, "\"\\");
 					if (l) {
-						fwrite(str, l, 1, out);
+						xfwrite(str, l, 1, out);
 						str += l;
 					}
 					if (!*str)
@@ -756,8 +756,8 @@ int conf_write_autoconf(void)
 			while (1) {
 				l = strcspn(str, "\"\\");
 				if (l) {
-					fwrite(str, l, 1, out);
-					fwrite(str, l, 1, out_h);
+					xfwrite(str, l, 1, out);
+					xfwrite(str, l, 1, out_h);
 					str += l;
 				}
 				if (!*str)
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index d83f232..b5c47e1 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1087,7 +1087,7 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 
 static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
 {
-	fwrite(str, strlen(str), 1, data);
+	xfwrite(str, strlen(str), 1, data);
 }
 
 void expr_fprint(struct expr *e, FILE *out)
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index ce6549c..90fe55a 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -80,6 +80,13 @@ void sym_set_change_count(int count);
 void sym_add_change_count(int count);
 void conf_set_all_new_symbols(enum conf_def_mode mode);
 
+/* confdata.c and expr.c */
+static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
+{
+	if (fwrite(str, len, count, out) < count)
+		fprintf(stderr, "\nError in writing or end of file.\n");
+}
+
 /* kconfig_load.c */
 void kconfig_load(void);
 
-- 
1.7.1
