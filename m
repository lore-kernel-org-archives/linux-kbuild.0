Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out03.mta.xmission.com ([166.70.13.233]:38361 "EHLO
	out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756029Ab2DXAz2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Apr 2012 20:55:28 -0400
From: ebiederm@xmission.com (Eric W. Biederman)
Date: Mon, 23 Apr 2012 17:59:28 -0700
Message-ID: <m1aa22rllb.fsf@fess.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [PATCH] kbuld: Implement oldmodconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnaud Lacombe <lacombar@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org


While verifying that my user namespace patches are as complete as I
expect them to be I came a came across the need to build kernel
configurations with a few choice settings disabled and everything else
enabled.  Adding a make oldmodconfig made generating those
configurations straight forward, as now I can set the options I care
about and the oldmodconfig can answering everything else for me in a
consistent way.

Respond with mod/yes/default to every question for every unset symbol
depending if the symbol is tristate, boolean or something else.

Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
---
 scripts/kconfig/Makefile |    5 +++--
 scripts/kconfig/conf.c   |    8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 7966265..4de07d4 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -76,9 +76,9 @@ PHONY += allnoconfig allyesconfig allmodconfig alldefconfig randconfig
 allnoconfig allyesconfig allmodconfig alldefconfig randconfig: $(obj)/conf
 	$< --$@ $(Kconfig)
 
-PHONY += listnewconfig oldnoconfig savedefconfig defconfig
+PHONY += listnewconfig oldnoconfig oldmodconfig savedefconfig defconfig
 
-listnewconfig oldnoconfig: $(obj)/conf
+listnewconfig oldnoconfig oldmodconfig: $(obj)/conf
 	$< --$@ $(Kconfig)
 
 savedefconfig: $(obj)/conf
@@ -115,6 +115,7 @@ help:
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
 	@echo  '  oldnoconfig     - Same as silentoldconfig but set new symbols to n (unset)'
+	@echo  '  oldmodconfig    - Same as silentoldconfig but set new symbols to m (module)'
 
 # lxdialog stuff
 check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index f208f90..28910ea 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -33,6 +33,7 @@ enum input_mode {
 	savedefconfig,
 	listnewconfig,
 	oldnoconfig,
+	oldmodconfig,
 } input_mode = oldaskconfig;
 
 static int indent = 1;
@@ -455,6 +456,7 @@ static struct option long_opts[] = {
 	{"randconfig",      no_argument,       NULL, randconfig},
 	{"listnewconfig",   no_argument,       NULL, listnewconfig},
 	{"oldnoconfig",     no_argument,       NULL, oldnoconfig},
+	{"oldmodconfig",    no_argument,       NULL, oldmodconfig},
 	{NULL, 0, NULL, 0}
 };
 
@@ -468,6 +470,7 @@ static void conf_usage(const char *progname)
 	printf("  --oldconfig             Update a configuration using a provided .config as base\n");
 	printf("  --silentoldconfig       Same as oldconfig, but quietly, additionally update deps\n");
 	printf("  --oldnoconfig           Same as silentoldconfig but set new symbols to no\n");
+	printf("  --oldmodconfig          Same as silentoldconfig but set new symbols to mod\n");
 	printf("  --defconfig <file>      New config with default defined in <file>\n");
 	printf("  --savedefconfig <file>  Save the minimal current configuration to <file>\n");
 	printf("  --allnoconfig           New config where all options are answered with no\n");
@@ -521,6 +524,7 @@ int main(int ac, char **av)
 		case alldefconfig:
 		case listnewconfig:
 		case oldnoconfig:
+		case oldmodconfig:
 			break;
 		case '?':
 			conf_usage(progname);
@@ -566,6 +570,7 @@ int main(int ac, char **av)
 	case oldconfig:
 	case listnewconfig:
 	case oldnoconfig:
+	case oldmodconfig:
 		conf_read(NULL);
 		break;
 	case allnoconfig:
@@ -626,6 +631,9 @@ int main(int ac, char **av)
 	case defconfig:
 		conf_set_all_new_symbols(def_default);
 		break;
+	case oldmodconfig:
+		conf_set_all_new_symbols(def_mod);
+		break;
 	case savedefconfig:
 		break;
 	case oldaskconfig:
-- 
1.7.2.5

