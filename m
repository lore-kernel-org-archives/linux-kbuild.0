Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from s3.sipsolutions.net ([5.9.151.49]:33167 "EHLO sipsolutions.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756033AbbCRRQv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2015 13:16:51 -0400
From: Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH] kconfig: add missing va_end()
Date: Wed, 18 Mar 2015 18:16:47 +0100
Message-Id: <1426699007-10933-1-git-send-email-johannes@sipsolutions.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>

From: Johannes Berg <johannes.berg@intel.com>

This was pointed out by static checker analysis, but is likely
otherwise harmless. Add it anyway to confuse the reader less.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 scripts/kconfig/confdata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index f88d90f20228..28df18dd1147 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -59,6 +59,7 @@ static void conf_message(const char *fmt, ...)
 	va_start(ap, fmt);
 	if (conf_message_callback)
 		conf_message_callback(fmt, ap);
+	va_end(ap);
 }
 
 const char *conf_get_configname(void)
-- 
2.1.4

