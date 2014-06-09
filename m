Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:44077 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750729AbaFIERD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 00:17:03 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2 3/5] kbuild: drop shared library support from Makefile.host
Date: Mon,  9 Jun 2014 13:16:32 +0900
Message-Id: <1402287394-31133-4-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402287394-31133-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402287394-31133-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.m@jp.panasonic.com>

The shared library feature in Makefile.host is no longer used.
Rip it off to keep the build infrastucture simple.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Suggested-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2:
  - Newly added

 scripts/Makefile.host | 43 +++----------------------------------------
 1 file changed, 3 insertions(+), 40 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index bf44e79..1c2e570 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -20,16 +20,6 @@
 # Will compile qconf as a C++ program, and menu as a C program.
 # They are linked as C++ code to the executable qconf
 
-# hostprogs-y := conf
-# conf-objs  := conf.o libkconfig.so
-# libkconfig-objs := expr.o type.o
-# Will create a shared library named libkconfig.so that consists of
-# expr.o and type.o (they are both compiled as C code and the object files
-# are made as position independent code).
-# conf.c is compiled as a C program, and conf.o is linked together with
-# libkconfig.so as the executable conf.
-# Note: Shared libraries consisting of C++ files are not supported
-
 __hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
 
 # C code
@@ -52,15 +42,6 @@ host-cxxmulti	:= $(foreach m,$(__hostprogs),$(if $($(m)-cxxobjs),$(m)))
 # C++ Object (.o) files compiled from .cc files
 host-cxxobjs	:= $(sort $(foreach m,$(host-cxxmulti),$($(m)-cxxobjs)))
 
-# Shared libaries (only .c supported)
-# Shared libraries (.so) - all .so files referenced in "xxx-objs"
-host-cshlib	:= $(sort $(filter %.so, $(host-cobjs)))
-# Remove .so files from "xxx-objs"
-host-cobjs	:= $(filter-out %.so,$(host-cobjs))
-
-#Object (.o) files used by the shared libaries
-host-cshobjs	:= $(sort $(foreach m,$(host-cshlib),$($(m:.so=-objs))))
-
 # output directory for programs/.o files
 # hostprogs-y := tools/build may have been specified. Retrieve directory
 host-objdirs := $(foreach f,$(__hostprogs), $(if $(dir $(f)),$(dir $(f))))
@@ -82,8 +63,6 @@ host-cmulti	:= $(addprefix $(obj)/,$(host-cmulti))
 host-cobjs	:= $(addprefix $(obj)/,$(host-cobjs))
 host-cxxmulti	:= $(addprefix $(obj)/,$(host-cxxmulti))
 host-cxxobjs	:= $(addprefix $(obj)/,$(host-cxxobjs))
-host-cshlib	:= $(addprefix $(obj)/,$(host-cshlib))
-host-cshobjs	:= $(addprefix $(obj)/,$(host-cshobjs))
 host-objdirs    := $(addprefix $(obj)/,$(host-objdirs))
 
 obj-dirs += $(host-objdirs)
@@ -124,7 +103,7 @@ quiet_cmd_host-cmulti	= HOSTLD  $@
       cmd_host-cmulti	= $(HOSTCC) $(HOSTLDFLAGS) -o $@ \
 			  $(addprefix $(obj)/,$($(@F)-objs)) \
 			  $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
-$(host-cmulti): $(obj)/%: $(host-cobjs) $(host-cshlib) FORCE
+$(host-cmulti): $(obj)/%: $(host-cobjs) FORCE
 	$(call if_changed,host-cmulti)
 
 # Create .o file from a single .c file
@@ -141,7 +120,7 @@ quiet_cmd_host-cxxmulti	= HOSTLD  $@
 			  $(foreach o,objs cxxobjs,\
 			  $(addprefix $(obj)/,$($(@F)-$(o)))) \
 			  $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
-$(host-cxxmulti): $(obj)/%: $(host-cobjs) $(host-cxxobjs) $(host-cshlib) FORCE
+$(host-cxxmulti): $(obj)/%: $(host-cobjs) $(host-cxxobjs) FORCE
 	$(call if_changed,host-cxxmulti)
 
 # Create .o file from a single .cc (C++) file
@@ -150,21 +129,5 @@ quiet_cmd_host-cxxobjs	= HOSTCXX $@
 $(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
 	$(call if_changed_dep,host-cxxobjs)
 
-# Compile .c file, create position independent .o file
-# host-cshobjs -> .o
-quiet_cmd_host-cshobjs	= HOSTCC  -fPIC $@
-      cmd_host-cshobjs	= $(HOSTCC) $(hostc_flags) -fPIC -c -o $@ $<
-$(host-cshobjs): $(obj)/%.o: $(src)/%.c FORCE
-	$(call if_changed_dep,host-cshobjs)
-
-# Link a shared library, based on position independent .o files
-# *.o -> .so shared library (host-cshlib)
-quiet_cmd_host-cshlib	= HOSTLLD -shared $@
-      cmd_host-cshlib	= $(HOSTCC) $(HOSTLDFLAGS) -shared -o $@ \
-			  $(addprefix $(obj)/,$($(@F:.so=-objs))) \
-			  $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
-$(host-cshlib): $(obj)/%: $(host-cshobjs) FORCE
-	$(call if_changed,host-cshlib)
-
 targets += $(host-csingle)  $(host-cmulti) $(host-cobjs)\
-	   $(host-cxxmulti) $(host-cxxobjs) $(host-cshlib) $(host-cshobjs)
+	   $(host-cxxmulti) $(host-cxxobjs)
-- 
1.9.1

