Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37826 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759840AbcALNeQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Jan 2016 08:34:16 -0500
Received: by mail-wm0-f51.google.com with SMTP id f206so320457355wmf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2016 05:34:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] kbuild: Demote 'sign-compare' warning to W=2
Date: Tue, 12 Jan 2016 13:31:59 +0000
Message-Id: <1452605519-26797-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, maxime.coquelin@st.com, mmarek@suse.com, linux-kbuild@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>

Ideally, a kernel compile with W=1 enabled should complete cleanly;
however, when we run one currently we are presented with ~25k warnings.
'sign-compare' accounts for ~22k of those ~25k.

In this patch we're demoting 'sign-compare' warnings to W=2, with a view
to fixing the remaining 3k W=1 warnings required for a clean build.

Cc: Arnd Bergmann <arnd@arndb.de>
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

