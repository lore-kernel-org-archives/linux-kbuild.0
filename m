Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:59565 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752802AbZIRTuL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Sep 2009 15:50:11 -0400
Message-Id: <200909181949.n8IJnRNj019042@imap1.linux-foundation.org>
Subject: [patch 07/18] checkincludes.pl: add option to remove duplicates in place
From: akpm@linux-foundation.org
Date: Fri, 18 Sep 2009 12:49:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, lrodriguez@Atheros.comlrodriguez@Atheros.com

From: "Luis R. Rodriguez" <lrodriguez@Atheros.com>

checkincludes.pl is more useful if it actually removed the lines.  This
adds support for that with -r.

[akpm@linux-foundation.org: improve usage message]
Signed-off-by: Luis R. Rodriguez <lrodriguez@atheros.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/checkincludes.pl |   66 +++++++++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 7 deletions(-)

diff -puN scripts/checkincludes.pl~checkincludespl-add-option-to-remove-duplicates-in-place scripts/checkincludes.pl
--- a/scripts/checkincludes.pl~checkincludespl-add-option-to-remove-duplicates-in-place
+++ a/scripts/checkincludes.pl
@@ -1,33 +1,85 @@
 #!/usr/bin/perl
 #
-# checkincludes: Find files included more than once in (other) files.
+# checkincludes: find/remove files included more than once
+#
 # Copyright abandoned, 2000, Niels Kristian Bech Jensen <nkbj@image.dk>.
+# Copyright 2009 Luis R. Rodriguez <mcgrof@gmail.com>
+#
+# This script checks for duplicate includes. It also has support
+# to remove them in place. Note that this will not take into
+# consideration macros so you should run this only if you know
+# you do have real dups and do not have them under #ifdef's. You
+# could also just review the results.
 
 sub usage {
-	print "Usage: checkincludes.pl <file list>\n";
+	print "Usage: checkincludes.pl [-r]\n";
+	print "By default we just warn of duplicates\n";
+	print "To remove duplicated includes in place use -r\n";
 	exit 1;
 }
 
+my $remove = 0;
+
 if ($#ARGV < 0) {
-        usage();
+	usage();
+}
+
+if ($#ARGV >= 1) {
+	if ($ARGV[0] =~ /^-/) {
+		if ($ARGV[0] eq "-r") {
+			$remove = 1;
+			shift;
+		} else {
+			usage();
+		}
+	}
 }
 
 foreach $file (@ARGV) {
 	open(FILE, $file) or die "Cannot open $file: $!.\n";
 
 	my %includedfiles = ();
+	my @file_lines = ();
 
 	while (<FILE>) {
 		if (m/^\s*#\s*include\s*[<"](\S*)[>"]/o) {
 			++$includedfiles{$1};
 		}
+		push(@file_lines, $_);
 	}
 
 	close(FILE);
-	
-	foreach $filename (keys %includedfiles) {
-		if ($includedfiles{$filename} > 1) {
-			print "$file: $filename is included more than once.\n";
+
+	if (!$remove) {
+		foreach $filename (keys %includedfiles) {
+			if ($includedfiles{$filename} > 1) {
+				print "$file: $filename is included more than once.\n";
+			}
 		}
+		next;
 	}
+
+	open(FILE,">$file") || die("Cannot write to $file: $!");
+
+	my $dups = 0;
+	foreach (@file_lines) {
+		if (m/^\s*#\s*include\s*[<"](\S*)[>"]/o) {
+			foreach $filename (keys %includedfiles) {
+				if ($1 eq $filename) {
+					if ($includedfiles{$filename} > 1) {
+						$includedfiles{$filename}--;
+						$dups++;
+					} else {
+						print FILE $_;
+					}
+				}
+			}
+		} else {
+			print FILE $_;
+		}
+	}
+	if ($dups > 0) {
+		print "$file: removed $dups duplicate includes\n";
+	}
+	close(FILE);
 }
_
