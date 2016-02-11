Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:35835 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932AbcBKWez (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Feb 2016 17:34:55 -0500
From: Rob Herring <robh@kernel.org>
Subject: [PATCH] kbuild: Allow using host dtc instead of kernel's copy
Date: Thu, 11 Feb 2016 16:34:39 -0600
Message-Id: <1455230079-26931-1-git-send-email-robh@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org

Development of dtc happens in its own upstream repository, but testing
dtc changes against the kernel tree is useful. Change dtc to a variable
that users can override.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/Makefile.lib | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 79e8661..ceceb53 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -262,6 +262,7 @@ cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -n -f -9 > $@) || \
 
 # DTC
 # ---------------------------------------------------------------------------
+DTC ?= $(objtree)/scripts/dtc/dtc
 
 # Generate an assembly file to wrap the output of the device tree compiler
 quiet_cmd_dt_S_dtb= DTB     $@
@@ -284,7 +285,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
+	$(DTC) -O dtb -o $@ -b 0 \
 		-i $(dir $<) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
-- 
2.5.0

