Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728338AbgEFMwy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 08:52:54 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D92C061A0F
        for <linux-kbuild@vger.kernel.org>; Wed,  6 May 2020 05:52:53 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id g4so2236687ljl.2
        for <linux-kbuild@vger.kernel.org>; Wed, 06 May 2020 05:52:53 -0700 (PDT)
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Subject: [PATCH 2/2] kconfig: Extend kconfig with setall option
Date: Wed,  6 May 2020 15:52:36 +0300
Message-Id: <20200506125236.16415-3-jukka.kaartinen@unikie.com>
In-Reply-To: <20200506125236.16415-1-jukka.kaartinen@unikie.com>
References: <20200506125236.16415-1-jukka.kaartinen@unikie.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, lukas.bulwahn@gmail.com, jouni.hogander@unikie.com, dan.carpenter@oracle.com, Jukka Kaartinen <jukka.kaartinen@unikie.com>

setall will set all possible dependencies automatically to
value "y".

Signed-off-by: Jukka Kaartinen <jukka.kaartinen@unikie.com>
---
 scripts/kconfig/kconfig | 75 ++++++++++++++++++++++++++++++++++-------
 scripts/kconfig/lconf.c | 16 +++++++++
 2 files changed, 78 insertions(+), 13 deletions(-)

diff --git a/scripts/kconfig/kconfig b/scripts/kconfig/kconfig
index 2762c8dc04a8..0546ad5a44c1 100755
--- a/scripts/kconfig/kconfig
+++ b/scripts/kconfig/kconfig
@@ -2,33 +2,82 @@
 # SPDX-License-Identifier: GPL-2.0
 
 usage() {
-	echo "kconfig [search|set] string"
+	echo "kconfig [search|set|setall|val|out] string"
+	echo "      search         Search config option"
+	echo "      set            Config option"
+	echo "      setall         Set all possible dependencies to 'y'"
+	echo "      val            Value for config option"
+	echo "      out            Directory for O=<out>"
+	echo ""
+	echo " example:"
+	echo "   $0 set I2C val y"
 	exit 1;
 }
 
-if [ "$1" = "" ] ; then
-	usage
-fi
+search=""
+search_val=""
+config=""
+config_val=""
+output=""
+setting=""
+
+while [[ $# -gt 0 ]]
+do
+	key="$1"
+	case $key in
+		search)
+			search=1
+			search_val="$2"
+			shift # past argument
+			shift # past value
+			;;
+		set)
+			config=1
+			config_val="$2"
+			shift # past argument
+			shift # past value
+			;;
+		setall)
+			all="y"
+			shift # past argument
+			;;
+		val)
+			setting="$2"
+			shift # past argument
+			shift # past value
+			;;
+		out)
+			output="O=$2"
+			shift # past argument
+			shift # past value
+			;;
+		*)    # unknown option
+			echo "Unknown option: $1"
+			usage
+			exit 1
+			;;
+	esac
+done
 
-if [ "$1" = "search" ] ; then
+if [ "$search" != "" ] ; then
 
-	search=$2
-	NCONFIG_MODE=kconfig_search SEARCH=${search} make lconfig
+	if [ $search_val = "" ] ; then
+		echo "nothing to search"
+		exit 1
+	fi
 
-elif [ "$1" = "set" ] ; then
+	NCONFIG_MODE=kconfig_search SEARCH=${search_val} make lconfig ${output}
 
-	config=$2
-	setting=$3
+elif [ "$config" != "" ] ; then
 
-	if [ $config = "" ] ; then
+	if [ $config_val = "" ] ; then
 		echo "nothing to set"
 		exit 1
 	fi
 
-	NCONFIG_MODE=kconfig_set CONFIG=${config} SETTING=${setting} make lconfig
+	ALLYES=${all} NCONFIG_MODE=kconfig_set CONFIG=${config_val} SETTING=${setting} make lconfig ${output}
 
 else
 	usage
 fi
 
-
diff --git a/scripts/kconfig/lconf.c b/scripts/kconfig/lconf.c
index cde717f36eb1..b8634f8f662d 100644
--- a/scripts/kconfig/lconf.c
+++ b/scripts/kconfig/lconf.c
@@ -14,6 +14,7 @@
 
 static int indent;
 static char line[128];
+static char *ask_from_user;
 
 static int get_depends(struct symbol *sym);
 
@@ -57,6 +58,12 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 		return 0;
 	}
 
+	if (ask_from_user) {
+		line[0] = 'y';
+		line[1] = '\0';
+		return 0;
+	}
+
 	fflush(stdout);
 	xfgets(line, 128, stdin);
 
@@ -232,8 +239,17 @@ static void kconfig_set(void)
 	struct symbol *sym;
 	char *config;
 	char *setting;
+	char *allyes;
 	int res;
 
+	allyes = getenv("ALLYES");
+	if (allyes) {
+		if (strncmp(allyes, "y", 1) == 0) {
+			ask_from_user = "y";
+			printf("Set all dependencies to yes.\n");
+		}
+	}
+
 	config = getenv("CONFIG");
 	if (!config)
 		return;
-- 
2.17.1
