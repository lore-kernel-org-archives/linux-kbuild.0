Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f74.google.com ([74.125.82.74]:33259 "EHLO
	mail-ww0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757401Ab2CEXIM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 Mar 2012 18:08:12 -0500
Received: by wgbdt11 with SMTP id dt11so164958wgb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Mar 2012 15:08:11 -0800 (PST)
Subject: [patch 1/1] headers_check: recursively search for linux/types.h inclusion
From: akpm@linux-foundation.org
Date: Mon, 05 Mar 2012 15:08:09 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
Message-Id: <20120305230810.26823A02EB@akpm.mtv.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, bobbypowers@gmail.com, airlied@linux.ie, sam@ravnborg.org

From: Bobby Powers <bobbypowers@gmail.com>
Subject: headers_check: recursively search for linux/types.h inclusion

headers_check.pl currently emits some spurious warnings, especially for
the drm headers, about using __[us]{8,16,32,64} types without including
linux/types.h.  Recursively search for types.h inclusion, avoiding
circular references.

Signed-off-by: Bobby Powers <bobbypowers@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Dave Airlie <airlied@linux.ie>
Cc: Michal Marek <mmarek@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/headers_check.pl |   38 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff -puN scripts/headers_check.pl~headers_check-recursively-search-for-linux-typesh-inclusion scripts/headers_check.pl
--- a/scripts/headers_check.pl~headers_check-recursively-search-for-linux-typesh-inclusion
+++ a/scripts/headers_check.pl
@@ -19,6 +19,7 @@
 # 3) Check for leaked CONFIG_ symbols
 
 use strict;
+use File::Basename;
 
 my ($dir, $arch, @files) = @ARGV;
 
@@ -99,6 +100,39 @@ sub check_asm_types
 }
 
 my $linux_types;
+my %import_stack = ();
+sub check_include_typesh
+{
+	my $path = $_[0];
+	my $import_path;
+
+	my $fh;
+	my @file_paths = ($path, $dir . "/" .  $path, dirname($filename) . "/" . $path);
+	for my $possible ( @file_paths ) {
+	    if (not $import_stack{$possible} and open($fh, '<', $possible)) {
+		$import_path = $possible;
+		$import_stack{$import_path} = 1;
+		last;
+	    }
+	}
+	if (eof $fh) {
+	    return;
+	}
+
+	my $line;
+	while ($line = <$fh>) {
+		if ($line =~ m/^\s*#\s*include\s+<linux\/types.h>/) {
+			$linux_types = 1;
+			last;
+		}
+		if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
+			check_include_typesh($included);
+		}
+	}
+	close $fh;
+	delete $import_stack{$import_path};
+}
+
 sub check_sizetypes
 {
 	if ($filename =~ /types.h|int-l64.h|int-ll64.h/o) {
@@ -113,6 +147,9 @@ sub check_sizetypes
 		$linux_types = 1;
 		return;
 	}
+	if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
+		check_include_typesh($included);
+	}
 	if ($line =~ m/__[us](8|16|32|64)\b/) {
 		printf STDERR "$filename:$lineno: " .
 		              "found __[us]{8,16,32,64} type " .
@@ -122,4 +159,3 @@ sub check_sizetypes
 		#$ret = 1;
 	}
 }
-
_
