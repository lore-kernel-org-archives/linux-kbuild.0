Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.nuigalway.ie ([140.203.201.100]:59312 "EHLO
	mx1.nuigalway.ie" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871AbYIIO6d (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Sep 2008 10:58:33 -0400
Date: Tue, 9 Sep 2008 15:46:18 +0100
From: Jonathan Lynch <jonathan.lynch@gmail.com>
Subject: [PATCH] kbuild: Bugfix for variable KBUILD_EXTRA_SYMBOLS 
Message-ID: <20080909144618.GA20020@riviera.nuigalway.ie>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Feedback for the patch "kbuild: Add new Kbuild variable EXTRA_SYMBOLS", requested the variable to be renamed from EXTRA_SYMBOLS to KBUILD_EXTRA_SYMBOLS. 
The patch was resubmitted and committed but not all the variables were renamed. This patch fixes that and applies to 2.6.27-rc5-git10 

original patch that conatined the bug can be found at:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0d96fb20b7ed757fc936bb35e26c22251a75b734

Please Apply.

Signed-off-by: Jonathan Lynch <jonathan.lynch@gmail.com>

---

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=kbuild_patch

--- linux-2.6.27-rc5/scripts/Makefile.modpost.orig	2008-09-09 14:59:20.000000000 +0100
+++ linux-2.6.27-rc5/scripts/Makefile.modpost	2008-09-09 15:00:31.000000000 +0100
@@ -82,7 +82,7 @@ modpost = scripts/mod/modpost           
  $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a,)       \
  $(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)   \
  $(if $(KBUILD_EXTMOD),-I $(modulesymfile))      \
- $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(EXTRA_SYMBOLS))) \
+ $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(KBUILD_EXTRA_SYMBOLS))) \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
  $(if $(CONFIG_MARKERS),-K $(kernelmarkersfile)) \

--Dxnq1zWXvFF0Q93v--
