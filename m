Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57703 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752177Ab0INDuR convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Sep 2010 23:50:17 -0400
From: Ben Hutchings <ben@decadent.org.uk>
In-Reply-To: <4C8E3B15.2040807@suse.cz>
References: <20100913143830.GK2919@stro.at>  <4C8E3B15.2040807@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Date: Tue, 14 Sep 2010 04:50:09 +0100
Message-ID: <1284436209.5323.744.camel@localhost>
Mime-Version: 1.0
Subject: [PATCH 1/2] Kbuild: Treat KBUILD_DEFCONFIG=old as request to use
 .config as the base
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org, Bastian Blank <waldi@debian.org>

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This should work as a substitute for Debian's updateoldconfig.

Ben.

 scripts/kconfig/Makefile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index cef3f75..19558a7 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -112,9 +112,13 @@ defconfig: $(obj)/conf
 ifeq ($(KBUILD_DEFCONFIG),)
 	$< --defconfig $(Kconfig)
 else
+ifeq ($(KBUILD_DEFCONFIG),old)
+	$< --defconfig=.config $(Kconfig)
+else
 	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
 	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 endif
+endif
 
 %_defconfig: $(obj)/conf
 	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
-- 
1.7.1

-- 
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.
