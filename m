Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:56668 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756258AbZHFXFH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Aug 2009 19:05:07 -0400
Message-Id: <200908062304.n76N4YPc003225@imap1.linux-foundation.org>
Subject: [patch 7/8] checkincludes.pl: provide usage helper
From: akpm@linux-foundation.org
Date: Thu, 06 Aug 2009 16:04:33 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, lrodriguez@Atheros.comlrodriguez@Atheros.com

From: "Luis R. Rodriguez" <lrodriguez@Atheros.com>

Signed-off-by: Luis R. Rodriguez <lrodriguez@atheros.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/checkincludes.pl |    9 +++++++++
 1 file changed, 9 insertions(+)

diff -puN scripts/checkincludes.pl~checkincludespl-provide-usage-helper scripts/checkincludes.pl
--- a/scripts/checkincludes.pl~checkincludespl-provide-usage-helper
+++ a/scripts/checkincludes.pl
@@ -3,6 +3,15 @@
 # checkincludes: Find files included more than once in (other) files.
 # Copyright abandoned, 2000, Niels Kristian Bech Jensen <nkbj@image.dk>.
 
+sub usage {
+	print "Usage: checkincludes.pl <file list>\n";
+	exit 1;
+}
+
+if ($#ARGV < 0) {
+        usage();
+}
+
 foreach $file (@ARGV) {
 	open(FILE, $file) or die "Cannot open $file: $!.\n";
 
_
