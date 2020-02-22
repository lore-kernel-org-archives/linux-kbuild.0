Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:23060 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbgBVTE7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 14:04:59 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 5/5] kbuild: allow to run dt_binding_check and dtbs_check in a single command
Date: Sun, 23 Feb 2020 04:04:35 +0900
Message-Id: <20200222190435.11767-5-masahiroy@kernel.org>
In-Reply-To: <20200222190435.11767-1-masahiroy@kernel.org>
References: <20200222190435.11767-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Since commit 93512dad334d ("dt-bindings: Improve validation build error
handling"), 'make dtbs_check' does not validate the schema fully.

If you want to check everything, you need to run two commands.

  $ make ARCH=arm dt_binding_check
  $ make ARCH=arm dtbs_check

You cannot do:

  $ make ARCH=arm dt_binding_check dtbs_check

Because CHECK_DTBS is set, dt-doc-validate and dt-extract-example
are skipped.

Making it work will be useful for schema writers.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/devicetree/bindings/Makefile  | 6 ++----
 Documentation/devicetree/writing-schema.rst | 4 ++++
 Makefile                                    | 8 +++++---
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 646cb3525373..6efa2094b95e 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -25,10 +25,8 @@ DT_DOCS = $(shell \
 
 DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
 
-ifeq ($(CHECK_DTBS),)
-extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
-extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
-endif
+extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
+extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
 
 $(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
 	$(call if_changed,mk_schema)
diff --git a/Documentation/devicetree/writing-schema.rst b/Documentation/devicetree/writing-schema.rst
index 7635ab230456..220cf464ed77 100644
--- a/Documentation/devicetree/writing-schema.rst
+++ b/Documentation/devicetree/writing-schema.rst
@@ -147,6 +147,10 @@ Note that ``dtbs_check`` will skip any binding schema files with errors. It is
 necessary to use ``dt_binding_check`` to get all the validation errors in the
 binding schema files.
 
+It is possible to run both in a single command::
+
+    make dt_binding_check dtbs_check
+
 It is also possible to run checks with a single schema file by setting the
 ``DT_SCHEMA_FILES`` variable to a specific schema file.
 
diff --git a/Makefile b/Makefile
index 83f9b8f6fbaf..59dd768a1c1e 100644
--- a/Makefile
+++ b/Makefile
@@ -1243,7 +1243,7 @@ dtbs dtbs_check: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
 dtbs_check: export CHECK_DTBS=1
-dtbs_check: dt_binding_check
+dtbs_check: __dt_binding_check
 
 dtbs_install:
 	$(Q)$(MAKE) $(dtbinst)=$(dtstree)
@@ -1258,8 +1258,10 @@ PHONY += scripts_dtc
 scripts_dtc: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts/dtc
 
-PHONY += dt_binding_check
-dt_binding_check: scripts_dtc
+PHONY += dt_binding_check __dt_binding_check
+dt_binding_check: export CHECK_DT_BINDING=y
+dt_binding_check: __dt_binding_check
+__dt_binding_check: scripts_dtc
 	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
 
 # ---------------------------------------------------------------------------
-- 
2.17.1
