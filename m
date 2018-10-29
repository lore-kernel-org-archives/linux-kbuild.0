Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53110 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbeJ3GBd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 02:01:33 -0400
Received: by mail-wm1-f67.google.com with SMTP id 189-v6so9711153wmw.2
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Oct 2018 14:11:06 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH v2 1/1] merge_config.sh: Allow to define config prefix
Date: Mon, 29 Oct 2018 22:10:58 +0100
Message-Id: <20181029211058.7062-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Marcel Patzlaff <m.patzlaff@pilz.de>, Nasser Afshin <afshin.nasser@gmail.com>, Angelo Compagnucci <angelo.compagnucci@gmail.com>, Arnout Vandecappelle <arnout@mind.be>, Matthew Weber <matthew.weber@rockwellcollins.com>, John Stultz <john.stultz@linaro.org>

with CONFIG_ environment variable.

merge_config.sh uses CONFIG_ which is used in kernel and other projects.
There are some projects which use kconfig with different prefixes (e.g.
buildroot: BR2_ prefix). CONFIG_ variable is already used for this
purpose in kconfig binary (scripts/kconfig/lkc.h), let's use the same
rule for in merge_config.sh.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---
 scripts/kconfig/merge_config.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 67d131447631..7067a9fe0fa3 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -26,6 +26,8 @@ clean_up() {
 }
 trap clean_up HUP INT TERM
 
+CONFIG_PREFIX=${CONFIG_-CONFIG_}
+
 usage() {
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
 	echo "  -h    display this help text"
@@ -33,6 +35,8 @@ usage() {
 	echo "  -n    use allnoconfig instead of alldefconfig"
 	echo "  -r    list redundant entries when merging fragments"
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
+	echo
+	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
 }
 
 RUNMAKE=true
@@ -99,7 +103,8 @@ if [ ! -r "$INITFILE" ]; then
 fi
 
 MERGE_LIST=$*
-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
+
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
-- 
2.19.1
