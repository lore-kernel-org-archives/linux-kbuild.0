Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:47639 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754977AbbGCLzN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 07:55:13 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] kconfig: Wrap long "make help" text line for xenconfig
Date: Fri,  3 Jul 2015 13:55:13 +0200
Message-Id: <1435924513-17766-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: "Luis R. Rodriguez" <mcgrof@suse.com>, David Vrabel <david.vrabel@citrix.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

The "make help" text line for xenconfig extends beyond 80 characters.
Wrap it at 79 characters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 scripts/kconfig/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index aceaaed098112dbc..e829ad1668f527f7 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -146,7 +146,8 @@ help:
 	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their'
 	@echo  '                    default value'
 	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
-	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
+	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel'
+	@echo  '                    support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 
 # lxdialog stuff
-- 
1.9.1

