Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:41825 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfE0OiN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 10:38:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/5] kconfig: require the argument of --defconfig
Date: Mon, 27 May 2019 23:37:22 +0900
Message-Id: <20190527143725.12542-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190527143725.12542-1-yamada.masahiro@socionext.com>
References: <20190527143725.12542-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Currently, the argument for --defconfig is optional. If the argument
is not passed, the hard-coded default arch/$(ARCH)/defconfig is used.

It no longer happens in Linux since the last users of the default are
gone by the following commits:

- Commit f3e20ad67b4c ("s390: move arch/s390/defconfig to
  arch/s390/configs/defconfig")

- Commit 986a13769c4b ("alpha: move arch/alpha/defconfig to
  arch/alpha/configs/defconfig")

I want to kill the Linux-specific directory path embedded in the
Kconfig binary.

The --savedefconfig (reverse operation of --defconfig) requires an
argument, so it should not hurt to do likewise for --defconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c     |  4 +---
 scripts/kconfig/confdata.c | 17 -----------------
 scripts/kconfig/lkc.h      |  1 -
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index ef3678c24bab..0d4c4f3a8f29 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -451,7 +451,7 @@ static struct option long_opts[] = {
 	{"oldaskconfig",    no_argument,       NULL, oldaskconfig},
 	{"oldconfig",       no_argument,       NULL, oldconfig},
 	{"syncconfig",      no_argument,       NULL, syncconfig},
-	{"defconfig",       optional_argument, NULL, defconfig},
+	{"defconfig",       required_argument, NULL, defconfig},
 	{"savedefconfig",   required_argument, NULL, savedefconfig},
 	{"allnoconfig",     no_argument,       NULL, allnoconfig},
 	{"allyesconfig",    no_argument,       NULL, allyesconfig},
@@ -562,8 +562,6 @@ int main(int ac, char **av)
 
 	switch (input_mode) {
 	case defconfig:
-		if (!defconfig_file)
-			defconfig_file = conf_get_default_confname();
 		if (conf_read(defconfig_file)) {
 			fprintf(stderr,
 				"***\n"
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 6006154d36bd..18e8051d89d7 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -177,8 +177,6 @@ static void conf_message(const char *fmt, ...)
 static const char *conf_filename;
 static int conf_lineno, conf_warnings;
 
-const char conf_defname[] = "arch/$(ARCH)/defconfig";
-
 static void conf_warning(const char *fmt, ...)
 {
 	va_list ap;
@@ -233,21 +231,6 @@ static const char *conf_get_autoconfig_name(void)
 	return name ? name : "include/config/auto.conf";
 }
 
-char *conf_get_default_confname(void)
-{
-	static char fullname[PATH_MAX+1];
-	char *env, *name;
-
-	name = expand_string(conf_defname);
-	env = getenv(SRCTREE);
-	if (env) {
-		snprintf(fullname, sizeof(fullname), "%s/%s", env, name);
-		if (is_present(fullname))
-			return fullname;
-	}
-	return name;
-}
-
 static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 {
 	char *p2;
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index cbc7658ee27d..4fb16f316626 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -49,7 +49,6 @@ const char *zconf_curname(void);
 
 /* confdata.c */
 const char *conf_get_configname(void);
-char *conf_get_default_confname(void);
 void sym_set_change_count(int count);
 void sym_add_change_count(int count);
 bool conf_set_all_new_symbols(enum conf_def_mode mode);
-- 
2.17.1
