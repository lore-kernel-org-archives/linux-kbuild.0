Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43714 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750869AbeFAFuz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jun 2018 01:50:55 -0400
From: Petr Vorel <pvorel@suse.cz>
Subject: [PATCH v2 1/2] kbuild: Add testconfig into make help output
Date: Fri,  1 Jun 2018 07:50:40 +0200
Message-Id: <20180601055041.12922-1-pvorel@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Masahiro Yamada <yamada.masahiro@socionext.com>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 scripts/kconfig/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 5def8779d7d8..36b092150c45 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -172,6 +172,7 @@ help:
 	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
 	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
+	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
 
 # lxdialog stuff
 check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
-- 
2.16.3

