Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42758 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758743AbYAXWDs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:48 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 04/77] kernel-doc: process functions, not DOC:
Date: Thu, 24 Jan 2008 23:02:45 +0100
Message-Id: <1201212238-4369-4-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>

From: Johannes Berg <johannes@sipsolutions.net>

This flag is necessary for the next patch for docproc to output
only the functions and not DOC: sections when a function list
is requested.

Signed-off-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kernel-doc |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 8255f72..ec54f12 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -46,13 +46,16 @@ use strict;
 # Note: This only supports 'c'.
 
 # usage:
-# kernel-doc [ -docbook | -html | -text | -man ]
+# kernel-doc [ -docbook | -html | -text | -man ] [ -no-doc-sections ]
 #           [ -function funcname [ -function funcname ...] ] c file(s)s > outputfile
 # or
 #           [ -nofunction funcname [ -function funcname ...] ] c file(s)s > outputfile
 #
 #  Set output format using one of -docbook -html -text or -man.  Default is man.
 #
+#  -no-doc-sections
+#	Do not output DOC: sections
+#
 #  -function funcname
 #	If set, then only generate documentation for the given function(s) or
 #	DOC: section titles.  All other functions and DOC: sections are ignored.
@@ -211,7 +214,7 @@ my $blankline_text = "";
 
 
 sub usage {
-    print "Usage: $0 [ -v ] [ -docbook | -html | -text | -man ]\n";
+    print "Usage: $0 [ -v ] [ -docbook | -html | -text | -man ] [ -no-doc-sections ]\n";
     print "         [ -function funcname [ -function funcname ...] ]\n";
     print "         [ -nofunction funcname [ -nofunction funcname ...] ]\n";
     print "         c source file(s) > outputfile\n";
@@ -225,6 +228,7 @@ if ($#ARGV==-1) {
 
 my $verbose = 0;
 my $output_mode = "man";
+my $no_doc_sections = 0;
 my %highlights = %highlights_man;
 my $blankline = $blankline_man;
 my $modulename = "Kernel API";
@@ -329,6 +333,8 @@ while ($ARGV[0] =~ m/^-(.*)/) {
 	usage();
     } elsif ($cmd eq '-filelist') {
 	    $filelist = shift @ARGV;
+    } elsif ($cmd eq '-no-doc-sections') {
+	    $no_doc_sections = 1;
     }
 }
 
@@ -380,6 +386,10 @@ sub dump_doc_section {
     my $name = shift;
     my $contents = join "\n", @_;
 
+    if ($no_doc_sections) {
+        return;
+    }
+
     if (($function_only == 0) ||
 	( $function_only == 1 && defined($function_table{$name})) ||
 	( $function_only == 2 && !defined($function_table{$name})))
-- 
1.5.4.rc3.14.g44397

