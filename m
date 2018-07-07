Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:38365 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932741AbeGGBHg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 21:07:36 -0400
Received: by mail-qk0-f196.google.com with SMTP id y4-v6so7215620qka.5
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Jul 2018 18:07:36 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH 5/7] treewide: Rename HOSTLDFLAGS to KBUILD_HOSTLDFLAGS
Date: Fri,  6 Jul 2018 18:07:07 -0700
Message-Id: <20180707010709.16648-6-labbott@redhat.com>
In-Reply-To: <20180707010709.16648-1-labbott@redhat.com>
References: <20180707010709.16648-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>


In preparation for enabling command line LDFLAGS, re-name HOSTLDFLAGS to
KBUILD_HOSTLDFLAGS as the internal use only flags. This should not have any
visible effects.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
 Makefile               |  4 ++--
 net/bpfilter/Makefile  |  2 +-
 scripts/Makefile.host  | 10 +++++-----
 tools/build/Makefile   |  2 +-
 tools/objtool/Makefile |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 9c3f1864d678..319736b80016 100644
--- a/Makefile
+++ b/Makefile
@@ -362,7 +362,7 @@ HOSTCXX      = g++
 KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
 KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
-HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
+KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
 HOST_LOADLIBES := $(HOST_LFS_LIBS)
 
 # Make variables (CC, etc...)
@@ -430,7 +430,7 @@ LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
-export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
+export CPP AR NM STRIP OBJCOPY OBJDUMP KBUILD_HOSTLDFLAGS HOST_LOADLIBES
 export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON PYTHON2 PYTHON3 UTS_MACHINE
 export HOSTCXX KBUILD_HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
diff --git a/net/bpfilter/Makefile b/net/bpfilter/Makefile
index 70beeb4ad806..0947ee7f70d5 100644
--- a/net/bpfilter/Makefile
+++ b/net/bpfilter/Makefile
@@ -12,7 +12,7 @@ ifeq ($(CONFIG_BPFILTER_UMH), y)
 # builtin bpfilter_umh should be compiled with -static
 # since rootfs isn't mounted at the time of __init
 # function is called and do_execv won't find elf interpreter
-HOSTLDFLAGS += -static
+KBUILD_HOSTLDFLAGS += -static
 endif
 
 $(obj)/bpfilter_umh_blob.o: $(obj)/bpfilter_umh
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 1c153cc5b530..07acf5779f55 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -84,7 +84,7 @@ hostcxx_flags  = -Wp,-MD,$(depfile) $(__hostcxx_flags)
 # Create executable from a single .c file
 # host-csingle -> Executable
 quiet_cmd_host-csingle 	= HOSTCC  $@
-      cmd_host-csingle	= $(HOSTCC) $(hostc_flags) $(HOSTLDFLAGS) -o $@ $< \
+      cmd_host-csingle	= $(HOSTCC) $(hostc_flags) $(KBUILD_HOSTLDFLAGS) -o $@ $< \
 	  	$(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
 $(host-csingle): $(obj)/%: $(src)/%.c FORCE
 	$(call if_changed_dep,host-csingle)
@@ -92,7 +92,7 @@ $(host-csingle): $(obj)/%: $(src)/%.c FORCE
 # Link an executable based on list of .o files, all plain c
 # host-cmulti -> executable
 quiet_cmd_host-cmulti	= HOSTLD  $@
-      cmd_host-cmulti	= $(HOSTCC) $(HOSTLDFLAGS) -o $@ \
+      cmd_host-cmulti	= $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ \
 			  $(addprefix $(obj)/,$($(@F)-objs)) \
 			  $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
 $(host-cmulti): FORCE
@@ -109,7 +109,7 @@ $(host-cobjs): $(obj)/%.o: $(src)/%.c FORCE
 # Link an executable based on list of .o files, a mixture of .c and .cc
 # host-cxxmulti -> executable
 quiet_cmd_host-cxxmulti	= HOSTLD  $@
-      cmd_host-cxxmulti	= $(HOSTCXX) $(HOSTLDFLAGS) -o $@ \
+      cmd_host-cxxmulti	= $(HOSTCXX) $(KBUILD_HOSTLDFLAGS) -o $@ \
 			  $(foreach o,objs cxxobjs,\
 			  $(addprefix $(obj)/,$($(@F)-$(o)))) \
 			  $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
@@ -143,7 +143,7 @@ $(host-cxxshobjs): $(obj)/%.o: $(src)/%.c FORCE
 # Link a shared library, based on position independent .o files
 # *.o -> .so shared library (host-cshlib)
 quiet_cmd_host-cshlib	= HOSTLLD -shared $@
-      cmd_host-cshlib	= $(HOSTCC) $(HOSTLDFLAGS) -shared -o $@ \
+      cmd_host-cshlib	= $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -shared -o $@ \
 			  $(addprefix $(obj)/,$($(@F:.so=-objs))) \
 			  $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
 $(host-cshlib): FORCE
@@ -153,7 +153,7 @@ $(call multi_depend, $(host-cshlib), .so, -objs)
 # Link a shared library, based on position independent .o files
 # *.o -> .so shared library (host-cxxshlib)
 quiet_cmd_host-cxxshlib	= HOSTLLD -shared $@
-      cmd_host-cxxshlib	= $(HOSTCXX) $(HOSTLDFLAGS) -shared -o $@ \
+      cmd_host-cxxshlib	= $(HOSTCXX) $(KBUILD_HOSTLDFLAGS) -shared -o $@ \
 			  $(addprefix $(obj)/,$($(@F:.so=-objs))) \
 			  $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
 $(host-cxxshlib): FORCE
diff --git a/tools/build/Makefile b/tools/build/Makefile
index cd0fd2cd165b..5f7903e8eabd 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -43,7 +43,7 @@ $(OUTPUT)fixdep-in.o: FORCE
 	$(Q)$(MAKE) $(build)=fixdep
 
 $(OUTPUT)fixdep: $(OUTPUT)fixdep-in.o
-	$(QUIET_LINK)$(HOSTCC) $(HOSTLDFLAGS) $(LDFLAGS) -o $@ $<
+	$(QUIET_LINK)$(HOSTCC) $(KBUILD_HOSTLDFLAGS) $(LDFLAGS) -o $@ $<
 
 FORCE:
 
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index b5d8c2964b52..c9d038f91af6 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -32,7 +32,7 @@ INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
 CFLAGS   += -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES)
-LDFLAGS  += -lelf $(LIBSUBCMD) $(HOSTLDFLAGS)
+LDFLAGS  += -lelf $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
 
 # Allow old libelf to be used:
 elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
-- 
2.17.1

