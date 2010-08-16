Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:52731 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627Ab0HPE2w (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 00:28:52 -0400
Received: by mail-yw0-f46.google.com with SMTP id 1so1735284ywh.19
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Aug 2010 21:28:52 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 4/4] kbuild: fix typo
Date: Mon, 16 Aug 2010 00:19:06 -0400
Message-Id: <1281932346-19067-4-git-send-email-lacombar@gmail.com>
In-Reply-To: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
References: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/nconf.gui.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index a9d9344..b573845 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -137,7 +137,7 @@ void set_colors()
 	if (has_colors()) {
 		normal_color_theme();
 	} else {
-		/* give deafults */
+		/* give defaults */
 		no_colors_theme();
 	}
 }
-- 
1.7.2.30.gc37d7.dirty

