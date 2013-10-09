Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:60890 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754051Ab3JIOgm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Oct 2013 10:36:42 -0400
Date: Wed, 9 Oct 2013 10:36:42 -0400
From: Mike Pagano <mpagano@gentoo.org>
Subject: [PATCH] show_delta: Update script to support python versions 2.5
 through 3.3
Message-ID: <20131009143642.GA12462@woodpecker.gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Support past and active versions of python while maintaining backward compatibility. Script has been tested on python versions from 2.5.x up to and including 3.3.x.


Signed-off-by: Mike Pagano <mpagano@gentoo.org>
---
 scripts/show_delta | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/show_delta b/scripts/show_delta
index 17df305..e25732b 100755
--- a/scripts/show_delta
+++ b/scripts/show_delta
@@ -13,7 +13,7 @@ import sys
 import string
 
 def usage():
-	print """usage: show_delta [<options>] <filename>
+	print ("""usage: show_delta [<options>] <filename>
 
 This program parses the output from a set of printk message lines which
 have time data prefixed because the CONFIG_PRINTK_TIME option is set, or
@@ -35,7 +35,7 @@ ex: $ dmesg >timefile
 
 will show times relative to the line in the kernel output
 starting with "NET4".
-"""
+""")
 	sys.exit(1)
 
 # returns a tuple containing the seconds and text for each message line
@@ -94,11 +94,11 @@ def main():
 	try:
 		lines = open(filein,"r").readlines()
 	except:
-		print "Problem opening file: %s" % filein
+		print ("Problem opening file: %s" % filein)
 		sys.exit(1)
 
 	if base_str:
-		print 'base= "%s"' % base_str
+		print ('base= "%s"' % base_str)
 		# assume a numeric base.  If that fails, try searching
 		# for a matching line.
 		try:
@@ -117,13 +117,13 @@ def main():
 					# stop at first match
 					break
 			if not found:
-				print 'Couldn\'t find line matching base pattern "%s"' % base_str
+				print ('Couldn\'t find line matching base pattern "%s"' % base_str)
 				sys.exit(1)
 	else:
 		base_time = 0.0
 
 	for line in lines:
-		print convert_line(line, base_time),
+		print (convert_line(line, base_time),)
 
 main()
 
-- 
1.8.1.5
