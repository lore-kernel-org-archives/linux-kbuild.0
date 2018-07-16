Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:36140 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728437AbeGPNHF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Jul 2018 09:07:05 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] checkpatch: if_changed: check for multiple calls in targets
Date: Mon, 16 Jul 2018 14:39:02 +0200
Message-Id: <20180716123902.5337-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: Dirk Gouders <dirk@gouders.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Because the kbuild function if_changed writes the command line to a
.cmd file for later tests, multiple calls of that function within a
target would result in overwrites of previous values and effectively
render the command line test meaningless, resulting in flip-flop
behaviour.

Produce an error for targets with multiple calls to if_changed.

Three examples that would now be detected:

98f78525371b55ccd (x86/boot: Refuse to build with data relocations)
6a8dfe1cac5c591ae (microblaze: support U-BOOT image format)
684151a75bf25f5ae (sparc32: added U-Boot build target: uImage)

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/checkpatch.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 447857ffaf6b..b0aadf23148e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2911,6 +2911,14 @@ sub process {
 			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
 		}
 
+		# Check for multiple calls of if_changed within a target in Makefiles
+		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
+		    ($prevline =~ /^[ +]\t\$\(call if_changed,/) &&
+		    ($line =~ /^[ +]\t\$\(call if_changed,/)) {
+				ERROR("MULTIPLE_IF_CHANGED",
+				      "Multiple calls of if_changed within a target.\n" . $herecurr);
+		}
+
 # check for DT compatible documentation
 		if (defined $root &&
 			(($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*compatible\s*=\s*\"/) ||
-- 
2.17.1

