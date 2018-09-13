Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:24653 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbeIMN3R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Sep 2018 09:29:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unneeded link_multi_deps
Date: Thu, 13 Sep 2018 17:20:41 +0900
Message-Id: <1536826841-4458-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Since commit c8589d1e9e01 ("kbuild: handle multi-objs dependency
appropriately"), $^ really represents all the prerequisite of the
composite object being built.

Hence, $(filter-out FORCE,$^) contains all the objects to link
together, which is much simpler than link_multi_deps calculation.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index cb03774..d7fa203 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -485,28 +485,12 @@ targets += $(obj)/lib-ksyms.o
 
 endif
 
-#
-# Rule to link composite objects
-#
-#  Composite objects are specified in kbuild makefile as follows:
-#    <composite-object>-objs := <list of .o files>
-#  or
-#    <composite-object>-y    := <list of .o files>
-#  or
-#    <composite-object>-m    := <list of .o files>
-#  The -m syntax only works if <composite object> is a module
-link_multi_deps =                     \
-$(filter $(addprefix $(obj)/,         \
-$($(subst $(obj)/,,$(@:.o=-objs)))    \
-$($(subst $(obj)/,,$(@:.o=-y)))       \
-$($(subst $(obj)/,,$(@:.o=-m)))), $^)
-
 quiet_cmd_link_multi-m = LD [M]  $@
-cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
+cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter-out FORCE,$^) $(cmd_secanalysis)
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-	@{ echo $(@:.o=.ko); echo $(link_multi_deps); \
+	@{ echo $(@:.o=.ko); echo $(filter-out FORCE,$^); \
 	   $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
-- 
2.7.4
