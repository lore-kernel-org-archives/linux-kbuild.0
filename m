Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:51071 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404376AbgFYRFN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 13:05:13 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/4] dt-bindings: do not build processed-schema.yaml for 'make dt_binding_check'
Date: Fri, 26 Jun 2020 02:04:32 +0900
Message-Id: <20200625170434.635114-3-masahiroy@kernel.org>
In-Reply-To: <20200625170434.635114-1-masahiroy@kernel.org>
References: <20200625170434.635114-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

Currently, processed-schema.yaml is always built, but it is actually
used only for 'make dtbs_check'.

'make dt_binding_check' uses processed-schema-example.yaml instead.

Build processed-schema.yaml only for 'make dtbs_check'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/devicetree/bindings/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index f20d234aec46..aa243328ed43 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -52,7 +52,7 @@ $(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := $(DT_MK_SCHEMA_USERONLY_FLAG
 $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) check_dtschema_version FORCE
 	$(call if_changed,mk_schema)
 
-extra-y += processed-schema.yaml
+extra-$(CHECK_DTBS) += processed-schema.yaml
 
 # Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
 # build artifacts here before they are processed by scripts/Makefile.clean
-- 
2.25.1
