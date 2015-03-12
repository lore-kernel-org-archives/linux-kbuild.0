Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:44693 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753602AbbCLNTC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 09:19:02 -0400
Message-ID: <55019243.8090902@gmail.com>
Date: Thu, 12 Mar 2015 06:18:59 -0700
From: Frank Rowand <frowand.list@gmail.com>
Reply-To: frowand.list@gmail.com
MIME-Version: 1.0
Subject: [Patch v3 3/3] dt: OF_UNITTEST make dependency broken, fix unittest.c
 after move
References: <5501918D.2020000@gmail.com>
In-Reply-To: <5501918D.2020000@gmail.com>
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
