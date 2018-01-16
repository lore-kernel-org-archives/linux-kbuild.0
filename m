Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46018 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750861AbeAPUo7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jan 2018 15:44:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 98787369B7
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jan 2018 20:44:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-72.rdu2.redhat.com [10.10.120.72])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 246575C1AB
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jan 2018 20:44:58 +0000 (UTC)
From: Yaakov Selkowitz <yselkowi@redhat.com>
Subject: [PATCH] kconfig: fix make xconfig when gettext is missing
Date: Tue, 16 Jan 2018 14:44:45 -0600
Message-Id: <20180116204445.21096-1-yselkowi@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

The C-based config programs are properly guarded from a missing (or,
currently, external) libintl.h by the HOST_EXTRACFLAGS check, but
this does not help the C++-based qconf.

Signed-off-by: Yaakov Selkowitz <yselkowi@redhat.com>
---
 scripts/kconfig/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 297c1bf35140..f4c2a22d993b 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -205,6 +205,7 @@ always := dochecklxdialog
 
 # Add environment specific flags
 HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
+HOST_EXTRACXXFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCXX) $(HOSTCXXFLAGS))
 
 # generated files seem to need this to find local include files
 HOSTCFLAGS_zconf.lex.o	:= -I$(src)
-- 
2.15.1

