Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:55770 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751054AbbALNT1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Jan 2015 08:19:27 -0500
From: Colin King <colin.king@canonical.com>
Subject: [PATCH] kconfig: use va_end to match corresponding va_start
Date: Mon, 12 Jan 2015 13:18:26 +0000
Message-Id: <1421068706-3689-1-git-send-email-colin.king@canonical.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Although on some systems va_end is a no-op, it is good practice
to use va_end, especially since the manual states:

"Each invocation of va_start() must be matched by a corresponding
invocation of va_end() in the same function."

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 scripts/kconfig/confdata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index f88d90f..28df18d 100644
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

