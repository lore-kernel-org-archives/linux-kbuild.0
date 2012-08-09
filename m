Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:46824 "EHLO
	viridian.itc.Virginia.EDU" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755451Ab2HINcY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Aug 2012 09:32:24 -0400
From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 3/4] localmodconfig: use 3 parameter open in streamline_config.pl
Date: Thu,  9 Aug 2012 09:23:22 -0400
Message-Id: <1344518603-19508-4-git-send-email-wfp5p@virginia.edu>
In-Reply-To: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
References: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: rostedt@goodmis.org

Convert remaining open calls to use the perl's preferred 3 parameter
open.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
---
 scripts/kconfig/streamline_config.pl | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 62d64ce..22b66ca 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -171,8 +171,8 @@ sub read_kconfig {
 	$source =~ s/\$$env/$ENV{$env}/;
     }
 
-    open(KIN, "$source") || die "Can't open $kconfig";
-    while (<KIN>) {
+    open(my $kinfile, '<', $source) || die "Can't open $kconfig";
+    while (<$kinfile>) {
 	chomp;
 
 	# Make sure that lines ending with \ continue
@@ -249,7 +249,7 @@ sub read_kconfig {
 	    $state = "NONE";
 	}
     }
-    close(KIN);
+    close($kinfile);
 
     # read in any configs that were found.
     foreach $kconfig (@kconfigs) {
@@ -293,8 +293,8 @@ foreach my $makefile (@makefiles) {
     my $line = "";
     my %make_vars;
 
-    open(MIN,$makefile) || die "Can't open $makefile";
-    while (<MIN>) {
+    open(my $infile, '<', $makefile) || die "Can't open $makefile";
+    while (<$infile>) {
 	# if this line ends with a backslash, continue
 	chomp;
 	if (/^(.*)\\$/) {
@@ -341,10 +341,11 @@ foreach my $makefile (@makefiles) {
 	    }
 	}
     }
-    close(MIN);
+    close($infile);
 }
 
 my %modules;
+my $linfile;
 
 if (defined($lsmod_file)) {
     if ( ! -f $lsmod_file) {
@@ -354,13 +355,10 @@ if (defined($lsmod_file)) {
 		die "$lsmod_file not found";
 	}
     }
-    if ( -x $lsmod_file) {
-	# the file is executable, run it
-	open(LIN, "$lsmod_file|");
-    } else {
-	# Just read the contents
-	open(LIN, "$lsmod_file");
-    }
+
+    my $otype = ( -x $lsmod_file) ? '-|' : '<';
+    open($linfile, $otype, $lsmod_file);
+
 } else {
 
     # see what modules are loaded on this system
@@ -377,16 +375,16 @@ if (defined($lsmod_file)) {
 	$lsmod = "lsmod";
     }
 
-    open(LIN,"$lsmod|") || die "Can not call lsmod with $lsmod";
+    open($linfile, '-|', $lsmod) || die "Can not call lsmod with $lsmod";
 }
 
-while (<LIN>) {
+while (<$linfile>) {
 	next if (/^Module/);  # Skip the first line.
 	if (/^(\S+)/) {
 		$modules{$1} = 1;
 	}
 }
-close (LIN);
+close ($linfile);
 
 # add to the configs hash all configs that are needed to enable
 # a loaded module. This is a direct obj-${CONFIG_FOO} += bar.o
-- 
1.7.11.3

