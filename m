Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from maxwell.derobert.net ([72.83.229.69]:49331 "EHLO
	Maxwell.derobert.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751765AbaJJSei (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Oct 2014 14:34:38 -0400
Date: Fri, 10 Oct 2014 13:49:43 -0400
From: Anthony DeRobertis <anthony@derobert.net>
Subject: [PATCH] deb-pkg: Another fix for relative paths.
Message-ID: <20141010174943.GQ19800@derobert.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org


Similar to a765a7ce293aa0a072728790ce11088b2f7030e2, the -dbg package
build did a cd, breaking relative paths. This resulted in the debug
symbols being part of the kernel image package and further installed
under /debian instead of /.

Signed-off-by: Anthony DeRobertis <anthony@derobert.net>
---
 scripts/package/builddeb | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 35d5a58..e6d70d8 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -152,18 +152,15 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 		rmdir "$tmpdir/lib/modules/$version"
 	fi
 	if [ -n "$BUILD_DEBUG" ] ; then
-		(
-			cd $tmpdir
-			for module in $(find lib/modules/ -name *.ko); do
-				mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
-				# only keep debug symbols in the debug file
-				$OBJCOPY --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
-				# strip original module from debug symbols
-				$OBJCOPY --strip-debug $module
-				# then add a link to those
-				$OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
-			done
-		)
+		for module in $(cd $tmpdir && find lib/modules/ -name *.ko); do
+			mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
+			# only keep debug symbols in the debug file
+			$OBJCOPY --only-keep-debug $tmpdir/$module $dbg_dir/usr/lib/debug/$module
+			# strip original module from debug symbols
+			$OBJCOPY --strip-debug $tmpdir/$module
+			# then add a link to those
+			$OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $tmpdir/$module
+		done
 	fi
 fi
 
-- 
2.1.1


