Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:34764 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759184AbaGPHMm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 03:12:42 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v3 3/5] kbuild: drop shared library support from Makefile.host
Date: Wed, 16 Jul 2014 16:12:21 +0900
Message-Id: <1405494743-29566-4-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.m@jp.panasonic.com>

The shared library feature in Makefile.host is no longer used.
Rip it off to keep the build infrastucture simple.

Update Documentation/kbuild/makefiles.txt too.
The section "4.3 Definition shared libraries" should be removed
and the following sections should be re-numbered.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Suggested-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v3:
  - Update Documentation/kbuild/makefile.txt

Changes in v2:
  - Newly added

 Documentation/kbuild/makefiles.txt | 39 +++++++---------------------------
 scripts/Makefile.host              | 43 +++-----------------------------------
 2 files changed, 11 insertions(+), 71 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index c600e2f..764f599 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -23,11 +23,10 @@ This document describes the Linux kernel Makefiles.
 	=== 4 Host Program support
 	   --- 4.1 Simple Host Program
 	   --- 4.2 Composite Host Programs
-	   --- 4.3 Defining shared libraries
-	   --- 4.4 Using C++ for host programs
-	   --- 4.5 Controlling compiler options for host programs
-	   --- 4.6 When host programs are actually built
-	   --- 4.7 Using hostprogs-$(CONFIG_FOO)
+	   --- 4.3 Using C++ for host programs
+	   --- 4.4 Controlling compiler options for host programs
+	   --- 4.5 When host programs are actually built
+	   --- 4.6 Using hostprogs-$(CONFIG_FOO)
 
 	=== 5 Kbuild clean infrastructure
 
@@ -643,29 +642,7 @@ Both possibilities are described in the following.
 	Finally, the two .o files are linked to the executable, lxdialog.
 	Note: The syntax <executable>-y is not permitted for host-programs.
 
---- 4.3 Defining shared libraries
-
-	Objects with extension .so are considered shared libraries, and
-	will be compiled as position independent objects.
-	Kbuild provides support for shared libraries, but the usage
-	shall be restricted.
-	In the following example the libkconfig.so shared library is used
-	to link the executable conf.
-
-	Example:
-		#scripts/kconfig/Makefile
-		hostprogs-y     := conf
-		conf-objs       := conf.o libkconfig.so
-		libkconfig-objs := expr.o type.o
-
-	Shared libraries always require a corresponding -objs line, and
-	in the example above the shared library libkconfig is composed by
-	the two objects expr.o and type.o.
-	expr.o and type.o will be built as position independent code and
-	linked as a shared library libkconfig.so. C++ is not supported for
-	shared libraries.
-
---- 4.4 Using C++ for host programs
+--- 4.3 Using C++ for host programs
 
 	kbuild offers support for host programs written in C++. This was
 	introduced solely to support kconfig, and is not recommended
@@ -688,7 +665,7 @@ Both possibilities are described in the following.
 		qconf-cxxobjs := qconf.o
 		qconf-objs    := check.o
 
---- 4.5 Controlling compiler options for host programs
+--- 4.4 Controlling compiler options for host programs
 
 	When compiling host programs, it is possible to set specific flags.
 	The programs will always be compiled utilising $(HOSTCC) passed
@@ -716,7 +693,7 @@ Both possibilities are described in the following.
 	When linking qconf, it will be passed the extra option
 	"-L$(QTDIR)/lib".
 
---- 4.6 When host programs are actually built
+--- 4.5 When host programs are actually built
 
 	Kbuild will only build host-programs when they are referenced
 	as a prerequisite.
@@ -747,7 +724,7 @@ Both possibilities are described in the following.
 	This will tell kbuild to build lxdialog even if not referenced in
 	any rule.
 
---- 4.7 Using hostprogs-$(CONFIG_FOO)
+--- 4.6 Using hostprogs-$(CONFIG_FOO)
 
 	A typical pattern in a Kbuild file looks like this:
 
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

