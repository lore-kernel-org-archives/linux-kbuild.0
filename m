Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52328 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404609AbfHHW1a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 18:27:30 -0400
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] merge_config.sh: Check error codes from make
Date: Thu,  8 Aug 2019 23:27:05 +0100
Message-Id: <20190808222705.35973-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Mark Brown <broonie@kernel.org>, Guillaume Tucker <guillaume.tucker@collabora.com>

When we execute make after merging the configurations we ignore any
errors it produces causing whatever is running merge_config.sh to be
unaware of any failures.  This issue was noticed by Guillaume Tucker
while looking at problems with testing of clang only builds in KernelCI
which caused Kbuild to be unable to find a working host compiler.

Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 scripts/kconfig/merge_config.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index d924c51d28b7..96e960dce968 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -14,9 +14,10 @@
 #  Copyright 2011 Linaro
 
 clean_up() {
+	RET=$1
 	rm -f $TMP_FILE
 	rm -f $MERGE_FILE
-	exit
+	exit ${RET}
 }
 trap clean_up HUP INT TERM
 
@@ -171,6 +172,10 @@ fi
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
 make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+RET=$?
+if [ "$RET" != "0" ]; then
+	clean_up $RET
+fi
 
 
 # Check all specified config values took (might have missed-dependency issues)
-- 
2.20.1
