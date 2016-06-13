Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:55659 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423581AbcFMVTb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Jun 2016 17:19:31 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/3] Kbuild: avoid duplicate include path
Date: Mon, 13 Jun 2016 23:19:46 +0200
Message-Id: <1465852786-3559357-3-git-send-email-arnd@arndb.de>
In-Reply-To: <1465852786-3559357-1-git-send-email-arnd@arndb.de>
References: <1465852786-3559357-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

arch/$(hdr-arch)/include/generated/uapi is included twice in the
header search path, which is unnecessary, so this changes the
top-level Makefile to drop the second instance by filtering out
everything from USERINCLUDE that was already part of LINUXINCLUDE.

This should have very little effect other than making the 'make V=1'
output slightly smaller and making the build time faster by a miniscule
amount, but it seems to be cleaner.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a1551fe4d829..abaffba5ff11 100644
--- a/Makefile
+++ b/Makefile
@@ -389,8 +389,9 @@ LINUXINCLUDE    := \
 		-Iarch/$(hdr-arch)/include/generated/uapi \
 		-Iarch/$(hdr-arch)/include/generated \
 		$(if $(KBUILD_SRC), -I$(srctree)/include) \
-		-Iinclude \
-		$(USERINCLUDE)
+		-Iinclude
+
+LINUXINCLUDE	+= $(filter-out $(LINUXINCLUDE),$(USERINCLUDE))
 
 KBUILD_CPPFLAGS := -D__KERNEL__
 
-- 
2.7.0

