Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:61469 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752804Ab1GNTbV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 Jul 2011 15:31:21 -0400
Received: by yia27 with SMTP id 27so255448yia.19
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jul 2011 12:31:20 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kconfig: fix missing "0x" prefix from S_HEX symbol in autoconf.h
Date: Thu, 14 Jul 2011 15:31:07 -0400
Message-Id: <1310671867-5107-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, Mauro Carvalho Chehab <mchehab@infradead.org>

The specialized printer for headers (espectially autoconf.h) is missing fixup
code for S_HEX symbol's "0x" prefix. As long as kconfig does not warn for such
missing prefix, this code is needed. Fix this.

In the same time, fix some nits in `header_print_symbol()'.

Cc: Randy Dunlap <rdunlap@xenotime.net>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>

Broken-by: Arnaud Lacombe <lacombar@gmail.com>
(Somehow-)Reported-by: Randy Dunlap <rdunlap@xenotime.net>
Reported-by: Mauro Carvalho Chehab <mchehab@infradead.org>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/confdata.c |   26 +++++++++++++++++++++-----
 1 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index be6952c..df629ec 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -487,27 +487,43 @@ static struct conf_printer kconfig_printer_cb =
 static void
 header_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 {
-	const char *suffix = "";
 
 	switch (sym->type) {
 	case S_BOOLEAN:
-	case S_TRISTATE:
+	case S_TRISTATE: {
+		const char *suffix = "";
+
 		switch (*value) {
 		case 'n':
 			return;
 		case 'm':
 			suffix = "_MODULE";
-			/* FALLTHROUGH */
+			/* fall through */
 		default:
 			value = "1";
 		}
+		fprintf(fp, "#define %s%s%s %s\n",
+		    CONFIG_, sym->name, suffix, value);
+		break;
+	}
+	case S_HEX: {
+		const char *prefix = "";
+
+		if (value[0] != '0' || (value[1] != 'x' && value[1] != 'X'))
+			prefix = "0x";
+		fprintf(fp, "#define %s%s %s%s\n",
+		    CONFIG_, sym->name, prefix, value);
+		break;
+	}
+	case S_STRING:
+	case S_INT:
+		fprintf(fp, "#define %s%s %s\n",
+		    CONFIG_, sym->name, value);
 		break;
 	default:
 		break;
 	}
 
-	fprintf(fp, "#define %s%s%s %s\n",
-	    CONFIG_, sym->name, suffix, value);
 }
 
 static void
-- 
1.7.3.4.574.g608b.dirty

