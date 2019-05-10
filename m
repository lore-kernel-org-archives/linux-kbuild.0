Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44275 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbfEJT24 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 15:28:56 -0400
Received: by mail-pg1-f194.google.com with SMTP id z16so3456189pgv.11
        for <linux-kbuild@vger.kernel.org>; Fri, 10 May 2019 12:28:55 -0700 (PDT)
Date: Fri, 10 May 2019 13:28:52 -0600
From: Jacob Garber <jgarber1@ualberta.ca>
Subject: [PATCH] kconfig: use snprintf for formatting pathnames
Message-ID: <20190510192852.4dwfeicp3ebv3epm@ualberta.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Jacob Garber <jgarber1@ualberta.ca>

Valid pathnames will never exceed PATH_MAX, but these file names
are unsanitized and can cause buffer overflow if set incorrectly.
Use snprintf to avoid this. This was flagged during a Coverity scan
of the coreboot project, which also uses kconfig for its build system.

Signed-off-by: Jacob Garber <jgarber1@ualberta.ca>
---
 scripts/kconfig/confdata.c | 7 ++++---
 scripts/kconfig/lexer.l    | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 08ba146a8..847fe428a 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -194,7 +194,7 @@ char *conf_get_default_confname(void)
 	name = expand_string(conf_defname);
 	env = getenv(SRCTREE);
 	if (env) {
-		sprintf(fullname, "%s/%s", env, name);
+		snprintf(fullname, sizeof(fullname), "%s/%s", env, name);
 		if (is_present(fullname))
 			return fullname;
 	}
@@ -843,10 +843,11 @@ int conf_write(const char *name)
 	} else
 		basename = conf_get_configname();
 
-	sprintf(newname, "%s%s", dirname, basename);
+	snprintf(newname, sizeof(newname), "%s%s", dirname, basename);
 	env = getenv("KCONFIG_OVERWRITECONFIG");
 	if (!env || !*env) {
-		sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
+		snprintf(tmpname, sizeof(tmpname),
+			 "%s.tmpconfig.%d", dirname, (int)getpid());
 		out = fopen(tmpname, "w");
 	} else {
 		*tmpname = 0;
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index c9df1c8b9..6354c905b 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -378,7 +378,8 @@ FILE *zconf_fopen(const char *name)
 	if (!f && name != NULL && name[0] != '/') {
 		env = getenv(SRCTREE);
 		if (env) {
-			sprintf(fullname, "%s/%s", env, name);
+			snprintf(fullname, sizeof(fullname),
+				 "%s/%s", env, name);
 			f = fopen(fullname, "r");
 		}
 	}
-- 
2.21.0
