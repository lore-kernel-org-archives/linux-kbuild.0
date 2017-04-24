Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36561 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1046408AbdDXFoE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 01:44:04 -0400
From: frowand.list@gmail.com
Subject: [PATCH 1/2] of: add support of dtc compiler flags for device tree overlays
Date: Sun, 23 Apr 2017 22:43:14 -0700
Message-Id: <1493012595-696-2-git-send-email-frowand.list@gmail.com>
In-Reply-To: <1493012595-696-1-git-send-email-frowand.list@gmail.com>
References: <1493012595-696-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org, Michal Marek <mmarek@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

The dtc compiler version that adds initial support was available
in 4.11-rc1.  Add the ability to set the dtc compiler flags needed
by overlays.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 scripts/Makefile.lib | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a07f9014944..0bbec480d323 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -283,6 +283,8 @@ ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
 DTC_FLAGS += -Wno-unit_address_vs_reg
 endif
 
+DTC_FLAGS += $(DTC_FLAGS_$(basetarget))
+
 # Generate an assembly file to wrap the output of the device tree compiler
 quiet_cmd_dt_S_dtb= DTB     $@
 cmd_dt_S_dtb=						\
-- 
Frank Rowand <frank.rowand@sony.com>

