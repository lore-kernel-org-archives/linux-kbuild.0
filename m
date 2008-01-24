Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42768 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758775AbYAXWDs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:48 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 10/77] convert drivers/base/power/Makefile to ccflags
Date: Thu, 24 Jan 2008 23:02:51 +0100
Message-Id: <1201212238-4369-10-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Sam Ravnborg <sam@ravnborg.org>

From: Johannes Berg <johannes@sipsolutions.net>

This patch converts drivers/base/power/Makefile to use ccflags instead
of EXTRA_CFLAGS.

Signed-off-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/base/power/Makefile |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/base/power/Makefile b/drivers/base/power/Makefile
index 44504e6..15e2f1d 100644
--- a/drivers/base/power/Makefile
+++ b/drivers/base/power/Makefile
@@ -3,9 +3,5 @@ obj-$(CONFIG_PM)	+= sysfs.o
 obj-$(CONFIG_PM_SLEEP)	+= main.o
 obj-$(CONFIG_PM_TRACE)	+= trace.o
 
-ifeq ($(CONFIG_DEBUG_DRIVER),y)
-EXTRA_CFLAGS += -DDEBUG
-endif
-ifeq ($(CONFIG_PM_VERBOSE),y)
-EXTRA_CFLAGS += -DDEBUG
-endif
+ccflags-$(CONFIG_DEBUG_DRIVER) := -DDEBUG
+ccflags-$(CONFIG_PM_VERBOSE)   += -DDEBUG
-- 
1.5.4.rc3.14.g44397

