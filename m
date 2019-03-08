Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:58442 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfCHJ5E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 04:57:04 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kbuild: deb-pkg: add CONFIG_ prefix to kernel config options
Date: Fri,  8 Mar 2019 18:56:23 +0900
Message-Id: <1552038985-10473-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This might be a kind of bike-shed, but I personally prefer grep'able
code.

I often do 'git grep CONFIG_FOO' instead of 'git grep FOO' when I
want to know where that CONFIG option is used.

This makes code longer, but I hope this is acceptable level.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkdebian | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index f030961..e3726e8 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -7,7 +7,7 @@
 set -e
 
 is_enabled() {
-	grep -q "^CONFIG_$1=y" $KCONFIG_CONFIG
+	grep -q "^$1=y" $KCONFIG_CONFIG
 }
 
 if_enabled_echo() {
@@ -31,23 +31,23 @@ set_debarch() {
 	x86_64)
 		debarch=amd64 ;;
 	sparc*)
-		debarch=sparc$(if_enabled_echo 64BIT 64) ;;
+		debarch=sparc$(if_enabled_echo CONFIG_64BIT 64) ;;
 	s390*)
 		debarch=s390x ;;
 	ppc*)
-		if is_enabled 64BIT; then
-			debarch=ppc64$(if_enabled_echo CPU_LITTLE_ENDIAN el)
+		if is_enabled CONFIG_64BIT; then
+			debarch=ppc64$(if_enabled_echo CONFIG_CPU_LITTLE_ENDIAN el)
 		else
-			debarch=powerpc$(if_enabled_echo SPE spe)
+			debarch=powerpc$(if_enabled_echo CONFIG_SPE spe)
 		fi
 		;;
 	parisc*)
 		debarch=hppa ;;
 	mips*)
-		if is_enabled CPU_LITTLE_ENDIAN; then
-			debarch=mips$(if_enabled_echo 64BIT 64)$(if_enabled_echo CPU_MIPSR6 r6)el
-		elif is_enabled CPU_MIPSR6; then
-			debarch=mips$(if_enabled_echo 64BIT 64)r6
+		if is_enabled CONFIG_CPU_LITTLE_ENDIAN; then
+			debarch=mips$(if_enabled_echo CONFIG_64BIT 64)$(if_enabled_echo CONFIG_CPU_MIPSR6 r6)el
+		elif is_enabled CONFIG_CPU_MIPSR6; then
+			debarch=mips$(if_enabled_echo CONFIG_64BIT 64)r6
 		else
 			debarch=mips
 		fi
@@ -55,8 +55,8 @@ set_debarch() {
 	aarch64|arm64)
 		debarch=arm64 ;;
 	arm*)
-		if is_enabled AEABI; then
-			debarch=arm$(if_enabled_echo VFP hf el)
+		if is_enabled CONFIG_AEABI; then
+			debarch=arm$(if_enabled_echo CONFIG_VFP hf el)
 		else
 			debarch=arm
 		fi
@@ -64,10 +64,10 @@ set_debarch() {
 	openrisc)
 		debarch=or1k ;;
 	sh)
-		if is_enabled CPU_SH3; then
-			debarch=sh3$(if_enabled_echo CPU_BIG_ENDIAN eb)
-		elif is_enabled CPU_SH4; then
-			debarch=sh4$(if_enabled_echo CPU_BIG_ENDIAN eb)
+		if is_enabled CONFIG_CPU_SH3; then
+			debarch=sh3$(if_enabled_echo CONFIG_CPU_BIG_ENDIAN eb)
+		elif is_enabled CONFIG_CPU_SH4; then
+			debarch=sh4$(if_enabled_echo CONFIG_CPU_BIG_ENDIAN eb)
 		fi
 		;;
 	esac
-- 
2.7.4
