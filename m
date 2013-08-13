Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 216.155.138.14.choopa.net ([216.155.138.14]:52709 "EHLO
	hopi.mpagano.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758533Ab3HNBdC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Aug 2013 21:33:02 -0400
Received: from localhost (localhost [127.0.0.1])
	by hopi.mpagano.com (Postfix) with ESMTP id 0FEC11D001F
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2013 21:32:28 -0400 (EDT)
Received: from hopi.mpagano.com ([127.0.0.1])
	by localhost (mpagano.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O37kSVnpzX3J for <linux-kbuild@vger.kernel.org>;
	Tue, 13 Aug 2013 21:32:24 -0400 (EDT)
Received: from comanche.localnet (pool-96-234-78-247.nwrknj.fios.verizon.net [96.234.78.247])
	by hopi.mpagano.com (Postfix) with ESMTPA id 3212A1D0010
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2013 21:32:24 -0400 (EDT)
From: Mike Pagano <mpagano@gentoo.org>
Subject: [PATCH] kbuild: Update to diffconfig to support python 2.6 and greater
Date: Tue, 13 Aug 2013 17:32:53 -0400
Message-ID: <3029888.QLGxfpIyIk@comanche>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Modification of the diffconfig script to support python versions 2.6 and 
greater. 

Note that Linux distributions are starting to deprecate python versions < 2.5

Diffconfig is a utility script for comparing kernel configuration files.

Signed-off-by: Mike Pagano <mpagano@gentoo.org>
---
 scripts/diffconfig | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/scripts/diffconfig b/scripts/diffconfig
index 33c696f..131d7b2 100755
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
@@ -54,23 +54,26 @@ def print_config(op, config, value, new_value):
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
 
+    a = {}
+    b = {}
+
     # parse command line args
     if ("-h" in sys.argv or "--help" in sys.argv):
-	usage()
+        usage()
 
     merge_style = 0
     if "-m" in sys.argv:
@@ -79,13 +82,13 @@ def main():
 
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
 
         configa_filename = build_dir + ".config.old"
@@ -95,11 +98,11 @@ def main():
         configb_filename = sys.argv[2]
 
     try:
-        a = readconfig(file(configa_filename))
-        b = readconfig(file(configb_filename))
-    except IOError,(errno, strerror):
-		print "I/O error(%s: %s)\n" % (errno, strerror)
-		usage()
+        a = readconfig(open(configa_filename))
+        b = readconfig(open(configb_filename))
+    except IOError as e:
+        print("I/O error({0}): {1}\n".format(e.errno, e.strerror))
+        usage()
 
     # print items in a but not b (accumulate, sort and print)
     old = []
@@ -125,8 +128,7 @@ def main():
 
     # now print items in b but not in a
     # (items from b that were in a were removed above)
-    new = b.keys()
-    new.sort()
+    new = sorted(b.keys())
     for config in new:
         print_config("+", config, None, b[config])
 
-- 
1.8.1.5


