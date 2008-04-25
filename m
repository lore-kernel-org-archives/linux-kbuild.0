Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:46780 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759929AbYDYUlJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Apr 2008 16:41:09 -0400
Date: Fri, 25 Apr 2008 23:40:16 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] scripts/Makefile.modpost typo fix
Message-ID: <20080425204016.GB20630@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Hacker <lerichi@gmx.net>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

-EVIUSER  ;-)

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
c047b74be2c64a0a1458a407cc77f54e5ae136c2 diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 24b3c8f..a098a04 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -76,7 +76,7 @@ modpost = scripts/mod/modpost                    \
  $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a,)       \
  $(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)   \
  $(if $(KBUILD_EXTMOD),-I $(modulesymfile))      \
- $(if $(iKBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(EXTRA_SYMBOLS))) \
+ $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(EXTRA_SYMBOLS))) \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
  $(if $(CONFIG_MARKERS),-K $(kernelmarkersfile)) \

