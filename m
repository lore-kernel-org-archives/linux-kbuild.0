Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38334 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755371AbeDKTPt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Apr 2018 15:15:49 -0400
From: Don Zickus <dzickus@redhat.com>
Subject: [PATCH v2] kconfig: extend output of 'listnewconfig'
Date: Wed, 11 Apr 2018 15:15:37 -0400
Message-Id: <20180411191537.24070-1-dzickus@redhat.com>
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

This patch extends 'listnewconfig' to address the above two issues.

This allows us to run a script

make listnewconfig | rhconfig-tool -o patches; git send-email patches/

The output of 'make listnewconfig':

CONFIG_NET_EMATCH_IPT
CONFIG_IPVLAN
CONFIG_ICE
CONFIG_NET_VENDOR_NI
CONFIG_IEEE802154_MCR20A
CONFIG_IR_IMON_DECODER
CONFIG_IR_IMON_RAW

The new output of 'make listnewconfig':

CONFIG_KERNEL_XZ=n
CONFIG_KERNEL_LZO=n
CONFIG_NET_EMATCH_IPT=n
CONFIG_IPVLAN=n
CONFIG_ICE=n
CONFIG_NET_VENDOR_NI=y
CONFIG_IEEE802154_MCR20A=n
CONFIG_IR_IMON_DECODER=n
CONFIG_IR_IMON_RAW=n

Signed-off-by: Don Zickus <dzickus@redhat.com>
---
V2: roll listnewdefconfig changes into listnewconfig
    (sorry for delay, thought there was a logic error with this)
---
 scripts/kconfig/conf.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 4e08121a35fb..283eeedaa4fa 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -422,8 +422,18 @@ static void check_conf(struct menu *menu)
 		if (sym_is_changable(sym) ||
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
 			if (input_mode == listnewconfig) {
-				if (sym->name && !sym_is_choice_value(sym)) {
-					printf("%s%s\n", CONFIG_, sym->name);
+				if (sym->name) {
+					const char *str;
+
+					if (sym->type == S_STRING) {
+						str = sym_get_string_value(sym);
+						str = sym_escape_string_value(str);
+						printf("%s%s=%s\n", CONFIG_, sym->name, str);
+						free((void *)str);
+					} else {
+						str = sym_get_string_value(sym);
+						printf("%s%s=%s\n", CONFIG_, sym->name, str);
+					}
 				}
 			} else {
 				if (!conf_cnt++)
-- 
2.14.3

