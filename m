Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:36658 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728923AbgAMSQy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 13:16:54 -0500
From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [RFC PATCH 3/3] scripts: Use -B dtc option to generate dtb build information.
Date: Mon, 13 Jan 2020 19:16:25 +0100
Message-ID: <20200113181625.3130-4-alexandre.torgue@st.com>
In-Reply-To: <20200113181625.3130-1-alexandre.torgue@st.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

This commit adds a new script to create a string in tmp file with
some information (date, linux version, user). This file is then used by
dtc with -B option to append dts file with a new property.
During kernel boot it will then be possible to printout DTB build
information (date, linux version used, user).

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3fa32f83b2d7..6a98eac1e56d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -235,6 +235,7 @@ quiet_cmd_gzip = GZIP    $@
 # DTC
 # ---------------------------------------------------------------------------
 DTC ?= $(objtree)/scripts/dtc/dtc
+DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info
 
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
@@ -275,11 +276,13 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
-	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(DTC) -O $(2) -o $@ -b 0 \
+       $(DTB_GEN_INFO) $(@).info ;\
+       $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+       $(DTC) -O $(2) -o $@ -b 0 -B $(@).info\
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
-		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
+               -d $(depfile).dtc.tmp $(dtc-tmp) ; \
+       rm $(@).info ; \
+       cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc,dtb)
diff --git a/scripts/gen_dtb_build_info b/scripts/gen_dtb_build_info
new file mode 100755
index 000000000000..30cf7506b9d5
--- /dev/null
+++ b/scripts/gen_dtb_build_info
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+DTB_TARGET=$@
+COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
+
+touch $DTB_TARGET
+
+{
+  echo From Linux $KERNELRELEASE by $COMPILE_BY the $(date).
+} > $DTB_TARGET
-- 
2.17.1
