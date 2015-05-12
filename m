Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41697 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752910AbbELL45 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 May 2015 07:56:57 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] kbuild: Create a rule for building device tree overlay objects
Date: Tue, 12 May 2015 13:56:56 +0200
Message-Id: <1431431816-24612-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

This allows to handle device tree overlays like plain device trees.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Questions:
  - Do we want dtso files under arch/<arch>/boot/dts/, too?
  - Do we want to move the dts files outside the kernel repository
    first?

 scripts/Makefile.lib | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 79e86613712f2230..4b14eef1d4b2ce8f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -292,6 +292,9 @@ cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 $(obj)/%.dtb: $(src)/%.dts FORCE
 	$(call if_changed_dep,dtc)
 
+$(obj)/%.dtbo: $(src)/%.dtso FORCE
+	$(call if_changed_dep,dtc)
+
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
 # Bzip2
-- 
1.9.1

