Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:23008 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgBVTEy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 14:04:54 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/5] kbuild: add dt_binding_check to PHONY in a correct place
Date: Sun, 23 Feb 2020 04:04:34 +0900
Message-Id: <20200222190435.11767-4-masahiroy@kernel.org>
In-Reply-To: <20200222190435.11767-1-masahiroy@kernel.org>
References: <20200222190435.11767-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The dt_binding_check is added to PHONY, but it is visible only
when $(dtstree) is not empty. So, it is not specified as phony
for ARCH=x86 etc.

Add it to PHONY outside the ifneq ... endif block.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 102710a9228c..83f9b8f6fbaf 100644
--- a/Makefile
+++ b/Makefile
@@ -1238,7 +1238,7 @@ ifneq ($(dtstree),)
 %.dtb: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
-PHONY += dtbs dtbs_install dtbs_check dt_binding_check
+PHONY += dtbs dtbs_install dtbs_check
 dtbs dtbs_check: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
@@ -1258,6 +1258,7 @@ PHONY += scripts_dtc
 scripts_dtc: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts/dtc
 
+PHONY += dt_binding_check
 dt_binding_check: scripts_dtc
 	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
 
-- 
2.17.1
