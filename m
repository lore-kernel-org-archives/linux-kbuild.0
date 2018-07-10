Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:44436 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933375AbeGJAqT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 20:46:19 -0400
Received: by mail-qt0-f194.google.com with SMTP id b15-v6so16988122qtp.11
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jul 2018 17:46:19 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv2] treewide: Rename HOSTCFLAGS -> KBUILD_HOSTCFLAGS
Date: Mon,  9 Jul 2018 17:45:58 -0700
Message-Id: <20180710004602.21599-4-labbott@redhat.com>
In-Reply-To: <20180710004602.21599-1-labbott@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

In preparation for enabling command line CFLAGS, re-name HOSTCFLAGS to
KBUILD_HOSTCFLAGS as the internal use only flags. This should not have any
visible effects.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v2: Dropped name change for individual files (still CHOSTFLAGS_foo)
---
 Makefile                  |  4 ++--
 arch/alpha/boot/Makefile  |  2 +-
 net/bpfilter/Makefile     |  2 +-
 samples/bpf/Makefile      | 10 +++++-----
 scripts/Kbuild.include    |  2 +-
 scripts/Makefile.host     |  2 +-
 tools/build/Build.include |  2 +-
 tools/objtool/Makefile    |  2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 925c55f2524f..1feec222f3c1 100644
--- a/Makefile
+++ b/Makefile
@@ -359,7 +359,7 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
 
 HOSTCC       = gcc
 HOSTCXX      = g++
-HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
+KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
 HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
 HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
@@ -429,7 +429,7 @@ KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
 LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 
-export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
+export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
 export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON PYTHON2 PYTHON3 UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index 0cbe4c59d3ce..dfccf0195306 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -14,7 +14,7 @@ targets		:= vmlinux.gz vmlinux \
 		   tools/bootpzh bootloader bootpheader bootpzheader 
 OBJSTRIP	:= $(obj)/tools/objstrip
 
-HOSTCFLAGS	:= -Wall -I$(objtree)/usr/include
+KBUILD_HOSTCFLAGS	:= -Wall -I$(objtree)/usr/include
 BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
 
 # SRM bootable image.  Copy to offset 512 of a partition.
diff --git a/net/bpfilter/Makefile b/net/bpfilter/Makefile
index 39c6980b5d99..70beeb4ad806 100644
--- a/net/bpfilter/Makefile
+++ b/net/bpfilter/Makefile
@@ -5,7 +5,7 @@
 
 hostprogs-y := bpfilter_umh
 bpfilter_umh-objs := main.o
-HOSTCFLAGS += -I. -Itools/include/ -Itools/include/uapi
+KBUILD_HOSTCFLAGS += -I. -Itools/include/ -Itools/include/uapi
 HOSTCC := $(CC)
 
 ifeq ($(CONFIG_BPFILTER_UMH), y)
diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index 1303af10e54d..494ef04c56cc 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -164,11 +164,11 @@ always += xdpsock_kern.o
 always += xdp_fwd_kern.o
 always += task_fd_query_kern.o
 
-HOSTCFLAGS += -I$(objtree)/usr/include
-HOSTCFLAGS += -I$(srctree)/tools/lib/
-HOSTCFLAGS += -I$(srctree)/tools/testing/selftests/bpf/
-HOSTCFLAGS += -I$(srctree)/tools/lib/ -I$(srctree)/tools/include
-HOSTCFLAGS += -I$(srctree)/tools/perf
+KBUILD_HOSTCFLAGS += -I$(objtree)/usr/include
+KBUILD_HOSTCFLAGS += -I$(srctree)/tools/lib/
+KBUILD_HOSTCFLAGS += -I$(srctree)/tools/testing/selftests/bpf/
+KBUILD_HOSTCFLAGS += -I$(srctree)/tools/lib/ -I$(srctree)/tools/include
+KBUILD_HOSTCFLAGS += -I$(srctree)/tools/perf
 
 HOSTCFLAGS_bpf_load.o += -I$(objtree)/usr/include -Wno-unused-variable
 HOSTCFLAGS_trace_helpers.o += -I$(srctree)/tools/lib/bpf/
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index c8156d61678c..827344dfb185 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -126,7 +126,7 @@ cc-option = $(call __cc-option, $(CC),\
 # hostcc-option
 # Usage: cflags-y += $(call hostcc-option,-march=winchip-c6,-march=i586)
 hostcc-option = $(call __cc-option, $(HOSTCC),\
-	$(HOSTCFLAGS) $(HOST_EXTRACFLAGS),$(1),$(2))
+	$(KBUILD_HOSTCFLAGS) $(HOST_EXTRACFLAGS),$(1),$(2))
 
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index aa971cc3f339..09f00dae21fe 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -62,7 +62,7 @@ host-cxxshobjs	:= $(addprefix $(obj)/,$(host-cxxshobjs))
 #####
 # Handle options to gcc. Support building with separate output directory
 
-_hostc_flags   = $(HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
+_hostc_flags   = $(KBUILD_HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
                  $(HOSTCFLAGS_$(basetarget).o)
 _hostcxx_flags = $(HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(basetarget).o)
diff --git a/tools/build/Build.include b/tools/build/Build.include
index b5c679cd441c..a75fa0b6ffc0 100644
--- a/tools/build/Build.include
+++ b/tools/build/Build.include
@@ -98,4 +98,4 @@ cxx_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=\#s" $(CXX
 ###
 ## HOSTCC C flags
 
-host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(HOSTCFLAGS) -D"BUILD_STR(s)=\#s" $(HOSTCFLAGS_$(basetarget).o) $(HOSTCFLAGS_$(obj))
+host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(KBUILD_HOSTCFLAGS) -D"BUILD_STR(s)=\#s" $(HOSTCFLAGS_$(basetarget).o) $(HOSTCFLAGS_$(obj))
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index f76d9914686a..b5d8c2964b52 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -31,7 +31,7 @@ INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
 	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
-CFLAGS   += -Werror $(WARNINGS) $(HOSTCFLAGS) -g $(INCLUDES)
+CFLAGS   += -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES)
 LDFLAGS  += -lelf $(LIBSUBCMD) $(HOSTLDFLAGS)
 
 # Allow old libelf to be used:
-- 
2.17.1

