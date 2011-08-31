Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:63581 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750998Ab1HaIDM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 04:03:12 -0400
Received: by mail-iy0-f174.google.com with SMTP id u26so511509iab.19
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 01:03:11 -0700 (PDT)
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH V2 6/6] scripts/kconfig/nconf: trunc too long string display in menu
Date: Wed, 31 Aug 2011 00:46:13 -0700
Message-Id: <1314776773-9560-7-git-send-email-crquan@gmail.com>
In-Reply-To: <1314776773-9560-6-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
 <1314776773-9560-1-git-send-email-crquan@gmail.com>
 <1314776773-9560-2-git-send-email-crquan@gmail.com>
 <1314776773-9560-3-git-send-email-crquan@gmail.com>
 <1314776773-9560-4-git-send-email-crquan@gmail.com>
 <1314776773-9560-5-git-send-email-crquan@gmail.com>
 <1314776773-9560-6-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

When the string is too long, only show the first COLS/2 bytes wide,
to make sure there is some space to show the menu prompt.

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/nconf.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 4248759..4997ebf 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -887,8 +887,14 @@ static void build_conf(struct menu *menu)
 				break;
 			default:
 				tmp = 2 + strlen(sym_get_string_value(sym));
-				item_make(menu, 's', "    (%s)",
+				if (tmp < COLS/2)
+					item_make(menu, 's', "    (%s)",
 						sym_get_string_value(sym));
+				else {
+					char *s = strndupa(sym_get_string_value(sym), COLS/2);
+					strcpy(s + COLS/2 - 5, " ...");
+					item_make(menu, 's', "    (%s)", s);
+				}
 				tmp = indent - tmp + 4;
 				if (tmp < 0)
 					tmp = 0;
-- 
1.7.6

