Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:36710 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750950AbbCPIVE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Mar 2015 04:21:04 -0400
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH] builddeb: fix stripped module signatures if CONFIG_DEBUG_INFO and CONFIG_MODULE_SIG_ALL are set
Date: Mon, 16 Mar 2015 11:20:54 +0300
Message-Id: <1426494054-32138-1-git-send-email-andrej.skvortzov@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>

If CONFIG_MODULE_SIG_ALL is set, then user expects that all modules are
automatically signed in the result package, as it's for rpm-pkg, binrpm-pkg,
tar, tar-*. For deb-pkg this is correct only if CONFIG_DEBUG_INFO
is NOT set. In that case deb-package contains signed modules.

But if CONFIG_DEBUG_INFO is set, builddeb creates separate package with
debug information. To do that, debug information from all modules
is copied into separate files by objcopy. And loadable kernel modules are
stripped afterwards. Stripping removes previously (during modules_install)
added signatures from loadable kernel modules. Therefore final deb-package
contains unsigned modules despite of set option CONFIG_MODULE_SIG_ALL.

This patch resigns all stripped modules if CONFIG_MODULE_SIG_ALL is set
to solve this problem.

Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---
 scripts/package/builddeb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 88dbf23..977c4d7 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -162,6 +162,12 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 			# then add a link to those
 			$OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $tmpdir/$module
 		done
+
+                # resign stripped modules
+                MODULE_SIG_ALL="$(grep -s '^CONFIG_MODULE_SIG_ALL=y' $KCONFIG_CONFIG || true)"
+                if [ -n "$MODULE_SIG_ALL" ]; then
+	            	INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_sign
+                fi
 	fi
 fi
 
-- 
1.7.10.4

