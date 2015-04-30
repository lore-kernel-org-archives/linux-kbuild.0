Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:34781 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737AbbD3KxH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Apr 2015 06:53:07 -0400
Received: by wgso17 with SMTP id o17so57827524wgs.1
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2015 03:53:05 -0700 (PDT)
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RFC] scripts: kerrno.sh - errno translator
Date: Thu, 30 Apr 2015 12:53:35 +0200
Message-Id: <1430391215-13768-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

Shell script allowing to find errno definitions and descriptions in the
kernel source.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
This is a simple script I use when seeing messages like:

	some_func() failed: -123

to find out the actual errno meaning. The usage is very simple - just
call 'scripts/kerrno.sh 1 4 -50 (...)'.

I'm sending this as RFC in order to find out if there's any interest in merging
this script with the kernel code.

 scripts/kerrno.sh | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100755 scripts/kerrno.sh

diff --git a/scripts/kerrno.sh b/scripts/kerrno.sh
new file mode 100755
index 0000000..ebdc8da
--- /dev/null
+++ b/scripts/kerrno.sh
@@ -0,0 +1,62 @@
+#!/bin/sh
+
+# Get preprocessor definitions and descriptions of errno numbers from the
+# Linux kernel source.
+#
+# This script parses all the C headers containing errno definitions in the
+# Linux source tree and extracts their definitions and corresponding
+# descriptions in order to quickly give users an idea on what kind of
+# an error they're dealing with.
+#
+# Example:
+#     scripts/kerrno.sh 43 -12 3
+#
+# Should be called from the top of the source tree.
+#
+# Copyright (C) 2015 Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+FILEPTRN=".*errno.*\.[ch]$"
+ERRNOPTRN="\#define[\ \t]+E[A-Z0-9]+[\ \t]+[0-9]+[\ \t]+"
+
+usage()
+{
+	echo "$0: get info for error numbers"
+	echo
+	echo "Usage:"
+	echo "\t$0 <errno numbers>"
+	echo
+	echo "\tExample: $0 -18 34 128"
+	echo
+}
+
+if [ "$#" -eq "0" ] || ([ "$#" -eq "1" ] && [ "$1" = "--help" ])
+then
+	usage
+	exit
+fi
+
+for WANTED in $@
+do
+	case ${WANTED#-} in
+		''|*[!0-9]*)
+			echo "$WANTED: not a number";
+			continue;
+			;;
+	esac
+
+	test "$WANTED" -lt "0" && WANTED=$(echo -n $WANTED | cut -d'-' -f2)
+
+	echo "Errno $WANTED:"
+	find ./ -regex "$FILEPTRN" -exec grep -nPH "$ERRNOPTRN" {} \; \
+		| tr -s ':' ' ' \
+		| tr -s '\t' ' ' \
+		| cut -d' ' -f1,2,4,5 | while read FILE LINE ERRNO NUM
+	do
+		if [ "$NUM" -eq "$WANTED" ]
+		then
+			echo -n "\t$ERRNO ("
+			echo -n "$(head $FILE -n $LINE | tail -1 | cut -d'*' -f2)"
+			echo ") defined in $FILE:$LINE"
+		fi
+	done
+done
-- 
2.1.4

