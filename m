Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:36832 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPyM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:54:12 -0400
Received: by mail-gx0-f174.google.com with SMTP id 23so1555729gxk.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:54:12 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 12/15] kconfig: use the file's name of sourced file
Date: Sat, 11 Sep 2010 11:51:19 -0400
Message-Id: <1284220282-3500-13-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/zconf.l |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index d8f7236..e0cbf8e 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -304,9 +304,10 @@ void zconf_nextfile(const char *name)
 	memset(buf, 0, sizeof(*buf));
 
 	current_buf->state = YY_CURRENT_BUFFER;
-	yyin = zconf_fopen(name);
+	yyin = zconf_fopen(file->name);
 	if (!yyin) {
-		printf("%s:%d: can't open file \"%s\"\n", zconf_curname(), zconf_lineno(), name);
+		printf("%s:%d: can't open file \"%s\"\n",
+		    zconf_curname(), zconf_lineno(), file->name);
 		exit(1);
 	}
 	yy_switch_to_buffer(yy_create_buffer(yyin, YY_BUF_SIZE));
-- 
1.7.2.30.gc37d7.dirty

