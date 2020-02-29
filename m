Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43390 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgB2Ahf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 19:37:35 -0500
From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] kbuild: Build DT binding examples with dtc warnings enabled
Date: Fri, 28 Feb 2020 18:37:31 -0600
Message-Id: <20200229003731.2728-2-robh@kernel.org>
In-Reply-To: <20200229003731.2728-1-robh@kernel.org>
References: <20200229003731.2728-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

Now that we have a separate rule for DT binding examples, we can customize
the dtc options. Let's adjust the dtc warnings to me more strict by
default so the examples get cleaned up as they get converted to schema.

Leaving 'avoid_unnecessary_addr_size' and 'graph_child_address' warnings
disabled as examples tend to be incomplete and they generates a lot of
warnings.

Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 7c40d5ba1b51..b62c0470f122 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -31,6 +31,10 @@ extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
 extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
 extra-y += processed-schema-examples.yaml
 
+override DTC_FLAGS := \
+	-Wno-avoid_unnecessary_addr_size \
+	-Wno-graph_child_address
+
 $(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
 	$(call if_changed,mk_schema)
 endif
-- 
2.20.1
