Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f180.google.com ([209.85.161.180]:59894 "EHLO
	mail-gx0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481Ab0LEGxF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:53:05 -0500
Received: by gxk19 with SMTP id 19so5956086gxk.11
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:53:05 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 1/2] kconfig/conf: kill deadcode
Date: Sun,  5 Dec 2010 01:52:14 -0500
Message-Id: <1291531935-6183-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

This is likely to break the swith statement if the one of the enum member ever
reach 63 ('?').

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/conf.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 8e33aa7..057f49a 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -503,10 +503,6 @@ int main(int ac, char **av)
 			srand(seed);
 			break;
 		}
-		case '?':
-			fprintf(stderr, _("See README for usage info\n"));
-			exit(1);
-			break;
 		}
 	}
 	if (ac == optind) {
-- 
1.7.2.30.gc37d7.dirty

