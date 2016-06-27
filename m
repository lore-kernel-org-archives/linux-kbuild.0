Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33120 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752063AbcF0S3j (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jun 2016 14:29:39 -0400
From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 2/2] kbuild: add shell cache
Date: Mon, 27 Jun 2016 20:28:27 +0200
Message-Id: <1467052107-26735-2-git-send-email-rabin@rab.in>
In-Reply-To: <1467052107-26735-1-git-send-email-rabin@rab.in>
References: <1467052107-26735-1-git-send-email-rabin@rab.in>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>

Running make results in over 40 invocations of the compiler just during
processing of the Makefile, before any actual rules are run.

To reduce this overhead, cache the results of $(shell) calls to the
compiler.

On my machine, this reduces make's processing time by over 96%:

$ make kernelversion && perf stat -r5 make kernelversion
Before: 0,252219929 seconds time elapsed ( +-  0,39% )
 After: 0,008607464 seconds time elapsed ( +-  0,50% )

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 Makefile               | 15 ++++++++-------
 scripts/Kbuild.include | 42 +++++++++++++++++++++++++++++++++++-------
 2 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 91baa282f3fa..90237e706bf8 100644
--- a/Makefile
+++ b/Makefile
@@ -304,11 +304,6 @@ HOSTCXX      = g++
 HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
 HOSTCXXFLAGS = -O2
 
-ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
-HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
-		-Wno-missing-field-initializers -fno-delete-null-pointer-checks
-endif
-
 # Decide whether to build built-in, modular, or both.
 # Normally, just do built-in.
 
@@ -343,6 +338,11 @@ export KBUILD_CHECKSRC KBUILD_SRC KBUILD_EXTMOD
 scripts/Kbuild.include: ;
 include scripts/Kbuild.include
 
+ifeq ($(call cached-shell,$(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
+HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
+		-Wno-missing-field-initializers -fno-delete-null-pointer-checks
+endif
+
 # Make variables (CC, etc...)
 AS		= $(CROSS_COMPILE)as
 LD		= $(CROSS_COMPILE)ld
@@ -767,7 +767,7 @@ KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
 endif
 
 # arch Makefile may override CC so keep this after arch Makefile is included
-NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
+NOSTDINC_FLAGS += -nostdinc -isystem $(call cached-shell,$(CC) -print-file-name=include)
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
 
 # warn about C99 declaration after statement
@@ -798,7 +798,7 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
 KBUILD_ARFLAGS := $(call ar-option,D)
 
 # check for 'asm goto'
-ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC)), y)
+ifeq ($(call cached-shell,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC)), y)
 	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
 	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
 endif
@@ -1237,6 +1237,7 @@ endif # CONFIG_MODULES
 
 # Directories & files removed with 'make clean'
 CLEAN_DIRS  += $(MODVERDIR)
+CLEAN_FILES += $(KBUILD_SHELLCACHE)
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_DIRS  += include/config usr/include include/generated          \
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 0f82314621f2..e90e43fa3c81 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -7,6 +7,7 @@ quote   := "
 squote  := '
 empty   :=
 space   := $(empty) $(empty)
+tab     := $(empty)	$(empty)
 space_escape := _-_SPACE_-_
 
 ###
@@ -83,11 +84,35 @@ cc-cross-prefix =  \
 # output directory for tests below
 TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
 
+KBUILD_SHELLCACHE := .shellcache
+
+ifeq ($(KBUILD_SHELLCACHE),)
+cached-shell = $(shell $(1))
+else
+-include $(KBUILD_SHELLCACHE)
+
+sanitize = $(subst $(space),_,	\
+	      $(subst $(tab),_,	\
+	      $(subst \n,_,	\
+	      $(subst :,_,	\
+	      $(subst \#,_,	\
+	      $(subst =,_,	\
+	      $(subst $$,_,	\
+	      $(subst ',_,	\
+	      $(subst ",_,	\
+	      $(1))))))))))
+
+cached-shell = $(if $(cmd$(call sanitize,$(1))),$(subst CACHED,,$(cmd$(call sanitize,$(1)))),$(shell \
+	res='$(shell $(1))';					\
+	echo "$$res";						\
+	echo 'cmd$(call sanitize,$(1)) = CACHED'"$$res" >> $(KBUILD_SHELLCACHE)))
+endif
+
 # try-run
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
 # Exit code chooses option. "$$TMP" is can be used as temporary file and
 # is automatically cleaned up.
-try-run = $(shell set -e;		\
+try-run = $(call cached-shell,set -e;	\
 	TMP="$(TMPOUT).$$$$.tmp";	\
 	TMPO="$(TMPOUT).$$$$.o";	\
 	if ($(1)) >/dev/null 2>&1;	\
@@ -131,18 +156,19 @@ cc-disable-warning = $(call try-run,\
 
 # cc-name
 # Expands to either gcc or clang
-cc-name = $(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
+cc-name = $(call cached-shell,$(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
 
 # cc-version
-cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
+cc-version = $(call cached-shell,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
 
 # cc-fullversion
-cc-fullversion = $(shell $(CONFIG_SHELL) \
+cc-fullversion = $(call cached-shell $(CONFIG_SHELL) \
 	$(srctree)/scripts/gcc-version.sh -p $(CC))
 
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-cc-ifversion = $(shell [ $(cc-version) $(1) $(2) ] && echo $(3) || echo $(4))
+cc-ifversion = $(call cached-shell, \
+       [ $(cc-version) $(1) $(2) ] && echo $(3) || echo $(4))
 
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
@@ -161,11 +187,13 @@ ar-option = $(call try-run, $(AR) rc$(1) "$$TMP",$(1),$(2))
 
 # ld-version
 # Note this is mainly for HJ Lu's 3 number binutil versions
-ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
+ld-version = $(call cached-shell, \
+       $(LD) --version | $(srctree)/scripts/ld-version.sh)
 
 # ld-ifversion
 # Usage:  $(call ld-ifversion, -ge, 22252, y)
-ld-ifversion = $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
+ld-ifversion = $(call cached-shell, \
+       [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
 
 ######
 
-- 
2.8.1

