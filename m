Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:43125 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751217Ab3HTSlT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Aug 2013 14:41:19 -0400
Date: Tue, 20 Aug 2013 14:41:12 -0400
From: Mike Pagano <mpagano@gentoo.org>
Subject: [PATCH RESEND] diffconfig: Update script to support python versions
 2.5 through 3.3
Message-ID: <20130820184112.GA18525@woodpecker.gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Support past and active versions of python while maintaining backward compatibility.
Script has been tested on python versions up to and including 3.3.X.

---
 scripts/diffconfig | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/scripts/diffconfig b/scripts/diffconfig
index 0ee6583..6d67283 100755
--- a/scripts/diffconfig
+++ b/scripts/diffconfig
@@ -10,7 +10,7 @@
 import sys, os
 
 def usage():
-    print """Usage: diffconfig [-h] [-m] [<config1> <config2>]
+    print("""Usage: diffconfig [-h] [-m] [<config1> <config2>]
 
 Diffconfig is a simple utility for comparing two .config files.
 Using standard diff to compare .config files often includes extraneous and
@@ -33,7 +33,7 @@ Example usage:
  EXT2_FS  y -> n
  LOG_BUF_SHIFT  14 -> 16
  PRINTK_TIME  n -> y
-"""
+""")
     sys.exit(0)
 
 # returns a dictionary of name/value pairs for config items in the file
@@ -54,23 +54,23 @@ def print_config(op, config, value, new_value):
     if merge_style:
         if new_value:
             if new_value=="n":
-                print "# CONFIG_%s is not set" % config
+                print("# CONFIG_%s is not set" % config)
             else:
-                print "CONFIG_%s=%s" % (config, new_value)
+                print("CONFIG_%s=%s" % (config, new_value))
     else:
         if op=="-":
-            print "-%s %s" % (config, value)
+            print("-%s %s" % (config, value))
         elif op=="+":
-            print "+%s %s" % (config, new_value)
+            print("+%s %s" % (config, new_value))
         else:
-            print " %s %s -> %s" % (config, value, new_value)
+            print(" %s %s -> %s" % (config, value, new_value))
 
 def main():
     global merge_style
 
     # parse command line args
     if ("-h" in sys.argv or "--help" in sys.argv):
-	usage()
+        usage()
 
     merge_style = 0
     if "-m" in sys.argv:
@@ -79,15 +79,14 @@ def main():
 
     argc = len(sys.argv)
     if not (argc==1 or argc == 3):
-        print "Error: incorrect number of arguments or unrecognized option"
+        print("Error: incorrect number of arguments or unrecognized option")
         usage()
 
     if argc == 1:
         # if no filenames given, assume .config and .config.old
         build_dir=""
-        if os.environ.has_key("KBUILD_OUTPUT"):
+        if "KBUILD_OUTPUT" in os.environ:
             build_dir = os.environ["KBUILD_OUTPUT"]+"/"
-
         configa_filename = build_dir + ".config.old"
         configb_filename = build_dir + ".config"
     else:
@@ -95,8 +94,8 @@ def main():
         configb_filename = sys.argv[2]
 
     try:
-        a = readconfig(file(configa_filename))
-        b = readconfig(file(configb_filename))
+        a = readconfig(open(configa_filename))
+        b = readconfig(open(configb_filename))
     except (IOError):
         e = sys.exc_info()[1]
         print("I/O error[%s]: %s\n" % (e.args[0],e.args[1]))
@@ -126,8 +125,7 @@ def main():
 
     # now print items in b but not in a
     # (items from b that were in a were removed above)
-    new = b.keys()
-    new.sort()
+    new = sorted(b.keys())
     for config in new:
         print_config("+", config, None, b[config])
 
-- 
1.8.1.5
