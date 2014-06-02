Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from benson.vm.bytemark.co.uk ([212.110.190.137]:45409 "EHLO
	benson.vm.bytemark.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751567AbaFBHQ3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Jun 2014 03:16:29 -0400
From: Ian Campbell <ijc@hellion.org.uk>
Subject: [PATCH] deb-pkg: Apply $(CROSS_COMPILE) when calling objcopy
Date: Mon,  2 Jun 2014 07:47:37 +0100
Message-Id: <1401691657-12222-1-git-send-email-ijc@hellion.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org, Ian Campbell <ijc@hellion.org.uk>

Allows me to cross build an armhf package from amd64.

Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
---
 scripts/package/builddeb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f46e4dd..c22ab79 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -155,11 +155,11 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 			for module in $(find lib/modules/ -name *.ko); do
 				mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
 				# only keep debug symbols in the debug file
-				objcopy --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
+				${CROSS_COMPILE}objcopy --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
 				# strip original module from debug symbols
-				objcopy --strip-debug $module
+				${CROSS_COMPILE}objcopy --strip-debug $module
 				# then add a link to those
-				objcopy --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
+				${CROSS_COMPILE}objcopy --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
 			done
 		)
 	fi
-- 
1.9.0

