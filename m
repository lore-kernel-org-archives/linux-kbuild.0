Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:33261 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753543Ab3HPSk4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Aug 2013 14:40:56 -0400
Date: Fri, 16 Aug 2013 14:40:56 -0400
From: Mike Pagano <mpagano@gentoo.org>
Subject: [PATCH RESEND] diffconfig: Gracefully exit if the default config
 files are not present
Message-ID: <20130816184056.GA30565@woodpecker.gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Handle gracefully the instance where config files are not present.
Compatible with python versions 2.5, 2.6 and 2.7.
The try/except is forward compatible with python version 3 once the entire script is ported.

Signed-off-by: Mike Pagano <mpagano@gentoo.org>
---
 scripts/diffconfig | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/diffconfig b/scripts/diffconfig
index b91f3e3..0ee6583 100755
--- a/scripts/diffconfig
+++ b/scripts/diffconfig
@@ -94,8 +94,13 @@ def main():
         configa_filename = sys.argv[1]
         configb_filename = sys.argv[2]

-    a = readconfig(file(configa_filename))
-    b = readconfig(file(configb_filename))
+    try:
+        a = readconfig(file(configa_filename))
+        b = readconfig(file(configb_filename))
+    except (IOError):
+        e = sys.exc_info()[1]
+        print("I/O error[%s]: %s\n" % (e.args[0],e.args[1]))
+        usage()

     # print items in a but not b (accumulate, sort and print)
     old = []
--
1.8.1.5
