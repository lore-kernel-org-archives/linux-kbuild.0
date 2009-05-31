Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sj-iport-5.cisco.com ([171.68.10.87]:28727 "EHLO
	sj-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752383AbZEaBNb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 30 May 2009 21:13:31 -0400
Date: Sat, 30 May 2009 18:13:32 -0700
From: David VomLehn <dvomlehn@cisco.com>
Subject: [PATCH] documentation:kbuild Incorrect makefile syntix in examnple
Message-ID: <20090531011332.GA13205@cuplxvomd02.corp.sa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-doc@vger.kernel.org
Cc: rdunlap@xenotime.net, linux-kbuild@vger.kernel.org, sam@ravnborg.org

There is an error in the make syntax for one of the kbuild examples. This
fixes it.

Signed-off-by: David VomLehn <dvomlehn@cisco.com>
---
 Documentation/kbuild/modules.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Documentation/kbuild/modules.txt b/Documentation/kbuild/modules.txt
index b1096da..0767cf6 100644
--- a/Documentation/kbuild/modules.txt
+++ b/Documentation/kbuild/modules.txt
@@ -275,7 +275,7 @@ following files:
 
 		KERNELDIR := /lib/modules/`uname -r`/build
 		all::
-			$(MAKE) -C $KERNELDIR M=`pwd` $@
+			$(MAKE) -C $(KERNELDIR) M=`pwd` $@
 
 		# Module specific targets
 		genbin:
