Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:53044 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbeK3UZx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Nov 2018 15:25:53 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/5] kconfig: rename conf_split_config() to conf_touch_deps()
Date: Fri, 30 Nov 2018 18:15:49 +0900
Message-Id: <1543569352-4899-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543569352-4899-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543569352-4899-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

According to commit 2e3646e51b2d ("kconfig: integrate split config
into silentoldconfig"), this function was named after split-include
tool, which used to exist in old versions of Linux.

Setting aside the historical reason, rename it into a more intuitive
name. This function touches timestamp files under include/config/
in order to interact with the fixdep tool.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 1e35529..4c76d56 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -906,7 +906,7 @@ static int conf_write_dep(const char *name)
 	return 0;
 }
 
-static int conf_split_config(void)
+static int conf_touch_deps(void)
 {
 	const char *name;
 	char path[PATH_MAX+1];
@@ -1028,7 +1028,7 @@ int conf_write_autoconf(int overwrite)
 
 	conf_write_dep("include/config/auto.conf.cmd");
 
-	if (conf_split_config())
+	if (conf_touch_deps())
 		return 1;
 
 	out = fopen(".tmpconfig", "w");
-- 
2.7.4
