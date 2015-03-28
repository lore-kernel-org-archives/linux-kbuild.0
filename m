Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:48469 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752748AbbC1Nhb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 28 Mar 2015 09:37:31 -0400
In-Reply-To: <20150328132320.GA24391@n2100.arm.linux.org.uk>
References: <20150328132320.GA24391@n2100.arm.linux.org.uk>
From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH] dtbsinstall: don't move target directory out of the way
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1YbqvP-000283-5m@rmk-PC.arm.linux.org.uk>
Date: Sat, 28 Mar 2015 13:37:19 +0000
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@linux-foundation.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh@kernel.org>, Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

No other kernel installation target moves the target directory out of
the way, even deleting an old version of it.  These are destructive
operations, ones which the kernel build system should not be making.

Remove this behaviour.

If this behaviour is required at installation time, this should be
done by the installation external to the kernel makefiles, just like
it would be done for 'make modules_install'.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 scripts/Makefile.dtbinst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 909ed7a2ac61..e0254058b0e9 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -23,8 +23,6 @@ include $(srctree)/$(obj)/Makefile
 PHONY += __dtbs_install_prep
 __dtbs_install_prep:
 ifeq ("$(dtbinst-root)", "$(obj)")
-	$(Q)if [ -d $(INSTALL_DTBS_PATH).old ]; then rm -rf $(INSTALL_DTBS_PATH).old; fi
-	$(Q)if [ -d $(INSTALL_DTBS_PATH) ]; then mv $(INSTALL_DTBS_PATH) $(INSTALL_DTBS_PATH).old; fi
 	$(Q)mkdir -p $(INSTALL_DTBS_PATH)
 endif
 
-- 
1.8.3.1

