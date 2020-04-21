Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:52350 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgDUDf7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Apr 2020 23:35:59 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kbuild: fix DT binding schema rule again to avoid needless rebuilds
Date: Tue, 21 Apr 2020 12:35:28 +0900
Message-Id: <20200421033529.487366-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Rob Herring <robh@kernel.org>

Since commit 7a0496056064 ("kbuild: fix DT binding schema rule to detect
command line changes"), this rule is every time re-run even if you change
nothing.

cmd_dtc takes one additional parameter to pass to the -O option of dtc.

We need to pass 'yaml' to if_changed_rule. Otherwise, cmd-check invoked
from if_changed_rule is false positive.

Fixes: 7a0496056064 ("kbuild: fix DT binding schema rule to detect command line changes")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 97547108ee7f..4b799737722c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -309,7 +309,7 @@ define rule_dtc
 endef
 
 $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-	$(call if_changed_rule,dtc)
+	$(call if_changed_rule,dtc,yaml)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
-- 
2.25.1
