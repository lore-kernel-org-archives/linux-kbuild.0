Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:50377 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965559AbbDXSZ4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Apr 2015 14:25:56 -0400
From: Chris J Arges <chris.j.arges@canonical.com>
Subject: [PATCH 2/2] builddeb: parallelize debug module installation
Date: Fri, 24 Apr 2015 13:25:40 -0500
Message-Id: <1429899940-32366-3-git-send-email-chris.j.arges@canonical.com>
In-Reply-To: <1429899940-32366-1-git-send-email-chris.j.arges@canonical.com>
References: <1429899940-32366-1-git-send-email-chris.j.arges@canonical.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: linux-kernel@vger.kernel.org, Chris J Arges <chris.j.arges@canonical.com>

When building the dbg package, we use a large 'for module in $(find' loop that
can be easily parallelized by using 'find | xargs'. This patch modifies this
loop to use the later paradigm.

Signed-off-by: Chris J Arges <chris.j.arges@canonical.com>
---
 scripts/package/builddeb | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 88dbf23..d12d062 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -152,16 +152,17 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 		rmdir "$tmpdir/lib/modules/$version"
 	fi
 	if [ -n "$BUILD_DEBUG" ] ; then
-		for module in $(find $tmpdir/lib/modules/ -name *.ko -printf '%P\n'); do
-			module=lib/modules/$module
-			mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
+		find $tmpdir/lib/modules/ -name *.ko -printf '%P\n' | xargs -I {} sh -c '
+			mkdir -p $(dirname '"$dbg_dir"'/usr/lib/debug/lib/modules/$1);'"
 			# only keep debug symbols in the debug file
-			$OBJCOPY --only-keep-debug $tmpdir/$module $dbg_dir/usr/lib/debug/$module
+			$OBJCOPY --only-keep-debug $tmpdir/lib/modules/{} \
+				$dbg_dir/usr/lib/debug/lib/modules/{};
 			# strip original module from debug symbols
-			$OBJCOPY --strip-debug $tmpdir/$module
+			$OBJCOPY --strip-debug $tmpdir/lib/modules/{};
 			# then add a link to those
-			$OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $tmpdir/$module
-		done
+			$OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/lib/modules/{} \
+				$tmpdir/lib/modules/{};
+		" -- {}
 	fi
 fi
 
-- 
1.9.1

