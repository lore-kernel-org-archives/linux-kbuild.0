Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:45678 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfGEPOu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jul 2019 11:14:50 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] scripts/tags.sh: drop SUBARCH support for ARM
Date: Sat,  6 Jul 2019 00:14:30 +0900
Message-Id: <20190705151431.29122-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Our goal is to have more and more sub-architectures to join the
ARM multi-platform, and support them in a single configuration.

Remove the ARM SUBARCH support because it is ugly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/tags.sh | 36 ++----------------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index cc991e18f4d1..f56edeb08739 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -41,15 +41,13 @@ find_arch_sources()
 	for i in $archincludedir; do
 		prune="$prune -wholename $i -prune -o"
 	done
-	find ${tree}arch/$1 $ignore $subarchprune $prune -name "$2" \
-		-not -type l -print;
+	find ${tree}arch/$1 $ignore $prune -name "$2" -not -type l -print;
 }
 
 # find sources in arch/$1/include
 find_arch_include_sources()
 {
-	include=$(find ${tree}arch/$1/ $subarchprune \
-					-name include -type d -print);
+	include=$(find ${tree}arch/$1/ -name include -type d -print);
 	if [ -n "$include" ]; then
 		archincludedir="$archincludedir $include"
 		find $include $ignore -name "$2" -not -type l -print;
@@ -305,36 +303,6 @@ if [ "${ARCH}" = "um" ]; then
 	else
 		archinclude=${SUBARCH}
 	fi
-elif [ "${SRCARCH}" = "arm" -a "${SUBARCH}" != "" ]; then
-	subarchdir=$(find ${tree}arch/$SRCARCH/ -name "mach-*" -type d -o \
-							-name "plat-*" -type d);
-	mach_suffix=$SUBARCH
-	plat_suffix=$SUBARCH
-
-	# Special cases when $plat_suffix != $mach_suffix
-	case $mach_suffix in
-		"omap1" | "omap2")
-			plat_suffix="omap"
-			;;
-	esac
-
-	if [ ! -d ${tree}arch/$SRCARCH/mach-$mach_suffix ]; then
-		echo "Warning: arch/arm/mach-$mach_suffix/ not found." >&2
-		echo "         Fix your \$SUBARCH appropriately" >&2
-	fi
-
-	for i in $subarchdir; do
-		case "$i" in
-			*"mach-"${mach_suffix})
-				;;
-			*"plat-"${plat_suffix})
-				;;
-			*)
-				subarchprune="$subarchprune \
-						-wholename $i -prune -o"
-				;;
-		esac
-	done
 fi
 
 remove_structs=
-- 
2.17.1
