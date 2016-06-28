Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail0.toppoint.de ([217.70.197.20]:55625 "EHLO
	mail0.toppoint.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203AbcF1Mb2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Jun 2016 08:31:28 -0400
Date: Tue, 28 Jun 2016 12:21:33 +0000
From: Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>
Subject: [REPOST 2, PATCH] builddeb: really include objtool binary in headers
 package
Message-ID: <20160628122133.GE3554@kaos.lebenslange-mailadresse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: bjorn@mork.no, mmarek@suse.cz

[added linux-kbuild@vger.kernel.org to Cc:, added Fixes:]

On May 4th, Bjørn Mork provided patch
697bbc7b832048d3a679cd55caf2268a325efbe0 to include objtool binaries in
the headers package. However, that one only works if $srctree=$objtree,
because the objtool binaries are not written to the srctree, but
to the objtree.

Signed-off-by: Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>
Fixes: 697bbc7b8320 ("builddeb: include objtool binary in headers package")
---
 builddeb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 86e56fe..202d6e7 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -322,12 +322,12 @@ fi
 
 # Build kernel header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
-if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
-	(cd $srctree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrsrcfiles"
-fi
 (cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
+if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
+	(cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
+fi
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-- 



