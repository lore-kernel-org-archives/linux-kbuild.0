Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:62491 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750736AbdCNVhW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Mar 2017 17:37:22 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [v333kbuild: disable -ffunction-sections on gcc-4.7 with ftrace
Date: Tue, 14 Mar 2017 22:35:51 +0100
Message-Id: <20170314213600.3812349-1-arnd@arndb.de>
In-Reply-To: <20170314213410.3762842-1-arnd@arndb.de>
References: <20170314213410.3762842-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Namhyung Kim <namhyung.with.foss@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When ftrace is enabled and we build with gcc-4.7 or older, we
get a warning for each file on architectures that select
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION:

warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]

This turns off function sections in that specific case, leaving
it enabled for all other configurations.

Fixes: b67067f1176d ("kbuild: allow archs to select link dead code/data elimination")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Namhyung Kim <namhyung.with.foss@gmail.com>
---
v2: accidentally resend the same patch as before
v3: actually fixed version number in check as pointed out by Namhyung Kim
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 6e7e644a0b84..608727d3e47f 100644
--- a/Makefile
+++ b/Makefile
@@ -662,7 +662,11 @@ KBUILD_CFLAGS	+= -Wextra
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

