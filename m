Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:55604 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfEJQ44 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 12:56:56 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: remove useless pointer check in conf_write_dep()
Date: Sat, 11 May 2019 01:56:48 +0900
Message-Id: <1557507408-7992-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

conf_write_dep() has just one caller:

    conf_write_dep("include/config/auto.conf.cmd");

"name" always points to a valid string.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 399973e..431b805 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -961,8 +961,6 @@ static int conf_write_dep(const char *name)
 	struct file *file;
 	FILE *out;
 
-	if (!name)
-		name = ".kconfig.d";
 	out = fopen("..config.tmp", "w");
 	if (!out)
 		return 1;
-- 
2.7.4
