Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:59167 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753008Ab3FXSMb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Jun 2013 14:12:31 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 13/15] kconfig/[mn]conf: make it explicit in the search box that a regexp is possible
Date: Mon, 24 Jun 2013 20:11:57 +0200
Message-Id: <a1ce636f560336ba007bfabb15b167ff31b592cf.1372097219.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1372097219.git.yann.morin.1998@free.fr>
References: <cover.1372097219.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1372097219.git.yann.morin.1998@free.fr>
References: <cover.1372097219.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Jean Delvare <jdelvare@suse.de>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reported-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Jean Delvare <jdelvare@suse.de>
Cc: Michal Marek <mmarek@suse.cz>
---
 scripts/kconfig/mconf.c | 2 +-
 scripts/kconfig/nconf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 6ee4aae..18d3dc9 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -401,7 +401,7 @@ static void search_conf(void)
 	struct subtitle_part stpart;
 
 	title = str_new();
-	str_printf( &title, _("Enter %s (sub)string to search for "
+	str_printf( &title, _("Enter %s (sub)string or regexp to search for "
 			      "(with or without \"%s\")"), CONFIG_, CONFIG_);
 
 again:
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 0183153..7975d8d 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -695,7 +695,7 @@ static void search_conf(void)
 	int dres;
 
 	title = str_new();
-	str_printf( &title, _("Enter %s (sub)string to search for "
+	str_printf( &title, _("Enter %s (sub)string or regexp to search for "
 			      "(with or without \"%s\")"), CONFIG_, CONFIG_);
 
 again:
-- 
1.8.1.2

