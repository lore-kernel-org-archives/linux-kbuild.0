Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36280 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934444AbcKWQmM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 11:42:12 -0500
Received: by mail-pg0-f66.google.com with SMTP id x23so1424962pgx.3
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2016 08:42:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/7] kbuild: thin archives for multi-y targets
Date: Thu, 24 Nov 2016 03:41:38 +1100
Message-Id: <20161123164143.16839-3-npiggin@gmail.com>
In-Reply-To: <20161123164143.16839-1-npiggin@gmail.com>
References: <20161123164143.16839-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

THIN_ARCHIVES builds archives for built-in.o targets, have it build
multi-y targets as archives as well.

This saves another ~15% of the size of intermediate artifacts in the
build tree. After this patch, the linker is only used in final link,
and special cases like vdsos.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/Makefile.build | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 7675d11..41d2901 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -517,11 +517,18 @@ $($(subst $(obj)/,,$(@:.o=-objs)))    \
 $($(subst $(obj)/,,$(@:.o=-y)))       \
 $($(subst $(obj)/,,$(@:.o=-m)))), $^)
 
-quiet_cmd_link_multi-y = LD      $@
-cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
+cmd_link_multi-link = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
+
+ifdef CONFIG_THIN_ARCHIVES
+  quiet_cmd_link_multi-y = AR      $@
+  cmd_link_multi-y = rm -f $@; $(AR) rcST$(KBUILD_ARFLAGS) $@ $(link_multi_deps)
+else
+  quiet_cmd_link_multi-y = LD      $@
+  cmd_link_multi-y = $(cmd_link_multi-link)
+endif
 
 quiet_cmd_link_multi-m = LD [M]  $@
-cmd_link_multi-m = $(cmd_link_multi-y)
+cmd_link_multi-m = $(cmd_link_multi-link)
 
 $(multi-used-y): FORCE
 	$(call if_changed,link_multi-y)
-- 
2.10.2

