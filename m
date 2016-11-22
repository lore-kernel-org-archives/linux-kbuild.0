Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:54283 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755513AbcKVIac (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Nov 2016 03:30:32 -0500
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH] make use of make variable CURDIR instead of calling pwd
Date: Tue, 22 Nov 2016 09:30:26 +0100
Message-Id: <20161122083026.6345-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: kernel@pengutronix.de, linux-kbuild@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

make already provides the current working directory in a variable, so make
use of it instead of forking a shell. Also replace usage of PWD by
CURDIR. PWD is provided by most shells, but not all, so this makes the
build system more robust.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

BTW, the comment "set up PWD so that older versions of make will work
with our build." in tools/power/cpupower/Makefile is wrong. PWD is a
variable provided by most modern shells, so it has nothing to do with
old make.

I don't know where to send this patch, so I picked the kbuild entry from
MAINTAINERS as best match. If you think there is a better alternative or
this patch needs splitting, please tell me.

Best regards
Uwe
---
 samples/bpf/Makefile                       | 4 ++--
 samples/connector/Makefile                 | 2 +-
 tools/build/Makefile                       | 2 +-
 tools/gpio/Makefile                        | 2 +-
 tools/lib/api/Makefile                     | 2 +-
 tools/lib/bpf/Makefile                     | 2 +-
 tools/lib/lockdep/Makefile                 | 2 +-
 tools/lib/subcmd/Makefile                  | 2 +-
 tools/lib/traceevent/Makefile              | 2 +-
 tools/objtool/Makefile                     | 4 ++--
 tools/perf/Makefile.perf                   | 2 +-
 tools/perf/tests/make                      | 2 +-
 tools/power/cpupower/Makefile              | 3 ---
 tools/power/cpupower/debug/kernel/Makefile | 3 +--
 14 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index 12b7304d55dc..b1e322860a7f 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -119,10 +119,10 @@ CLANG ?= clang
 
 # Trick to allow make to be run from this directory
 all:
-	$(MAKE) -C ../../ $$PWD/
+	$(MAKE) -C ../../ $(CURDIR)/
 
 clean:
-	$(MAKE) -C ../../ M=$$PWD clean
+	$(MAKE) -C ../../ M=$(CURDIR) clean
 	@rm -f *~
 
 # Verify LLVM compiler tools are available and bpf target is supported by llc
diff --git a/samples/connector/Makefile b/samples/connector/Makefile
index 04b9622b6f51..91762d946a53 100644
--- a/samples/connector/Makefile
+++ b/samples/connector/Makefile
@@ -13,4 +13,4 @@ HOSTCFLAGS_ucon.o += -I$(objtree)/usr/include
 all: modules
 
 modules clean:
-	$(MAKE) -C ../.. SUBDIRS=$(PWD) $@
+	$(MAKE) -C ../.. SUBDIRS=$(CURDIR) $@
diff --git a/tools/build/Makefile b/tools/build/Makefile
index 8332959fbca4..aaf7ed329a45 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -1,5 +1,5 @@
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 250a891e6ef0..b4401536cfa9 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -3,7 +3,7 @@ include ../scripts/Makefile.include
 bindir ?= /usr/bin
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index 0a6fda9837f7..adba83b325d5 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -2,7 +2,7 @@ include ../../scripts/Makefile.include
 include ../../scripts/utilities.mak		# QUIET_CLEAN
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 62d89d50fcbd..e2efddf10231 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -7,7 +7,7 @@ BPF_EXTRAVERSION = 1
 MAKEFLAGS += --no-print-directory
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
diff --git a/tools/lib/lockdep/Makefile b/tools/lib/lockdep/Makefile
index 1d57af56814b..3bc0ef9f8923 100644
--- a/tools/lib/lockdep/Makefile
+++ b/tools/lib/lockdep/Makefile
@@ -50,7 +50,7 @@ ifndef VERBOSE
 endif
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
index ce4b7e527566..3f8cc44a0dbd 100644
--- a/tools/lib/subcmd/Makefile
+++ b/tools/lib/subcmd/Makefile
@@ -2,7 +2,7 @@ include ../../scripts/Makefile.include
 include ../../scripts/utilities.mak		# QUIET_CLEAN
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
diff --git a/tools/lib/traceevent/Makefile b/tools/lib/traceevent/Makefile
index 7851df1490e0..938f73cec20d 100644
--- a/tools/lib/traceevent/Makefile
+++ b/tools/lib/traceevent/Makefile
@@ -86,7 +86,7 @@ ifndef VERBOSE
 endif
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 041b493ad3ab..27e019c09bd2 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -11,12 +11,12 @@ LD = ld
 AR = ar
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
 SUBCMD_SRCDIR		= $(srctree)/tools/lib/subcmd/
-LIBSUBCMD_OUTPUT	= $(if $(OUTPUT),$(OUTPUT),$(PWD)/)
+LIBSUBCMD_OUTPUT	= $(if $(OUTPUT),$(OUTPUT),$(CURDIR)/)
 LIBSUBCMD		= $(LIBSUBCMD_OUTPUT)libsubcmd.a
 
 OBJTOOL    := $(OUTPUT)objtool
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 982d6439bb07..5bdef736a662 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -94,7 +94,7 @@ LC_NUMERIC=C
 export LC_COLLATE LC_NUMERIC
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index 143f4d549769..3482e9f67326 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -42,7 +42,7 @@ LC_NUMERIC=C
 export LC_COLLATE LC_NUMERIC
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index 8358863259c5..d6e1c02ddcfe 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -108,9 +108,6 @@ MKDIR = mkdir
 # Now we set up the build system
 #
 
-# set up PWD so that older versions of make will work with our build.
-PWD = $(shell pwd)
-
 GMO_FILES = ${shell for HLANG in ${LANGUAGES}; do echo $(OUTPUT)po/$$HLANG.gmo; done;}
 
 export CROSS CC AR STRIP RANLIB CFLAGS LDFLAGS LIB_OBJS
diff --git a/tools/power/cpupower/debug/kernel/Makefile b/tools/power/cpupower/debug/kernel/Makefile
index 96b146fe6f8d..a8a6f8eec5c2 100644
--- a/tools/power/cpupower/debug/kernel/Makefile
+++ b/tools/power/cpupower/debug/kernel/Makefile
@@ -1,7 +1,6 @@
 obj-m	:=
 
 KDIR	:= /lib/modules/$(shell uname -r)/build
-PWD		:= $(shell pwd)
 KMISC   := /lib/modules/$(shell uname -r)/cpufrequtils/
 
 ifeq ("$(CONFIG_X86_TSC)", "y")
@@ -9,7 +8,7 @@ ifeq ("$(CONFIG_X86_TSC)", "y")
 endif
 
 default:
-	$(MAKE) -C $(KDIR) M=$(PWD)
+	$(MAKE) -C $(KDIR) M=$(CURDIR)
 
 clean:
 	- rm -rf *.o *.ko .tmp-versions .*.cmd .*.mod.* *.mod.c
-- 
2.10.2

