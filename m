Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36333 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgBUW36 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 17:29:58 -0500
From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] kbuild: Always validate DT binding examples against all schemas
Date: Fri, 21 Feb 2020 16:29:54 -0600
Message-Id: <20200221222955.21038-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

Most folks only run dt_binding_check on the single schema they care about
by setting DT_SCHEMA_FILES. That means example is only checked against
that one schema which is not always sufficient.

Let's address this by splitting processed-schema.yaml into 2 files: one
that's always all schemas for the examples and one that's just the schema
in DT_SCHEMA_FILES for dtbs.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 20 +++++++++++---------
 scripts/Makefile.lib                       | 12 ++++++++----
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 646cb3525373..16498eb19f5f 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -11,26 +11,28 @@ quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
 $(obj)/%.example.dts: $(src)/%.yaml FORCE
 	$(call if_changed,chk_binding)
 
-DT_TMP_SCHEMA := processed-schema.yaml
-
 quiet_cmd_mk_schema = SCHEMA  $@
-      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@ $(real-prereqs)
+      cmd_mk_schema = $(DT_MK_SCHEMA) $(2) -o $@ $(real-prereqs)
 
-DT_DOCS = $(shell \
+DT_DOCS = $(addprefix $(src)/, \
+	$(shell \
 	cd $(srctree)/$(src) && \
 	find * \( -name '*.yaml' ! \
-		-name $(DT_TMP_SCHEMA) ! \
+		-name 'processed-schema-*' ! \
 		-name '*.example.dt.yaml' \) \
-	)
+	))
 
-DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
+DT_SCHEMA_FILES ?= $(DT_DOCS)
 
 ifeq ($(CHECK_DTBS),)
 extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
 extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
 endif
 
-$(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
+$(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
 	$(call if_changed,mk_schema)
 
-extra-y += $(DT_TMP_SCHEMA)
+$(obj)/processed-schema-dtbs.yaml: $(DT_SCHEMA_FILES) FORCE
+	$(call if_changed,mk_schema, $(DT_MK_SCHEMA_FLAGS))
+
+extra-y += processed-schema-examples.yaml processed-schema-dtbs.yaml
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index bae62549e3d2..78fa1a3d983a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -297,17 +297,21 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 
 DT_CHECKER ?= dt-validate
 DT_BINDING_DIR := Documentation/devicetree/bindings
-DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
+DT_DTBS_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema-dtbs.yaml
+DT_EXAMPLES_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema-examples.yaml
 
 quiet_cmd_dtb_check =	CHECK   $@
-      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ ;
+      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(2) $@ ;
 
 define rule_dtc_dt_yaml
 	$(call cmd_and_fixdep,dtc,yaml)
-	$(call cmd,dtb_check)
+	$(call cmd,dtb_check,$(word 2, $(real-prereqs)))
 endef
 
-$(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
+$(obj)/%.example.dt.yaml: $(src)/%.example.dts $(DT_EXAMPLES_SCHEMA) $(DTC) FORCE
+	$(call if_changed_rule,dtc_dt_yaml)
+
+$(obj)/%.dt.yaml: $(src)/%.dts $(DT_DTBS_SCHEMA) $(DTC) FORCE
 	$(call if_changed_rule,dtc_dt_yaml)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
-- 
2.20.1
