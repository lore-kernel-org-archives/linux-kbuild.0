Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:62956 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfGQGSZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:25 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 08/12] kbuild: export_report: read modules.order instead of .tmp_versions/*.mod
Date: Wed, 17 Jul 2019 15:17:56 +0900
Message-Id: <20190717061800.10018-9-yamada.masahiro@socionext.com>
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Towards the goal of removing MODVERDIR aka .tmp_versions, read out
modules.order to get the list of modules to be processed. This is
simpler than parsing *.mod files in .tmp_versions.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - New patch

Changes in v2: None

 scripts/export_report.pl | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index 0f604f62f067..7d3030d03a25 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -52,13 +52,12 @@ sub usage {
 
 sub collectcfiles {
     my @file;
-    while (<.tmp_versions/*.mod>) {
-	open my $fh, '<', $_ or die "cannot open $_: $!\n";
-	push (@file,
-	      grep s/\.ko/.mod.c/,	# change the suffix
-	      grep m/.+\.ko/,		# find the .ko path
-	      <$fh>);			# lines in opened file
+    open my $fh, '< modules.order' or die "cannot open modules.order: $!\n";
+    while (<$fh>) {
+	s/\.ko$/.mod.c/;
+	push (@file, $_)
     }
+    close($fh);
     chomp @file;
     return @file;
 }
-- 
2.17.1
