Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44471 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754158Ab1DEO7j (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 10:59:39 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 30/34] rio: Drop __DATE__ usage
Date: Tue,  5 Apr 2011 16:59:17 +0200
Message-Id: <1302015561-21047-31-git-send-email-mmarek@suse.cz>
In-Reply-To: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

The kernel already prints its build timestamp during boot, no need to
repeat it in random drivers and produce different object files each
time. As the buildDate field is part of the userspace API, I replaced it
with the date of the last code change.

Cc: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 drivers/char/rio/rioinit.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/rio/rioinit.c b/drivers/char/rio/rioinit.c
index 24a282b..fb62b38 100644
--- a/drivers/char/rio/rioinit.c
+++ b/drivers/char/rio/rioinit.c
@@ -381,7 +381,7 @@ struct rioVersion *RIOVersid(void)
 {
     strlcpy(stVersion.version, "RIO driver for linux V1.0",
 	    sizeof(stVersion.version));
-    strlcpy(stVersion.buildDate, __DATE__,
+    strlcpy(stVersion.buildDate, "Aug 15 2010",
 	    sizeof(stVersion.buildDate));
 
     return &stVersion;
-- 
1.7.4.1

