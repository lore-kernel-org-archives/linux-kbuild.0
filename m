Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [183.91.158.132] ([183.91.158.132]:15817 "EHLO
        heian.cn.fujitsu.com" rhost-flags-FAIL-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752075AbdHHNPy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Aug 2017 09:15:54 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] fixdep: trivial: typo fix and correction
Date: Tue, 8 Aug 2017 21:20:50 +0800
Message-ID: <1502198450-7374-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 scripts/basic/fixdep.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index fff818b..bbf62cb 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -25,7 +25,7 @@
  *
  * So we play the same trick that "mkdep" played before. We replace
  * the dependency on autoconf.h by a dependency on every config
- * option which is mentioned in any of the listed prequisites.
+ * option which is mentioned in any of the listed prerequisites.
  *
  * kconfig populates a tree in include/config/ with an empty file
  * for each config symbol and when the configuration is updated
@@ -34,7 +34,7 @@
  * the config symbols are rebuilt.
  *
  * So if the user changes his CONFIG_HIS_DRIVER option, only the objects
- * which depend on "include/linux/config/his/driver.h" will be rebuilt,
+ * which depend on "include/config/his/driver.h" will be rebuilt,
  * so most likely only his driver ;-)
  *
  * The idea above dates, by the way, back to Michael E Chastain, AFAIK.
@@ -75,7 +75,7 @@
  * and then basically copies the .<target>.d file to stdout, in the
  * process filtering out the dependency on autoconf.h and adding
  * dependencies on include/config/my/option.h for every
- * CONFIG_MY_OPTION encountered in any of the prequisites.
+ * CONFIG_MY_OPTION encountered in any of the prerequisites.
  *
  * It will also filter out all the dependencies on *.ver. We need
  * to make sure that the generated version checksum are globally up
-- 
2.1.0



