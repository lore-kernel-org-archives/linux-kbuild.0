Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:35879 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751236AbbGUNWs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Jul 2015 09:22:48 -0400
Received: by wgbcc4 with SMTP id cc4so63239581wgb.3
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jul 2015 06:22:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH RFC] merge_config.sh: Add support to pass arguments to make
Date: Tue, 21 Jul 2015 14:22:36 +0100
Message-Id: <1437484956-23985-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

The issue is flags like ARCH can be passed to make via environment variable
or at command line by passing "ARCH=" argument to make file. The former case
works fine if used with merge_config but the later case would not work and
resulting config file from merge_config is useless.

I hit this issue when I started using config fragments on arm64 bit platform
and I usually pass ARCH at the make command line.

As it is common for users like me to pass ARCH variable in command line,
providing such flexiblity in merge_config makes more sense.

This patch adds support to pass arguments to make file, without this patch the
user has to set the enviroment variables which is not explicit.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 scripts/kconfig/merge_config.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index ec8e203..8d9cae4 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -28,6 +28,7 @@ trap clean_up HUP INT TERM
 
 usage() {
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
+	echo "  -a    arguments to make command. ex: ARCH=arm"
 	echo "  -h    display this help text"
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
@@ -39,6 +40,7 @@ RUNMAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
 OUTPUT=.
+MAKE_ARGS=""
 
 while true; do
 	case $1 in
@@ -61,6 +63,11 @@ while true; do
 		shift
 		continue
 		;;
+	"-a")
+		MAKE_ARGS=$2
+		shift 2
+		continue
+		;;
 	"-O")
 		if [ -d $2 ];then
 			OUTPUT=$(echo $2 | sed 's/\/*$//')
@@ -139,7 +146,7 @@ fi
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
-make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+make $MAKE_ARGS KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
-- 
1.9.1

