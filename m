Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49126 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754403AbcDTIxd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2016 04:53:33 -0400
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH] kbuild: Get rid of KBUILD_STR
Date: Wed, 20 Apr 2016 10:53:17 +0200
Message-Id: <1461142397-18119-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

The compiler can accept -DKBUILD_MODNAME="foo", it's just a matter of
quoting. That way, we reduce the gcc command line a bit.

Signed-off-by: Michal Marek <mmarek@suse.com>
---
 scripts/Makefile.lib | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index ddf83d0..e64ad0d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -96,10 +96,10 @@ obj-dirs	:= $(addprefix $(obj)/,$(obj-dirs))
 # Note: Files that end up in two or more modules are compiled without the
 #       KBUILD_MODNAME definition. The reason is that any made-up name would
 #       differ in different configs.
-name-fix = $(subst $(comma),_,$(subst -,_,$1))
-basename_flags = -D"KBUILD_BASENAME=KBUILD_STR($(call name-fix,$(basetarget)))"
+name-fix = $(squote)$(quote)$(subst $(comma),_,$(subst -,_,$1))$(quote)$(squote)
+basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
 modname_flags  = $(if $(filter 1,$(words $(modname))),\
-                 -D"KBUILD_MODNAME=KBUILD_STR($(call name-fix,$(modname)))")
+                 -DKBUILD_MODNAME=$(call name-fix,$(modname)))
 
 orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(KBUILD_SUBDIR_CCFLAGS) \
                  $(ccflags-y) $(CFLAGS_$(basetarget).o)
@@ -162,7 +162,7 @@ endif
 
 c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(__c_flags) $(modkern_cflags)                           \
-		 -D"KBUILD_STR(s)=\#s" $(basename_flags) $(modname_flags)
+		 $(basename_flags) $(modname_flags)
 
 a_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(__a_flags) $(modkern_aflags)
-- 
1.9.2

