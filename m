Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34261 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936Ab1GBFKx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Jul 2011 01:10:53 -0400
Received: by iyb12 with SMTP id 12so3290961iyb.19
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jul 2011 22:10:52 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 4/5] kconfig: remove pending prototypes for kconfig_load()
Date: Sat,  2 Jul 2011 01:10:39 -0400
Message-Id: <1309583440-4795-5-git-send-email-lacombar@gmail.com>
In-Reply-To: <1309583440-4795-1-git-send-email-lacombar@gmail.com>
References: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
 <1309583440-4795-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>

Commit 5a6f8d2bd9e3392569ed6f29ea4d7210652f929b removed `kconfig_load()',
however, it missed an hidden prototypes in `lkc.h'. Fix this.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/lkc.h |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 625ec69..60ffe8c 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -94,9 +94,6 @@ static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
 		fprintf(stderr, "\nError in writing or end of file.\n");
 }
 
-/* kconfig_load.c */
-void kconfig_load(void);
-
 /* menu.c */
 void _menu_init(void);
 void menu_warn(struct menu *menu, const char *fmt, ...);
-- 
1.7.3.4.574.g608b.dirty

