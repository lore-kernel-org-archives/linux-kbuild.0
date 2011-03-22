Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linuxtv.org ([130.149.80.248]:58956 "EHLO www.linuxtv.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750757Ab1CVSft (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Mar 2011 14:35:49 -0400
From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Tue, 22 Mar 2011 18:31:26 +0100
Subject: [git:v4l-dvb/for_v2.6.39] [media] saa7134: Fix strange kconfig dependency on RC_CORE
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1Q2683-0005ZV-Bq@www.linuxtv.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxtv-commits@linuxtv.org
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Michal Marek <mmarek@suse.cz>

This is an automatic generated email to let you know that the following patch were queued at the 
http://git.linuxtv.org/media_tree.git tree:

Subject: [media] saa7134: Fix strange kconfig dependency on RC_CORE
Author:  Steven Rostedt <rostedt@goodmis.org>
Date:    Thu Mar 10 19:41:29 2011 -0300

As the code in saa7134-input is not a module, but the config for it is
set as a boolean instead of a tristate, this causes a strange dependency
on RC_CORE.

VIDEO_SAA7134_RC (which determines if saa7134-input.o is built) depends
on RC_CORE and VIDEO_SAA7134. If VIDEO_SAA7134 is compiled as 'y' but
RC_CORE is compiled as 'm' VIDEO_SAA7134_RC can still be set to 'y'
which causes undefined symbols that it needs from RC_CORE.

The simplest solution is to not allow VIDEO_SAA7134_RC be enabled if
RC_CORE compiled as a module (m) and VIDEO_SA7134 is compiled into the
kernel (y).

Suggested-by: Mauro Carvalho Chehab <mchehab@redhat.com>

Cc: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>

 drivers/media/video/saa7134/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

---

http://git.linuxtv.org/media_tree.git?a=commitdiff;h=7c696f20036849846aa8a1d2ea895f1ab59e0c8e

diff --git a/drivers/media/video/saa7134/Kconfig b/drivers/media/video/saa7134/Kconfig
index 380f1b2..39fc018 100644
--- a/drivers/media/video/saa7134/Kconfig
+++ b/drivers/media/video/saa7134/Kconfig
@@ -28,6 +28,7 @@ config VIDEO_SAA7134_RC
 	bool "Philips SAA7134 Remote Controller support"
 	depends on RC_CORE
 	depends on VIDEO_SAA7134
+	depends on !(RC_CORE=m && VIDEO_SAA7134=y)
 	default y
 	---help---
 	  Enables Remote Controller support on saa7134 driver.
