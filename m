Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:41702 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754027AbaDLKNs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Apr 2014 06:13:48 -0400
Received: by mail-la0-f54.google.com with SMTP id mc6so4241907lab.41
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Apr 2014 03:13:46 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH] builddeb: use $OBJCOPY variable instead of objcopy
Date: Sat, 12 Apr 2014 13:13:24 +0300
Message-Id: <1397297604-4271-1-git-send-email-fathi.boudra@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Maximilian Attems <max@stro.at>, Fathi Boudra <fathi.boudra@linaro.org>

In cross-build environment, we expect to use the cross-compiler objcopy
instead of the host objcopy.

It fixes following build failures:
objcopy --only-keep-debug lib/modules/3.14/kernel/net/ipv6/xfrm6_mode_tunnel.ko /srv/build/linux/debian/dbgtmp/usr/lib/debug/lib/modules/3.14/kernel/net/ipv6/xfrm6_mode_tunnel.ko
objcopy: Unable to recognise the format of the input file `lib/modules/3.14/kernel/net/ipv6/xfrm6_mode_tunnel.ko'

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 scripts/package/builddeb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f46e4dd..152d4d2 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -155,11 +155,11 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 			for module in $(find lib/modules/ -name *.ko); do
 				mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
 				# only keep debug symbols in the debug file
-				objcopy --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
+				$OBJCOPY --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
 				# strip original module from debug symbols
-				objcopy --strip-debug $module
+				$OBJCOPY --strip-debug $module
 				# then add a link to those
-				objcopy --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
+				$OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
 			done
 		)
 	fi
-- 
1.9.1

