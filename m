Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:57760 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008Ab2FGXtF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jun 2012 19:49:05 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 2/3] scripts/config: allow alternate prefix to config option symbol
Date: Fri,  8 Jun 2012 01:48:56 +0200
Message-Id: <1339112937-9055-3-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1339112937-9055-1-git-send-email-yann.morin.1998@free.fr>
References: <1339112937-9055-1-git-send-email-yann.morin.1998@free.fr>
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
 scripts/config |   32 +++++++++++++++++++-------------
 1 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/scripts/config b/scripts/config
index c5639fe..9723c7d 100755
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
@@ -34,6 +37,9 @@ make time.
 
 By default, config will upper-case the given symbol. Use --keep-case to keep
 the case of all following symbols unchanged.
+
+config uses 'CONFIG_' as the default symbol prefix. Set the environment
+variable CONFIG_ to the prefix to use. Eg.: CONFIG_="FOO_" config ...
 EOL
 	exit 1
 }
@@ -44,8 +50,8 @@ checkarg() {
 		usage
 	fi
 	case "$ARG" in
-	CONFIG_*)
-		ARG="${ARG/CONFIG_/}"
+	${CONFIG_}*)
+		ARG="${ARG/${CONFIG_}/}"
 		;;
 	esac
 	if [ "$MUNGE_CASE" = "yes" ] ; then
@@ -107,37 +113,37 @@ while [ "$1" != "" ] ; do
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
@@ -147,15 +153,15 @@ while [ "$1" != "" ] ; do
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

