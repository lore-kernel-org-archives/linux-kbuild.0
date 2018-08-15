Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:53922 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbeHOD0h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Aug 2018 23:26:37 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kconfig: add build-only configurator targets
Message-ID: <abba6b9a-597b-a3eb-6d91-8a7261492c78@infradead.org>
Date: Tue, 14 Aug 2018 17:36:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

From: Randy Dunlap <rdunlap@infradead.org>

Add build-only targets for build_menuconfig, build_nconfig,
build_xconfig, and build_gconfig.
(targets must end in "config" to qualify in top-level Makefile)

This allows these target to be built without execution (e.g., to
look for errors or warnings) and/or to be built and checked by sparse.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 scripts/kconfig/Makefile |    8 ++++++++
 1 file changed, 8 insertions(+)

--- linux-next-20180814.orig/scripts/kconfig/Makefile
+++ linux-next-20180814/scripts/kconfig/Makefile
@@ -33,6 +33,14 @@ config: $(obj)/conf
 nconfig: $(obj)/nconf
 	$< $(silent) $(Kconfig)
 
+build_menuconfig: $(obj)/mconf
+
+build_nconfig: $(obj)/nconf
+
+build_gconfig: $(obj)/gconf
+
+build_xconfig: $(obj)/qconf
+
 localyesconfig localmodconfig: $(obj)/conf
 	$(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 					\
