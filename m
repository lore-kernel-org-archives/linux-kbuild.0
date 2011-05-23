Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-px0-f173.google.com ([209.85.212.173]:50535 "EHLO
	mail-px0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756404Ab1EWSpP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 14:45:15 -0400
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 3/3] in scripts/export_report.pl use warn() to issue WARNING, so they go to stderr.
Date: Mon, 23 May 2011 12:44:57 -0600
Message-Id: <1306176297-6964-4-git-send-email-jim.cromie@gmail.com>
In-Reply-To: <1306176297-6964-1-git-send-email-jim.cromie@gmail.com>
References: <1305966108-13399-4-git-send-email-jim.cromie@gmail.com>
 <1306176297-6964-1-git-send-email-jim.cromie@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rdunlap@xenotime.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>

Also count CONFIG_MODVERSIONS warnings, and print a NOTE at start of
SECTION 2 if any were issued.  Section 2 will be empty if the build is
lacking this CONFIG_ item, and user may have missed the warnings, as
they're off screen.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 scripts/export_report.pl |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index 48398a1..8f79b70 100644
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -102,6 +102,8 @@ close($module_symvers);
 #
 # collect the usage count of each symbol.
 #
+my $modversion_warnings = 0;
+
 foreach my $thismod (@allcfiles) {
 	my $module;
 
@@ -132,7 +134,8 @@ foreach my $thismod (@allcfiles) {
 		}
 	}
 	if ($state != 2) {
-		print "WARNING:$thismod is not built with CONFIG_MODVERSION enabled\n";
+		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
+		$modversion_warnings++;
 	}
 	close($module);
 }
@@ -166,6 +169,9 @@ printf("SECTION 2:\n\tThis section reports export-symbol-usage of in-kernel
 modules. Each module lists the modules, and the symbols from that module that
 it uses.  Each listed symbol reports the number of modules using it\n");
 
+print "\nNOTE: Got $modversion_warnings CONFIG_MODVERSIONS warnings\n\n"
+    if $modversion_warnings;
+
 print "~"x80 , "\n";
 for my $thismod (sort keys %MODULE) {
 	my $list = $MODULE{$thismod};
-- 
1.7.4.4

