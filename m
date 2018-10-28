Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43993 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbeJ1Vjy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Oct 2018 17:39:54 -0400
Received: by mail-wr1-f68.google.com with SMTP id t10-v6so5729890wrn.10
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Oct 2018 05:55:19 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH 1/1] merge_config.sh: Replace prefix CONFIG_ with any prefix
Date: Sun, 28 Oct 2018 13:55:10 +0100
Message-Id: <20181028125510.9346-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Marcel Patzlaff <m.patzlaff@pilz.de>, Nasser Afshin <afshin.nasser@gmail.com>, Angelo Compagnucci <angelo.compagnucci@gmail.com>, Arnout Vandecappelle <arnout@mind.be>, Matthew Weber <matthew.weber@rockwellcollins.com>, John Stultz <john.stultz@linaro.org>

merge_config.sh expect prefix from kernel: CONFIG_.
There some other projects using kconfig with different prefixes
(e.g. buildroot: BR2_ prefix). While there could be some option
to specify config prefix [1] [2], IMHO it's better to not specify
prefix (expect just any prefix).

[1] http://patchwork.ozlabs.org/patch/824051/
[2] https://patchwork.ozlabs.org/patch/988890/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Suggested-by: Marcel Patzlaff <m.patzlaff@pilz.de>
---
NOTE: I deliberately left prefix CONFIG_ in comment:
# allnoconfig: Fills in any missing symbols with # CONFIG_* is not set

Kind regards,
Petr
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 67d131447631..538222848bcf 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -99,7 +99,7 @@ if [ ! -r "$INITFILE" ]; then
 fi
 
 MERGE_LIST=$*
-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+SED_CONFIG_EXP="s/^\(# \)\{0,1\}\([A-Z0-9_]\+_[a-zA-Z0-9_]*\)[= ].*/\2/p"
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
-- 
2.19.1
