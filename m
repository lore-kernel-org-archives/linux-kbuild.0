Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f202.google.com ([209.85.213.202]:38499 "EHLO
	mail-yx0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755381Ab2AJXlK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jan 2012 18:41:10 -0500
Received: by yenm5 with SMTP id m5so18563yen.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2012 15:41:09 -0800 (PST)
Subject: [patch 1/4] kconfig: add merge_config.sh script
From: akpm@linux-foundation.org
Date: Tue, 10 Jan 2012 15:41:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
Message-Id: <20120110234108.E35F110011C@wpzn3.hot.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, johnstul@us.ibm.com, Bruce.Ashfield@windriver.com, Dmitry.Fink@palm.com, Reinhard.Tartler@informatik.uni-erlangen.de, dvhart@linux.intel.com, ebmunson@us.ibm.com, gthelen@google.com, john.stultz@linaro.org, sam@ravnborg.org

From: john stultz <johnstul@us.ibm.com>
Subject: kconfig: add merge_config.sh script

After noticing almost every distro has their own method of managing config
fragments, I went looking at some best practices, and wanted to try to
consolidate some of the different approaches so this fairly simple
infrastructure can be shared (and new distros/build systems don't have to
implement yet another config fragment merge script).

This script is most influenced by the Windriver tools used in the Yocto
Project, reusing some portions found there.

This script merges multiple config fragments, warning on any overridden
values.  It then sets any unspecified values to their default, then
finally checks to make sure no specified value was dropped due to
unsatisfied dependencies.

I'm sure this implementation won't work for everyone, and I expect it will
need to evolve to adapt for various use cases.  But I think its a
reasonable starting point.

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Greg Thelen <gthelen@google.com>
Cc: Reinhard Tartler <Reinhard.Tartler@informatik.uni-erlangen.de>
Cc: Dmitry Fink <Dmitry.Fink@palm.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Cc: Eric B Munson <ebmunson@us.ibm.com>
Cc: Bruce Ashfield <Bruce.Ashfield@windriver.com>
Cc: Michal Marek <mmarek@suse.cz>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/kconfig/merge_config.sh |  117 ++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff -puN /dev/null scripts/kconfig/merge_config.sh
--- /dev/null
+++ a/scripts/kconfig/merge_config.sh
@@ -0,0 +1,117 @@
+#!/bin/sh
+#  merge_config.sh - Takes a list of config fragment values, and merges
+#  them one by one. Provides warnings on overridden values, and specified
+#  values that did not make it to the resulting .config file (due to missed
+#  dependencies or config symbol removal).
+#
+#  Portions reused from kconf_check and generate_cfg:
+#  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/kconf_check
+#  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/generate_cfg
+#
+#  Copyright (c) 2009-2010 Wind River Systems, Inc.
+#  Copyright 2011 Linaro
+#
+#  This program is free software; you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License version 2 as
+#  published by the Free Software Foundation.
+#
+#  This program is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+#  See the GNU General Public License for more details.
+
+clean_up() {
+       rm -f $TMP_FILE
+       exit
+}
+trap clean_up SIGHUP SIGINT SIGTERM
+
+usage() {
+	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
+	echo "  -h    display this help text"
+	echo "  -m    only merge the fragments, do not execute the make command"
+	echo "  -n    use allnoconfig instead of alldefconfig"
+}
+
+MAKE=true
+ALLTARGET=alldefconfig
+
+while true; do
+	case $1 in
+	"-n")
+		ALLTARGET=allnoconfig
+		shift
+		continue
+		;;
+	"-m")
+		MAKE=false
+		shift
+		continue
+		;;
+	"-h")
+		usage
+		exit
+		;;
+	*)
+		break
+		;;
+	esac
+done
+
+
+
+MERGE_LIST=$*
+SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+
+# Merge files, printing warnings on overrided values
+for MERGE_FILE in $MERGE_LIST ; do
+	echo "Merging $MERGE_FILE"
+	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
+
+	for CFG in $CFG_LIST ; do
+		grep -q -w $CFG $TMP_FILE
+		if [ $? -eq 0 ] ; then
+			PREV_VAL=$(grep -w $CFG $TMP_FILE)
+			NEW_VAL=$(grep -w $CFG $MERGE_FILE)
+			if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
+			echo Value of $CFG is redefined by fragment $MERGE_FILE:
+			echo Previous  value: $PREV_VAL
+			echo New value:       $NEW_VAL
+			echo
+			fi
+			sed -i "/$CFG[ =]/d" $TMP_FILE
+		fi
+	done
+	cat $MERGE_FILE >> $TMP_FILE
+done
+
+if [ "$MAKE" = "false" ]; then
+	cp $TMP_FILE .config
+	echo "#"
+	echo "# merged configuration written to .config (needs make)"
+	echo "#"
+	clean_up
+	exit
+fi
+
+# Use the merged file as the starting point for:
+# alldefconfig: Fills in any missing symbols with Kconfig default
+# allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
+make KCONFIG_ALLCONFIG=$TMP_FILE $ALLTARGET
+
+
+# Check all specified config values took (might have missed-dependency issues)
+for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
+
+	REQUESTED_VAL=$(sed -n "$SED_CONFIG_EXP" $TMP_FILE | grep -w -e "$CFG")
+	ACTUAL_VAL=$(sed -n "$SED_CONFIG_EXP" .config | grep -w -e "$CFG")
+	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
+		echo "Value requested for $CFG not in final .config"
+		echo "Requested value:  $REQUESTED_VAL"
+		echo "Actual value:     $ACTUAL_VAL"
+		echo ""
+	fi
+done
+
+clean_up
_
