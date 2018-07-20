Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:54496 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbeGTIfi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 04:35:38 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v2] checkpatch: kbuild: if_changed: check for multiple calls in targets
Date: Fri, 20 Jul 2018 09:48:04 +0200
Message-Id: <20180720074804.4160-1-dirk@gouders.net>
In-Reply-To: <ghy3eafbrf.fsf@lena.gouders.net>
References: <ghy3eafbrf.fsf@lena.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Dirk Gouders <dirk@gouders.net>, Andy Whitcroft <apw@canonical.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The kbuild function if_changed should not be called more than once for
a target.

Because that function writes the command line to a .cmd file for later
tests, multiple calls of it within a target would result in overwrites
of previous values and effectively render the command line test
meaningless, resulting in flip-flop behaviour.

Add a check for makefiles and kbuild files and produce an error for
targets with multiple calls to if_changed.

Three examples that now could be detected:

98f78525371b55ccd (x86/boot: Refuse to build with data relocations)
6a8dfe1cac5c591ae (microblaze: support U-BOOT image format)
684151a75bf25f5ae (sparc32: added U-Boot build target: uImage)

Reviewed-by: Joe Perches <joe@perches.com>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
v2: rework commit message and regular expression
---
 scripts/checkpatch.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 447857ffaf6b..437e98414f74 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2911,6 +2911,14 @@ sub process {
 			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
 		}
 
+		# Check for multiple calls of if_changed within a target in Makefiles
+		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
+		    ($prevline =~ /^[ +]\t\s*\$\(call\s+if_changed,/) &&
+		    ($line =~ /^[ +]\t\s*\$\(call\s+if_changed,/)) {
+				ERROR("MULTIPLE_IF_CHANGED",
+				      "Multiple calls of if_changed within a target.\n" . $herecurr);
+		}
+
 # check for DT compatible documentation
 		if (defined $root &&
 			(($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*compatible\s*=\s*\"/) ||
-- 
2.16.1

