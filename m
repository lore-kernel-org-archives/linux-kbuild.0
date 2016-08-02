Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36243 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756708AbcHBWkq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Aug 2016 18:40:46 -0400
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Wed, 3 Aug 2016 00:40:34 +0200
Subject: [PATCH] kconfig-language: improve menuconfig usage description
Message-ID: <20160802224034.GA30411@eugeniu-X230>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, mmarek@suse.com, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Cc: rosca.eugeniu@gmail.com

Improper menuconfig usage leads to empty menu entries.
zconfdump() is able to reveal some real-life examples:
- menuconfig VFIO_NOIOMMU
- menuconfig RESET_CONTROLLER
- menuconfig SND_ARM

To avoid future occurrences of those, improve the menuconfig syntax
description.

Signed-off-by: Eugeniu Rosca <rosca.eugeniu@gmail.com>
---
 Documentation/kbuild/kconfig-language.txt | 39 ++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index db10185..069fcb3 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -274,7 +274,44 @@ menuconfig:
 
 This is similar to the simple config entry above, but it also gives a
 hint to front ends, that all suboptions should be displayed as a
-separate list of options.
+separate list of options. To make sure all the suboptions will really
+show up under the menuconfig entry and not outside of it, every item
+from the <config options> list must depend on the menuconfig symbol.
+In practice, this is achieved by using one of the next two constructs:
+
+(1):
+menuconfig M
+if M
+    config C1
+    config C2
+endif
+
+(2):
+menuconfig M
+config C1
+    depends on M
+config C2
+    depends on M
+
+In the following examples (3) and (4), C1 and C2 still have the M
+dependency, but will not appear under menuconfig M anymore, because
+of C0, which doesn't depend on M:
+
+(3):
+menuconfig M
+    config C0
+if M
+    config C1
+    config C2
+endif
+
+(4):
+menuconfig M
+config C0
+config C1
+    depends on M
+config C2
+    depends on M
 
 choices:
 
-- 
2.9.2

