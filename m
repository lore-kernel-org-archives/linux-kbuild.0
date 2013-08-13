Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 216.155.138.14.choopa.net ([216.155.138.14]:52702 "EHLO
	hopi.mpagano.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758205Ab3HNB3i (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Aug 2013 21:29:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by hopi.mpagano.com (Postfix) with ESMTP id 8D6F41D001F
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2013 21:29:08 -0400 (EDT)
Received: from hopi.mpagano.com ([127.0.0.1])
	by localhost (mpagano.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFKNJIppoNJ8 for <linux-kbuild@vger.kernel.org>;
	Tue, 13 Aug 2013 21:29:05 -0400 (EDT)
Received: from comanche.localnet (pool-96-234-78-247.nwrknj.fios.verizon.net [96.234.78.247])
	by hopi.mpagano.com (Postfix) with ESMTPA id 1055A1D0010
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2013 21:29:05 -0400 (EDT)
From: Mike Pagano <mpagano@gentoo.org>
Subject: [PATCH] kconfig: Gracefully exit if the default config files are not present
Date: Tue, 13 Aug 2013 17:29:34 -0400
Message-ID: <6523722.tcSzR9xRoc@comanche>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Gracefully exit if the default config files are not present. (.config and 
.config.old)

Diffconfig is a utility script for comparing kernel configuration files.

Signed-off-by: Mike Pagano <mpagano@gentoo.org>
---
 scripts/diffconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/diffconfig b/scripts/diffconfig
index b91f3e3..33c696f 100755
--- a/scripts/diffconfig
+++ b/scripts/diffconfig
@@ -94,8 +94,12 @@ def main():
         configa_filename = sys.argv[1]
         configb_filename = sys.argv[2]

-    a = readconfig(file(configa_filename))
-    b = readconfig(file(configb_filename))
+    try:
+        a = readconfig(file(configa_filename))
+        b = readconfig(file(configb_filename))
+    except IOError,(errno, strerror):
+       print "I/O error(%s: %s)\n" % (errno, strerror)
+       usage()

     # print items in a but not b (accumulate, sort and print)
     old = []
-- 
1.8.1.5
