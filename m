Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:33675 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756408Ab0HDWDH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Aug 2010 18:03:07 -0400
Received: by pxi14 with SMTP id 14so2226100pxi.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Aug 2010 15:03:06 -0700 (PDT)
Date: Wed, 4 Aug 2010 16:03:16 -0600
From: Jean Sacren <sakiwit@gmail.com>
Subject: [PATCH 2/2] kconfig: Fix warning: ignoring return value of 'fgets'
Message-ID: <20100804220316.GA10547@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jiri Kosina <jkosina@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

This fix facilitates fgets() either it returns on success or on error or
when end of file occurs.

Signed-off-by: Jean Sacren <sakiwit@gmail.com>
Cc: stable <stable@kernel.org>
---
 scripts/kconfig/conf.c |   15 +++++++++++++--
 scripts/kconfig/lkc.h  |    3 +++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 9960d1c..692d459 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -102,7 +102,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 		check_stdin();
 	case ask_all:
 		fflush(stdout);
-		fgets(line, 128, stdin);
+		xfgets(line, 128, stdin);
 		return 1;
 	default:
 		break;
@@ -304,7 +304,7 @@ static int conf_choice(struct menu *menu)
 			check_stdin();
 		case ask_all:
 			fflush(stdout);
-			fgets(line, 128, stdin);
+			xfgets(line, 128, stdin);
 			strip(line);
 			if (line[0] == '?') {
 				print_help(menu);
@@ -615,3 +615,14 @@ int main(int ac, char **av)
 	}
 	return 0;
 }
+/*
+ * Helper function to facilitate fgets() by Jean Sacren.
+ */
+void xfgets(str, size, in)
+	char *str;
+	int size;
+	FILE *in;
+{
+	if (fgets(str, size, in) == NULL)
+		fprintf(stderr, "\nError in reading or end of file.\n");
+}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 90fe55a..c9bd96f 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -72,6 +72,9 @@ void zconf_nextfile(const char *name);
 int zconf_lineno(void);
 char *zconf_curname(void);
 
+/* conf.c */
+void xfgets(char *str, int size, FILE *in);
+
 /* confdata.c */
 const char *conf_get_configname(void);
 const char *conf_get_autoconfig_name(void);
-- 
1.7.1
