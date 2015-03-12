Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:46231 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289AbbCLGC0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 02:02:26 -0400
Message-ID: <55012BEE.5040001@gmail.com>
Date: Wed, 11 Mar 2015 23:02:22 -0700
From: Frank Rowand <frowand.list@gmail.com>
Reply-To: frowand.list@gmail.com
MIME-Version: 1.0
Subject: [Patch v2 3/3] dt: OF_UNITTEST make dependency broken, fix unittest.c
 after move
References: <55012B4A.9050504@gmail.com>
In-Reply-To: <55012B4A.9050504@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michal Marek <mmarek@suse.cz>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org

From: Frank Rowand <frank.rowand@sonymobile.com>

Fix an of_unittest.c include path to account for the move of
unittest.c into unittest-data/.

Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>

---
 drivers/of/unittest-data/unittest.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/drivers/of/unittest-data/unittest.c
===================================================================
--- a/drivers/of/unittest-data/unittest.c
+++ b/drivers/of/unittest-data/unittest.c
@@ -23,7 +23,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 
-#include "of_private.h"
+#include "../of_private.h"
 
 static struct selftest_results {
 	int passed;
