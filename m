Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:43144 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750893Ab1FYH2H (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 25 Jun 2011 03:28:07 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] staging: iio light Kconfig fixlet
Date: Sat, 25 Jun 2011 09:28:02 +0200
Message-Id: <1308986882-29183-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jonathan Cameron <jic23@cam.ac.uk>, maximilian attems <max@stro.at>

No point to start comments with '\'.

Signed-off-by: maximilian attems <max@stro.at>
---
 drivers/staging/iio/light/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/iio/light/Kconfig b/drivers/staging/iio/light/Kconfig
index 46d62d1..1ad2d56 100644
--- a/drivers/staging/iio/light/Kconfig
+++ b/drivers/staging/iio/light/Kconfig
@@ -1,4 +1,4 @@
-\#
+#
 # Light sensors
 #
 comment "Light sensors"
-- 
1.7.2.5

