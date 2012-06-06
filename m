Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:37504 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757096Ab2FFW3R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jun 2012 18:29:17 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 2/3] scripts/config: allow alternate prefix to config option symbol
Date: Thu,  7 Jun 2012 00:29:10 +0200
Message-Id: <1339021751-26474-2-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1339021751-26474-1-git-send-email-yann.morin.1998@free.fr>
References: <1339021751-26474-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

While the Linux kernel uses 'CONFIG_' as a prefix to the config options
symbols, many projects that use kconfig may use different prefixes, or
even none at all.

If the CONFIG_ environment variable is set, use it as the prefix (empty
is a valid prefix). Otherwise, use the default prefix 'CONFIG_'.

This matches the support for alternate prefixes in scripts/kconfig/lkc.h,
which uses the same logic (albeit with a C define instead of an environment
variable).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/config |   29 ++++++++++++++++-------------
 1 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/scripts/config b/scripts/config
index 5bae72d..09bd4ec 100755
--- a/scripts/config
+++ b/scripts/config
@@ -1,6 +1,9 @@
 #!/bin/bash
 # Manipulate options in a .config file from the command line
 
+# If no prefix forced, use the default CONFIG_
+CONFIG_="${CONFIG_-CONFIG_}"
+
 usage() {
 	cat >&2 <<EOL
 Manipulate options in a .config file from the command line.
@@ -44,8 +47,8 @@ checkarg() {
 		usage
 	fi
 	case "$ARG" in
-	CONFIG_*)
-		ARG="${ARG/CONFIG_/}"
+	${CONFIG_}*)
+		ARG="${ARG/${CONFIG_}/}"
 		;;
 	esac
 	case "${KCONFIG_CASE}" in
@@ -106,37 +109,37 @@ while [ "$1" != "" ] ; do
 	esac
 	case "$CMD" in
 	--enable|-e)
-		set_var "CONFIG_$ARG" "CONFIG_$ARG=y"
+		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=y"
 		;;
 
 	--disable|-d)
-		set_var "CONFIG_$ARG" "# CONFIG_$ARG is not set"
+		set_var "${CONFIG_}$ARG" "# ${CONFIG_}$ARG is not set"
 		;;
 
 	--module|-m)
-		set_var "CONFIG_$ARG" "CONFIG_$ARG=m"
+		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=m"
 		;;
 
 	--set-str)
 		# sed swallows one level of escaping, so we need double-escaping
-		set_var "CONFIG_$ARG" "CONFIG_$ARG=\"${1//\"/\\\\\"}\""
+		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=\"${1//\"/\\\\\"}\""
 		shift
 		;;
 
 	--set-val)
-		set_var "CONFIG_$ARG" "CONFIG_$ARG=$1"
+		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=$1"
 		shift
 		;;
 
 	--state|-s)
-		if grep -q "# CONFIG_$ARG is not set" $FN ; then
+		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
 			echo n
 		else
-			V="$(grep "^CONFIG_$ARG=" $FN)"
+			V="$(grep "^${CONFIG_}$ARG=" $FN)"
 			if [ $? != 0 ] ; then
 				echo undef
 			else
-				V="${V/#CONFIG_$ARG=/}"
+				V="${V/#${CONFIG_}$ARG=/}"
 				V="${V/#\"/}"
 				V="${V/%\"/}"
 				V="${V/\\\"/\"}"
@@ -146,15 +149,15 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--enable-after|-E)
-		set_var "CONFIG_$B" "CONFIG_$B=y" "CONFIG_$A"
+		set_var "${CONFIG_}$B" "${CONFIG_}$B=y" "${CONFIG_}$A"
 		;;
 
 	--disable-after|-D)
-		set_var "CONFIG_$B" "# CONFIG_$B is not set" "CONFIG_$A"
+		set_var "${CONFIG_}$B" "# ${CONFIG_}$B is not set" "${CONFIG_}$A"
 		;;
 
 	--module-after|-M)
-		set_var "CONFIG_$B" "CONFIG_$B=m" "CONFIG_$A"
+		set_var "${CONFIG_}$B" "${CONFIG_}$B=m" "${CONFIG_}$A"
 		;;
 
 	# undocumented because it ignores --file (fixme)
-- 
1.7.2.5

