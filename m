Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:59218 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751621AbcEDNfy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2016 09:35:54 -0400
From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH] builddeb: include objtool binary in headers package
Date: Wed,  4 May 2016 15:35:39 +0200
Message-Id: <1462368939-1018-1-git-send-email-bjorn@mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>

"objtool" is required for building external m dules if "Compile-time
stack metadata validation" is enabled.  Otherwise all builds based
on the headers package fail with:

 make[1]: Entering directory '/usr/src/linux-headers-4.6.0-rc6'
 make[2]: *** No rule to make target 'tools/objtool/objtool', needed by 'foo.o'.  Stop.
 Makefile:1598: recipe for target 'foo.ko' failed
 make[1]: *** [foo.ko] Error 2
 make[1]: Leaving directory '/usr/src/linux-headers-4.6.0-rc6'

Signed-off-by: Bjørn Mork <bjorn@mork.no>
---
 scripts/package/builddeb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6c3b038ef40d..93d3b157298d 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -322,6 +322,9 @@ fi
 
 # Build kernel header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
+if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
+	(cd $srctree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrsrcfiles"
+fi
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
-- 
2.1.4

