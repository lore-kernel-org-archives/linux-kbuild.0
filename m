Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:46826 "EHLO
	viridian.itc.Virginia.EDU" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755467Ab2HINcY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Aug 2012 09:32:24 -0400
From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 2/4] localmodconfig: rework find_config in streamline_config.pl
Date: Thu,  9 Aug 2012 09:23:21 -0400
Message-Id: <1344518603-19508-3-git-send-email-wfp5p@virginia.edu>
In-Reply-To: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
References: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: rostedt@goodmis.org

Change find_config function to read_config.  It now finds the config,
reads the config into an array, and returns the array.  This makes it
a little cleaner and changes the open to use perl's 3 option open.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
---
 scripts/kconfig/streamline_config.pl | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index e3687f9..62d64ce 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -100,7 +100,7 @@ my @searchconfigs = (
 	},
 );
 
-sub find_config {
+sub read_config {
     foreach my $conf (@searchconfigs) {
 	my $file = $conf->{"file"};
 
@@ -115,17 +115,15 @@ sub find_config {
 
 	print STDERR "using config: '$file'\n";
 
-	open(CIN, "$exec $file |") || die "Failed to run $exec $file";
-	return;
+	open(my $infile, '-|', "$exec $file") || die "Failed to run $exec $file";
+	my @x = <$infile>;
+	close $infile;
+	return @x;
     }
     die "No config file found";
 }
 
-find_config;
-
-# Read in the entire config file into config_file
-my @config_file = <CIN>;
-close CIN;
+my @config_file = read_config;
 
 # Parse options
 my $localmodconfig = 0;
-- 
1.7.11.3

