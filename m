Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f180.google.com ([209.85.161.180]:55425 "EHLO
	mail-gx0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481Ab0LEGcr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:32:47 -0500
Received: by gxk19 with SMTP id 19so5951615gxk.11
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:32:46 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kconfig: do not define AUTOCONF_INCLUDED
Date: Sun,  5 Dec 2010 01:31:57 -0500
Message-Id: <1291530717-26889-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

AUTOCONF_INCLUDED is not checked is not used within the tree and its parent
header, `autoconf.h', is safe to be re-included.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/confdata.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 9df8011..f349bdc 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -833,8 +833,7 @@ int conf_write_autoconf(void)
 		       " * Automatically generated C config: don't edit\n"
 		       " * %s\n"
 		       " * %s"
-		       " */\n"
-		       "#define AUTOCONF_INCLUDED\n",
+		       " */\n",
 		       rootmenu.prompt->text, ctime(&now));
 
 	for_all_symbols(i, sym) {
-- 
1.7.2.30.gc37d7.dirty

