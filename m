Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50610 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751829AbeDDT4h (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Apr 2018 15:56:37 -0400
From: Don Zickus <dzickus@redhat.com>
Subject: [PATCH] kconfig: add support for new option 'listnewdefconfig'
Date: Wed,  4 Apr 2018 15:56:25 -0400
Message-Id: <20180404195625.24657-1-dzickus@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, Don Zickus <dzickus@redhat.com>

We at Red Hat/Fedora have generally tried to have a per file breakdown of
every config option we set.  This makes it easy for us to add new options
when they are exposed and keep a changelog of why they were set.

A Fedora example is here:
  https://src.fedoraproject.org/cgit/rpms/kernel.git/tree/configs/fedora/generic

Using various merge scripts, we build up a config file and run it through
'make listnewconfig' and 'make oldnoconfig'.   The idea is to print out new
config options that haven't been manually set and use the default until
a patch is posted to set it properly.

To speed things up, it would be nice to make it easier to generate a
patch to post the default setting.  The output of 'make listnewconfig'
has two issues that limit us:

- it doesn't provide the default value
- it doesn't provide the new 'choice' options that get flagged in
  'oldconfig'

This patch adds a new command 'listnewdefconfig' that does exactly
what 'listnewconfig' does but addresses the above two issues too.

This allows us to run a script

make listnewdefconfig | rhconfig-tool -o patches; git send-email patches/

The output of 'make listnewconfig':

CONFIG_NET_EMATCH_IPT
CONFIG_IPVLAN
CONFIG_ICE
CONFIG_NET_VENDOR_NI
CONFIG_IEEE802154_MCR20A
CONFIG_IR_IMON_DECODER
CONFIG_IR_IMON_RAW

The output of 'make listnewdefconfig':

CONFIG_KERNEL_XZ=n #choice
CONFIG_KERNEL_LZO=n #choice
CONFIG_NET_EMATCH_IPT=n
CONFIG_IPVLAN=n
CONFIG_ICE=n
CONFIG_NET_VENDOR_NI=y
CONFIG_IEEE802154_MCR20A=n
CONFIG_IR_IMON_DECODER=n
CONFIG_IR_IMON_RAW=n

Signed-off-by: Don Zickus <dzickus@redhat.com>
---
 scripts/kconfig/Makefile |  3 ++-
 scripts/kconfig/conf.c   | 23 ++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index f9bdd02c06a2..ebdf3b2e62dd 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -80,7 +80,7 @@ update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 
 # These targets map 1:1 to the commandline options of 'conf'
 simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
-	alldefconfig randconfig listnewconfig olddefconfig
+	alldefconfig randconfig listnewconfig listnewdefconfig olddefconfig
 PHONY += $(simple-targets)
 
 $(simple-targets): $(obj)/conf
@@ -167,6 +167,7 @@ help:
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
+	@echo  '  listnewdefconfig - List new options and print defaults'
 	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
 	@echo  '                    default value without prompting'
 	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 4e08121a35fb..cd4f09b9df05 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -33,6 +33,7 @@ enum input_mode {
 	defconfig,
 	savedefconfig,
 	listnewconfig,
+	listnewdefconfig,
 	olddefconfig,
 };
 static enum input_mode input_mode = oldaskconfig;
@@ -425,6 +426,21 @@ static void check_conf(struct menu *menu)
 				if (sym->name && !sym_is_choice_value(sym)) {
 					printf("%s%s\n", CONFIG_, sym->name);
 				}
+			} else if (input_mode == listnewdefconfig) {
+				if (sym->name) {
+					const char *str;
+
+					if (sym->type == S_STRING) {
+						str = sym_get_string_value(sym);
+						str = sym_escape_string_value(str);
+						printf("%s%s=%s\n", CONFIG_, sym->name, str);
+						free((void *)str);
+					} else {
+						bool choice = sym_is_choice_value(sym);
+						str = sym_get_string_value(sym);
+						printf("%s%s=%s%s\n", CONFIG_, sym->name, str, (choice ?" #choice":""));
+					}
+				}
 			} else {
 				if (!conf_cnt++)
 					printf(_("*\n* Restart config...\n*\n"));
@@ -450,6 +466,7 @@ static struct option long_opts[] = {
 	{"alldefconfig",    no_argument,       NULL, alldefconfig},
 	{"randconfig",      no_argument,       NULL, randconfig},
 	{"listnewconfig",   no_argument,       NULL, listnewconfig},
+	{"listnewdefconfig", no_argument,      NULL, listnewdefconfig},
 	{"olddefconfig",    no_argument,       NULL, olddefconfig},
 	/*
 	 * oldnoconfig is an alias of olddefconfig, because people already
@@ -466,6 +483,7 @@ static void conf_usage(const char *progname)
 	printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
 	printf("[option] is _one_ of the following:\n");
 	printf("  --listnewconfig         List new options\n");
+	printf("  --listnewdefconfig      List new options with defaults\n");
 	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
 	printf("  --oldconfig             Update a configuration using a provided .config as base\n");
 	printf("  --syncconfig            Similar to oldconfig but generates configuration in\n"
@@ -540,6 +558,7 @@ int main(int ac, char **av)
 		case allmodconfig:
 		case alldefconfig:
 		case listnewconfig:
+		case listnewdefconfig:
 		case olddefconfig:
 			break;
 		case '?':
@@ -587,6 +606,7 @@ int main(int ac, char **av)
 	case oldaskconfig:
 	case oldconfig:
 	case listnewconfig:
+	case listnewdefconfig:
 	case olddefconfig:
 		conf_read(NULL);
 		break;
@@ -667,6 +687,7 @@ int main(int ac, char **av)
 		/* fall through */
 	case oldconfig:
 	case listnewconfig:
+	case listnewdefconfig:
 	case syncconfig:
 		/* Update until a loop caused no more changes */
 		do {
@@ -697,7 +718,7 @@ int main(int ac, char **av)
 				defconfig_file);
 			return 1;
 		}
-	} else if (input_mode != listnewconfig) {
+	} else if ((input_mode != listnewconfig) && (input_mode != listnewdefconfig)) {
 		if (conf_write(NULL)) {
 			fprintf(stderr, _("\n*** Error during writing of the configuration.\n\n"));
 			exit(1);
-- 
2.14.3

