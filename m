Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vms173019pub.verizon.net ([206.46.173.19]:63407 "EHLO
	vms173019pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752502Ab2KRVEt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 18 Nov 2012 16:04:49 -0500
From: pefoley2@verizon.net
Subject: [PATCH 2/5] kbuild: silence rule for extra_certificates
Date: Sun, 18 Nov 2012 15:05:14 -0500
Message-id: <1353269117-39917-2-git-send-email-pefoley2@verizon.net>
In-reply-to: <1353269117-39917-1-git-send-email-pefoley2@verizon.net>
References: <1353269117-39917-1-git-send-email-pefoley2@verizon.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: Peter Foley <pefoley2@verizon.net>

From: Peter Foley <pefoley2@verizon.net>

Silence the touch extra_certificates command

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/Makefile b/kernel/Makefile
index 86e3285..18a0b61 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -137,7 +137,7 @@ ifeq ($(CONFIG_MODULE_SIG),y)
 # Pull the signing certificate and any extra certificates into the kernel
 #
 extra_certificates:
-	touch $@
+	@touch $@
 
 kernel/modsign_pubkey.o: signing_key.x509 extra_certificates
 
-- 
1.8.0

