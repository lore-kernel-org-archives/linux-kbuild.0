Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:53320 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751186Ab0LEGmK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:42:10 -0500
Received: by mail-gy0-f174.google.com with SMTP id 11so5490213gyb.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:42:09 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 4/5] kconfig/conf: merge duplicate switch's case
Date: Sun,  5 Dec 2010 01:41:17 -0500
Message-Id: <1291531278-7395-4-git-send-email-lacombar@gmail.com>
In-Reply-To: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
References: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/conf.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 1b58129..8e33aa7 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -541,8 +541,6 @@ int main(int ac, char **av)
 		}
 		break;
 	case savedefconfig:
-		conf_read(NULL);
-		break;
 	case silentoldconfig:
 	case oldaskconfig:
 	case oldconfig:
-- 
1.7.2.30.gc37d7.dirty

