Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:49534 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbfELQBY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 12:01:24 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: make conf_get_autoconfig_name() static
Date: Mon, 13 May 2019 01:00:53 +0900
Message-Id: <1557676853-8068-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This is only used in confdata.c

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 2 +-
 scripts/kconfig/lkc.h      | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 8bb74d4..492ac34 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -226,7 +226,7 @@ const char *conf_get_configname(void)
 	return name ? name : ".config";
 }
 
-const char *conf_get_autoconfig_name(void)
+static const char *conf_get_autoconfig_name(void)
 {
 	char *name = getenv("KCONFIG_AUTOCONFIG");
 
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index d871539..cbc7658 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -49,7 +49,6 @@ const char *zconf_curname(void);
 
 /* confdata.c */
 const char *conf_get_configname(void);
-const char *conf_get_autoconfig_name(void);
 char *conf_get_default_confname(void);
 void sym_set_change_count(int count);
 void sym_add_change_count(int count);
-- 
2.7.4
