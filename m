Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f97.google.com ([209.85.128.97]:51386 "EHLO
        mail-wm1-f97.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbfHSUG5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 16:06:57 -0400
Received: by mail-wm1-f97.google.com with SMTP id k1so359195wmi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2019 13:06:56 -0700 (PDT)
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] merge_config.sh: Check error codes from make
Date: Mon, 19 Aug 2019 21:06:50 +0100
Message-Id: <20190819200650.18156-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>

When we execute make after merging the configurations we ignore any
errors it produces causing whatever is running merge_config.sh to be
unaware of any failures.  This issue was noticed by Guillaume Tucker
while looking at problems with testing of clang only builds in KernelCI
which caused Kbuild to be unable to find a working host compiler.

This implementation was suggested by Yamada-san.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 scripts/kconfig/merge_config.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index d924c51d28b7..bec246719aea 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -13,12 +13,12 @@
 #  Copyright (c) 2009-2010 Wind River Systems, Inc.
 #  Copyright 2011 Linaro
 
+set -e
+
 clean_up() {
 	rm -f $TMP_FILE
 	rm -f $MERGE_FILE
-	exit
 }
-trap clean_up HUP INT TERM
 
 usage() {
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
@@ -110,6 +110,9 @@ TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
+
+trap clean_up EXIT
+
 cat $INITFILE > $TMP_FILE
 
 # Merge files, printing warnings on overridden values
@@ -155,7 +158,6 @@ if [ "$RUNMAKE" = "false" ]; then
 	echo "#"
 	echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
 	echo "#"
-	clean_up
 	exit
 fi
 
@@ -185,5 +187,3 @@ for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
 		echo ""
 	fi
 done
-
-clean_up
-- 
2.20.1
