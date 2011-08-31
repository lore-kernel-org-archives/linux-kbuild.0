Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58124 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754670Ab1HaJpt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 05:45:49 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id ED01D8D40D
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 11:45:48 +0200 (CEST)
From: Jiaju Zhang <jjzhang@suse.de>
Subject: [PATCH] Kconfig: Fix help message for DEFAULT_HUNG_TASK_TIMEOUT
Date: Wed, 31 Aug 2011 17:43:29 +0800
Message-Id: <1314783809-20903-1-git-send-email-jjzhang@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: jkosina@suse.cz, mmarek@suse.cz, Jiaju Zhang <jjzhang@suse.de>

Added missing _secs in the help message of config DEFAULT_HUNG_TASK_TIMEOUT.

Signed-off-by: Jiaju Zhang <jjzhang@suse.de>
---
 lib/Kconfig.debug |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index c0cb9c4..f285553 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -248,8 +248,9 @@ config DEFAULT_HUNG_TASK_TIMEOUT
 	  to determine when a task has become non-responsive and should
 	  be considered hung.
 
-	  It can be adjusted at runtime via the kernel.hung_task_timeout
-	  sysctl or by writing a value to /proc/sys/kernel/hung_task_timeout.
+	  It can be adjusted at runtime via the kernel.hung_task_timeout_secs
+	  sysctl or by writing a value to
+	  /proc/sys/kernel/hung_task_timeout_secs.
 
 	  A timeout of 0 disables the check.  The default is two minutes.
 	  Keeping the default should be fine in most cases.
-- 
1.6.0.2

