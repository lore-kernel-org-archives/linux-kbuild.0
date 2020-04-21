Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:52663 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgDUDgK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Apr 2020 23:36:10 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] kbuild: use separate commands for generating *.dtb and *.dt.yaml
Date: Tue, 21 Apr 2020 12:35:29 +0900
Message-Id: <20200421033529.487366-2-masahiroy@kernel.org>
In-Reply-To: <20200421033529.487366-1-masahiroy@kernel.org>
References: <20200421033529.487366-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

Currently, cmd_dtc takes $(2) to select the target format. The
additional parameter complicates things when it is used with
cmd_and_fixdep and if_changed_rule.

To make it easier to understand, use a separate cmd_dtc_yaml.

One visible change is, 'DTC [Y]' is used for the log when compiling
*.dts to *.dt.yaml.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4b799737722c..d5ac19e10e1d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -284,32 +284,37 @@ cmd_dt_S_dtb=						\
 $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 	$(call if_changed,dt_S_dtb)
 
-quiet_cmd_dtc = DTC     $@
-cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
+__cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(DTC) -O $(2) -o $@ -b 0 \
+	$(DTC) -O $(1) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
+quiet_cmd_dtc = DTC     $@
+      cmd_dtc = $(call __cmd_dtc,dtb)
+
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
-	$(call if_changed_dep,dtc,dtb)
+	$(call if_changed_dep,dtc)
 
 DT_CHECKER ?= dt-validate
 DT_BINDING_DIR := Documentation/devicetree/bindings
 # DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
 DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
 
+quiet_cmd_dtc_yaml = DTC [Y] $@
+      cmd_dtc_yaml = $(call __cmd_dtc,yaml)
+
 quiet_cmd_dtb_check =	CHECK   $@
       cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
 
-define rule_dtc
-	$(call cmd_and_fixdep,dtc,yaml)
+define rule_dtc_yaml
+	$(call cmd_and_fixdep,dtc_yaml)
 	$(call cmd,dtb_check)
 endef
 
 $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-	$(call if_changed_rule,dtc,yaml)
+	$(call if_changed_rule,dtc_yaml)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
-- 
2.25.1
