Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:56757 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727551AbeKBQ7L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Nov 2018 12:59:11 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: merge_config: avoid false positive matches from comment lines
Date: Fri,  2 Nov 2018 16:52:31 +0900
Message-Id: <1541145151-7319-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Nasser <afshin.nasser@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The current SED_CONFIG_EXP could match to comment lines in config
fragment files, especially when CONFIG_PREFIX_ is empty. For example,
Buildroot uses empty prefixing; starting symbols with BR2_ is just
convention.

Make the sed expression more robust against false positives from
comment lines. The new sed expression matches to config options
followed by '=' or ' is not set'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 7067a9f..180b523 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -103,7 +103,7 @@ if [ ! -r "$INITFILE" ]; then
 fi
 
 MERGE_LIST=$*
-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
+SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)\(=.*\| is not set$\)/\2/p"
 
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 
-- 
2.7.4
