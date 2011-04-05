Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44440 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754072Ab1DEO7f (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 10:59:35 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 11/34] nozomi: Drop __TIME__ usage
Date: Tue,  5 Apr 2011 16:58:58 +0200
Message-Id: <1302015561-21047-12-git-send-email-mmarek@suse.cz>
In-Reply-To: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

The kernel already prints its build timestamp during boot, no need to
repeat it in random drivers and produce different object files each
time.

Cc: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 drivers/char/nozomi.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/char/nozomi.c b/drivers/char/nozomi.c
index 294d03e..33f6e6a 100644
--- a/drivers/char/nozomi.c
+++ b/drivers/char/nozomi.c
@@ -61,8 +61,7 @@
 #include <linux/delay.h>
 
 
-#define VERSION_STRING DRIVER_DESC " 2.1d (build date: " \
-					__DATE__ " " __TIME__ ")"
+#define VERSION_STRING DRIVER_DESC " 2.1d"
 
 /*    Macros definitions */
 
-- 
1.7.4.1

