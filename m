Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:60726 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725AbaCYPUI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Mar 2014 11:20:08 -0400
Received: by mail-ee0-f54.google.com with SMTP id d49so581312eek.27
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Mar 2014 08:20:07 -0700 (PDT)
From: David Graeff <david.graeff@web.de>
Subject: [RFC PATCH 2/2] kconfig: Add qconfig makefile target additionally to the xconfig target
Date: Tue, 25 Mar 2014 16:20:01 +0100
Message-Id: <1395760801-27009-3-git-send-email-david.graeff@web.de>
In-Reply-To: <1395760801-27009-1-git-send-email-david.graeff@web.de>
References: <1395760801-27009-1-git-send-email-david.graeff@web.de>
In-Reply-To: <kconfig-port-qt>
References: <kconfig-port-qt>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: David Graeff <david.graeff@web.de>, yann.morin.1998@free.fr

Because we no longer only target the xserver with the qt frontend of kconfig
and due to the name beeing inconsistent with the other makefile targets
an additional qconfig target is added.

Signed-off-by: David Graeff <david.graeff@web.de>

diff --git a/scripts/kconfig/qconfig/Makefile b/scripts/kconfig/qconfig/Makefile
index d2e6463..ad1af34 100644
--- a/scripts/kconfig/qconfig/Makefile
+++ b/scripts/kconfig/qconfig/Makefile
@@ -2,11 +2,14 @@
 # Kernel configuration targets
 # These targets are used from kconfig top-level makefile
 
-PHONY +=  xconfig
+PHONY +=  xconfig qconfig
 
 xconfig: $(obj)/qconf
 	$< $(Kconfig)
 
+qconfig: $(obj)/qconf
+	$< $(Kconfig)
+
 # ===========================================================================
 # qconf:  Used for the xconfig/qconfig target
 #         Based on Qt4+ which needs to be installed to compile it
-- 
1.9.1

