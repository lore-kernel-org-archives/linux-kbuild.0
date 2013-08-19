Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:37694 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750941Ab3HSOay (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Aug 2013 10:30:54 -0400
Received: by mail-ee0-f43.google.com with SMTP id e52so2200100eek.16
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2013 07:30:53 -0700 (PDT)
From: David Graeff <david.graeff@web.de>
Subject: [PATCH v3 2/5] kconfig: Add qconfig makefile target additionally to the xconfig target
Date: Mon, 19 Aug 2013 16:29:48 +0200
Message-Id: <1376922591-37504-3-git-send-email-david.graeff@web.de>
In-Reply-To: <1376922591-37504-1-git-send-email-david.graeff@web.de>
References: <1376922591-37504-1-git-send-email-david.graeff@web.de>
In-Reply-To: <kconfig-port-gtk-qt>
References: <kconfig-port-gtk-qt>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: David Graeff <david.graeff@web.de>, yann.morin.1998@free.fr, sam@ravnborg.org, mmarek@suse.cz

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
1.8.1.2

