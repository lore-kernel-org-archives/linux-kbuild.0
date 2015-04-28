Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:12513 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933106AbbD1KeW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Apr 2015 06:34:22 -0400
From: Dave Gordon <david.s.gordon@intel.com>
Subject: [PATCH] kbuild: add jobserver flag (+) to deb-pkg build commands
Date: Tue, 28 Apr 2015 11:33:54 +0100
Message-Id: <1430217234-16190-1-git-send-email-david.s.gordon@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Jonathan Nieder <jrnieder@gmail.com>, Dave Gordon <david.s.gordon@intel.com>

This gets rid of some annoying warnings and allows GNU make to parallelise more
parts of a deb-pkg build. The message is ...

make[3]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.

... so I've added the '+' as suggested.

Signed-off-by: Dave Gordon <david.s.gordon@intel.com>
---
 scripts/package/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 99ca6e7..0dbfae7 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -88,7 +88,7 @@ quiet_cmd_builddeb = BUILDDEB
 
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(call cmd,builddeb)
+	+$(call cmd,builddeb)
 
 clean-dirs += $(objtree)/debian/
 
-- 
1.7.9.5

