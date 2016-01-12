Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:36598 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753093AbcALO0c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Jan 2016 09:26:32 -0500
Received: by mail-wm0-f41.google.com with SMTP id l65so254183440wmf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2016 06:26:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] kbuild: Demote 'sign-compare' warning to W=2
Date: Tue, 12 Jan 2016 14:24:18 +0000
Message-Id: <1452608658-28190-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, maxime.coquelin@st.com, mmarek@suse.com, linux-kbuild@vger.kernel.org, arnd@arndb.de, Lee Jones <lee.jones@linaro.org>

Ideally, a kernel compile with W=1 enabled should complete cleanly;
however, when we run one currently we are presented with ~25k warnings.
'sign-compare' accounts for ~22k of those ~25k.

In this patch we're demoting 'sign-compare' warnings to W=2, with a view
to fixing the remaining 3k W=1 warnings required for a clean build.

Arnd adds:
  "As per our discussion, I'd add that this was inadvertedly introduced
   by Behan when he moved the clang specific warnings into an ifdef block
   and did not notice that -Wsign-compare was interpreted by both gcc
   and clang.

   Earlier, it was introduced in just the same way by Jan-Simon as part
   of 3d3d6b847420 ("kbuild: LLVMLinux: Adapt warnings for compilation
   with clang")."

Acked-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 26ea6bb1fef0 ("kbuild, LLVMLinux: Supress warnings unless W=1-3")
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 scripts/Makefile.extrawarn | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 4efedcb..f9e47a7 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -25,6 +25,7 @@ warning-1 += -Wold-style-definition
 warning-1 += $(call cc-option, -Wmissing-include-dirs)
 warning-1 += $(call cc-option, -Wunused-but-set-variable)
 warning-1 += $(call cc-disable-warning, missing-field-initializers)
+warning-1 += $(call cc-disable-warning, sign-compare)
 
 warning-2 := -Waggregate-return
 warning-2 += -Wcast-align
@@ -33,6 +34,7 @@ warning-2 += -Wnested-externs
 warning-2 += -Wshadow
 warning-2 += $(call cc-option, -Wlogical-op)
 warning-2 += $(call cc-option, -Wmissing-field-initializers)
+warning-2 += $(call cc-option, -Wsign-compare)
 
 warning-3 := -Wbad-function-cast
 warning-3 += -Wcast-qual
-- 
1.9.1

