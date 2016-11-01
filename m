Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:32870 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161313AbcKAB4f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Oct 2016 21:56:35 -0400
Received: by mail-pf0-f193.google.com with SMTP id a136so6781039pfa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Oct 2016 18:56:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/2] kbuild: thin archives for multi-y targets
Date: Tue,  1 Nov 2016 12:56:13 +1100
Message-Id: <20161101015614.1546-2-npiggin@gmail.com>
In-Reply-To: <20161101015614.1546-1-npiggin@gmail.com>
References: <20161101015614.1546-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

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
index 6312e14..6990932 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -514,11 +514,18 @@ $($(subst $(obj)/,,$(@:.o=-objs)))    \
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
2.9.3

