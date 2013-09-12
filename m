Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.nt1.in ([62.90.139.210]:41792 "EHLO mail.nt1.in"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750974Ab3ILBMG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Sep 2013 21:12:06 -0400
Date: Thu, 12 Sep 2013 03:35:48 +0300
From: Regid Ichira <regid23@nt1.in>
Subject: [PATCH] Documentation/kbuild/kconfig.txt: Doesn't make listnewconfig
 replacing yes "" | make oldconfig ?
Message-ID: <20130912003548.GF8821@nt1.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Rob Landley <rob@landley.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Regid Ichira <regid23@nt1.in>
---
 Documentation/kbuild/kconfig.txt | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
index 8ef6dbb..14cc40c 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.txt
@@ -20,16 +20,9 @@ symbols have been introduced.
 To see a list of new config symbols when using "make oldconfig", use
 
 	cp user/some/old.config .config
-	yes "" | make oldconfig >conf.new
+	make listnewconfig 
 
-and the config program will list as (NEW) any new symbols that have
-unknown values.  Of course, the .config file is also updated with
-new (default) values, so you can use:
-
-	grep "(NEW)" conf.new
-
-to see the new config symbols or you can use diffconfig to see the
-differences between the previous and new .config files:
+and the config program will list any new symbols, one per line.
 
 	scripts/diffconfig .config.old .config | less
 
-- 
1.8.4.rc3
