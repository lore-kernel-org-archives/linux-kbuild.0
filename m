Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46279 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgBUW36 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 17:29:58 -0500
From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2] kbuild: Build DT binding examples with dtc warnings enabled
Date: Fri, 21 Feb 2020 16:29:55 -0600
Message-Id: <20200221222955.21038-2-robh@kernel.org>
In-Reply-To: <20200221222955.21038-1-robh@kernel.org>
References: <20200221222955.21038-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

Now that we have a separate rule for DT binding examples, we can customize
the dtc options. Let's adjust the dtc warnings to me more strict by
default so the examples get cleaned up as they get converted to schema.

Leaving 'avoid_unnecessary_addr_size' and 'graph_child_address' warnings
disabled as examples tend to be incomplete and they generates a lot of
warnings.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 78fa1a3d983a..1a149e680308 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -308,6 +308,10 @@ define rule_dtc_dt_yaml
 	$(call cmd,dtb_check,$(word 2, $(real-prereqs)))
 endef
 
+$(obj)/%.example.dt.yaml: DTC_FLAGS = \
+	-Wno-avoid_unnecessary_addr_size \
+	-Wno-graph_child_address
+
 $(obj)/%.example.dt.yaml: $(src)/%.example.dts $(DT_EXAMPLES_SCHEMA) $(DTC) FORCE
 	$(call if_changed_rule,dtc_dt_yaml)
 
-- 
2.20.1
