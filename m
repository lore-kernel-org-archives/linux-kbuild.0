Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:53320 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751186Ab0LEGmH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:42:07 -0500
Received: by gyb11 with SMTP id 11so5490213gyb.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:42:06 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 1/5] kbuild/nconf: fix spaces damage
Date: Sun,  5 Dec 2010 01:41:14 -0500
Message-Id: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/nconf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 272a987..eda49ff 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -248,7 +248,7 @@ search_help[] = N_(
 "Only relevant lines are shown.\n"
 "\n\n"
 "Search examples:\n"
-"Examples: USB   = > find all symbols containing USB\n"
+"Examples: USB  => find all symbols containing USB\n"
 "          ^USB => find all symbols starting with USB\n"
 "          USB$ => find all symbols ending with USB\n"
 "\n");
-- 
1.7.2.30.gc37d7.dirty

