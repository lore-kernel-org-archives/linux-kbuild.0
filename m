Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:53326 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfBVHkW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Feb 2019 02:40:22 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 6/6] kbuild: move ".config not found!" message from Kconfig to Makefile
Date: Fri, 22 Feb 2019 16:40:11 +0900
Message-Id: <1550821211-30324-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550821211-30324-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550821211-30324-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

If you run "make" in a pristine source tree, currently Kbuild will
start to build Kconfig to let it show the error message.

It would be more straightforward to check it in Makefile and let
it fail immediately.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - New patch

 Makefile               | 10 ++++++++--
 scripts/kconfig/conf.c | 13 -------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index aa9ff68..84034c5 100644
--- a/Makefile
+++ b/Makefile
@@ -628,8 +628,14 @@ ifeq ($(may-sync-config),1)
 # because some architectures define CROSS_COMPILE there.
 -include include/config/auto.conf.cmd
 
-# To avoid any implicit rule to kick in, define an empty command
-$(KCONFIG_CONFIG): ;
+$(KCONFIG_CONFIG):
+	@echo >&2 '***'
+	@echo >&2 '*** Configuration file "$@" not found!'
+	@echo >&2 '***'
+	@echo >&2 '*** Please run some configurator (e.g. "make oldconfig" or'
+	@echo >&2 '*** "make menuconfig" or "make xconfig").'
+	@echo >&2 '***'
+	@/bin/false
 
 # The actual configuration files used during the build are stored in
 # include/generated/ and include/config/. Update them if .config is newer than
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index da89ef7..ef3678c 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -488,7 +488,6 @@ int main(int ac, char **av)
 	const char *progname = av[0];
 	int opt;
 	const char *name, *defconfig_file = NULL /* gcc uninit */;
-	struct stat tmpstat;
 	int no_conf_write = 0;
 
 	tty_stdio = isatty(0) && isatty(1);
@@ -560,18 +559,6 @@ int main(int ac, char **av)
 	name = av[optind];
 	conf_parse(name);
 	//zconfdump(stdout);
-	if (sync_kconfig) {
-		name = conf_get_configname();
-		if (stat(name, &tmpstat)) {
-			fprintf(stderr, "***\n"
-				"*** Configuration file \"%s\" not found!\n"
-				"***\n"
-				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
-				"*** \"make menuconfig\" or \"make xconfig\").\n"
-				"***\n", name);
-			exit(1);
-		}
-	}
 
 	switch (input_mode) {
 	case defconfig:
-- 
2.7.4
