Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:45289 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754456AbbEKOC3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 May 2015 10:02:29 -0400
From: Chris J Arges <chris.j.arges@canonical.com>
Subject: [PATCH 2/2] builddeb: parallelize debug module installation
Date: Mon, 11 May 2015 09:02:26 -0500
Message-Id: <1431352946-6691-3-git-send-email-chris.j.arges@canonical.com>
In-Reply-To: <1431352946-6691-1-git-send-email-chris.j.arges@canonical.com>
References: <1431352946-6691-1-git-send-email-chris.j.arges@canonical.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When building the dbg package, we use a large 'for module in $(find' loop that
can be easily parallelized by using 'find | xargs'. This patch modifies this
loop to use the later paradigm.

In addition, check if the user has requested a parallel build with make. If so,
add the appropriate flags to xargs to set MAXPROCS (-P) equal to the number of
processing units on the system.

Signed-off-by: Chris J Arges <chris.j.arges@canonical.com>
---
 scripts/package/builddeb | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 88dbf23..5849f0c 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -152,16 +152,21 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 		rmdir "$tmpdir/lib/modules/$version"
 	fi
 	if [ -n "$BUILD_DEBUG" ] ; then
-		for module in $(find $tmpdir/lib/modules/ -name *.ko -printf '%P\n'); do
-			module=lib/modules/$module
-			mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
+		# If we've invoked make with -j, then parallelize; otherwise
+		# just use a single process.
+		procs=1
+		test "${MAKEFLAGS#*-j}" != "${MAKEFLAGS}" && procs=`getconf _NPROCESSORS_ONLN`
+		find $tmpdir/lib/modules/ -name *.ko -printf '%P\n' | xargs -n1 -P${procs} -I {} sh -c '
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

