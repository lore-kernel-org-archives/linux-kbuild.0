Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f180.google.com ([209.85.161.180]:57318 "EHLO
	mail-gx0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481Ab0LEGaR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:30:17 -0500
Received: by gxk19 with SMTP id 19so5951049gxk.11
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:30:16 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 1/5] kconfig: make hexadecimal prefix mandatory for S_HEX default value
Date: Sun,  5 Dec 2010 01:29:24 -0500
Message-Id: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/symbol.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index af6e9f3..ad7dbe7 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -548,8 +548,10 @@ bool sym_string_valid(struct symbol *sym, const char *str)
 		}
 		return true;
 	case S_HEX:
-		if (str[0] == '0' && (str[1] == 'x' || str[1] == 'X'))
-			str += 2;
+		if (str[0] != '\0' &&
+		    !(str[0] == '0' && (str[1] == 'x' || str[1] == 'X')))
+			return false;
+		str += 2;
 		ch = *str++;
 		do {
 			if (!isxdigit(ch))
-- 
1.7.2.30.gc37d7.dirty

