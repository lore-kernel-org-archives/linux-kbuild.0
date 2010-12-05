Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f42.google.com ([74.125.83.42]:47020 "EHLO
	mail-gw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751186Ab0LEGmL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:42:11 -0500
Received: by gwb20 with SMTP id 20so5688020gwb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:42:10 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 5/5] kconfig: fix `zconfdebug' extern declaration
Date: Sun,  5 Dec 2010 01:41:18 -0500
Message-Id: <1291531278-7395-5-git-send-email-lacombar@gmail.com>
In-Reply-To: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
References: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

This symbol is only exist if YYDEBUG is defined.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/lkc.h |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 16eb416..2b856a8 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -68,10 +68,12 @@ struct kconf_id {
 	enum symbol_type stype;
 };
 
+#ifdef YYDEBUG
+extern int zconfdebug;
+#endif
+
 int zconfparse(void);
 void zconfdump(FILE *out);
-
-extern int zconfdebug;
 void zconf_starthelp(void);
 FILE *zconf_fopen(const char *name);
 void zconf_initscan(const char *name);
-- 
1.7.2.30.gc37d7.dirty

