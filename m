Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:58250 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760330AbcLPJ0U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Dec 2016 04:26:20 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] kbuild: disable -ffunction-sections on gcc-4.7 with ftrace
Date: Fri, 16 Dec 2016 10:24:53 +0100
Message-Id: <20161216092503.2654754-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When ftrace is enabled and we build with gcc-4.7 or older, we
get a warning for each file on architectures that select
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION:

warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]

This turns off function sections in that specific case, leaving
it enabled for all other configurations.

Fixes: b67067f1176d ("kbuild: allow archs to select link dead code/data elimination")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 4fb4b889c862..7dfd0aa4f3f7 100644
--- a/Makefile
+++ b/Makefile
@@ -638,7 +638,11 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
 
 ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
+ifdef CONFIG_FUNCTION_TRACER
+KBUILD_CFLAGS	+= $(call cc-ifversion, -ge,0409,$(call cc-option,-ffunction-sections,))
+else
 KBUILD_CFLAGS	+= $(call cc-option,-ffunction-sections,)
+endif
 KBUILD_CFLAGS	+= $(call cc-option,-fdata-sections,)
 endif
 
-- 
2.9.0

