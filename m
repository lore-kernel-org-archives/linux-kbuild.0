Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:63149 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387400AbgCDDUy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 22:20:54 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] kbuild: allow to run dt_binding_check and dtbs_check in a single command
Date: Wed,  4 Mar 2020 12:20:37 +0900
Message-Id: <20200304032038.14424-3-masahiroy@kernel.org>
In-Reply-To: <20200304032038.14424-1-masahiroy@kernel.org>
References: <20200304032038.14424-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Michal Marek <michal.lkml@markovi.net>

Since commit 93512dad334d ("dt-bindings: Improve validation build error
handling"), 'make dtbs_check' does not validate the schema fully.

If you want to check everything, you need to run two commands.

  $ make ARCH=arm dt_binding_check
  $ make ARCH=arm dtbs_check

They are exclusive each other, so you cannot do like this:

  $ make ARCH=arm dt_binding_check dtbs_check

In this case, dt-doc-validate and dt-extract-example are skipped
because CHECK_DTBS is set.

Let's make it possible to run those two targets simultaneously.
It will be useful for schema writers.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/devicetree/bindings/Makefile  | 8 +++-----
 Documentation/devicetree/writing-schema.rst | 4 ++++
 Makefile                                    | 6 +++++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index b62c0470f122..1df680d07461 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -26,10 +26,9 @@ DT_DOCS = $(addprefix $(src)/, \
 
 DT_SCHEMA_FILES ?= $(DT_DOCS)
 
-ifeq ($(CHECK_DTBS),)
-extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
-extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
-extra-y += processed-schema-examples.yaml
+extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
+extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
+extra-$(CHECK_DT_BINDING) += processed-schema-examples.yaml
 
 override DTC_FLAGS := \
 	-Wno-avoid_unnecessary_addr_size \
@@ -37,7 +36,6 @@ override DTC_FLAGS := \
 
 $(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
 	$(call if_changed,mk_schema)
-endif
 
 $(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
 $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) FORCE
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
index e94d4fe3ef77..7dec7b343842 100644
--- a/Makefile
+++ b/Makefile
@@ -1244,10 +1244,10 @@ dtbs: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
 ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
+export CHECK_DTBS=y
 dtbs: dt_binding_check
 endif
 
-dtbs_check: export CHECK_DTBS=1
 dtbs_check: dtbs
 
 dtbs_install:
@@ -1263,6 +1263,10 @@ PHONY += scripts_dtc
 scripts_dtc: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts/dtc
 
+ifneq ($(filter dt_binding_check, $(MAKECMDGOALS)),)
+export CHECK_DT_BINDING=y
+endif
+
 PHONY += dt_binding_check
 dt_binding_check: scripts_dtc
 	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
-- 
2.17.1
