Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34503 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756150AbcCaQqb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Mar 2016 12:46:31 -0400
From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dtc: turn off dtc unit address warnings by default
Date: Thu, 31 Mar 2016 11:46:18 -0500
Message-Id: <1459442778-12175-1-git-send-email-robh@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

The newly added dtc warning to check DT unit-address without reg
property and vice-versa generates lots of warnings. Turn off the check
unless building with W=1 or W=2.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org
---
Michal, I plan to apply this with the corresponding dtc update.

 scripts/Makefile.lib | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index ddf83d0..ed1b7c4 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -277,6 +277,11 @@ cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -n -f -9 > $@) || \
 # ---------------------------------------------------------------------------
 DTC ?= $(objtree)/scripts/dtc/dtc
 
+# Disable noisy checks by default
+ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
+DTC_FLAGS += -Wno-unit_address_vs_reg
+endif
+
 # Generate an assembly file to wrap the output of the device tree compiler
 quiet_cmd_dt_S_dtb= DTB     $@
 cmd_dt_S_dtb=						\
-- 
2.5.0

