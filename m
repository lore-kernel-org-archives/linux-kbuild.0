Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733210AbfC0SEQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Mar 2019 14:04:16 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.0 075/262] kbuild: make -r/-R effective in top Makefile for old Make versions
Date: Wed, 27 Mar 2019 13:58:50 -0400
Message-Id: <20190327180158.10245-75-sashal@kernel.org>
In-Reply-To: <20190327180158.10245-1-sashal@kernel.org>
References: <20190327180158.10245-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit 3812b8c5c5d527239ac015f1f2c7654da7fcfbba ]

Adding -rR to MAKEFLAGS is important because we do not want to
be bothered by built-in implicit rules or variables.

One problem that used to exist in older GNU Make versions is

  MAKEFLAGS += -rR

... does not become effective in the current Makefile. When you are
building with O= option, it becomes effective in the top Makefile
since it recurses via 'sub-make' target. Otherwise, the top Makefile
tries implicit rules. That is why we explicitly add empty rules for
Makefiles, but we often miss to do that.

In fact, adding -d option to older GNU Make versions shows it is
trying a bunch of implicit pattern rules.

 Considering target file `scripts/Makefile.kcov'.
  Looking for an implicit rule for `scripts/Makefile.kcov'.
  Trying pattern rule with stem `Makefile.kcov'.
  Trying implicit prerequisite `scripts/Makefile.kcov.o'.
  Trying pattern rule with stem `Makefile.kcov'.
  Trying implicit prerequisite `scripts/Makefile.kcov.c'.
  Trying pattern rule with stem `Makefile.kcov'.
  Trying implicit prerequisite `scripts/Makefile.kcov.cc'.
  Trying pattern rule with stem `Makefile.kcov'.
  Trying implicit prerequisite `scripts/Makefile.kcov.C'.
  ...

This issue was fixed by GNU Make commit 58dae243526b ("[Savannah #20501]
Handle adding -r/-R to MAKEFLAGS in the makefile"). So, it is no longer
a problem if you use GNU Make 4.0 or later. However, older versions are
still widely used.

So, I decided to patch the kernel Makefile to invoke sub-make regardless
of O= option. This will allow further cleanups.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 48 ++++++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index 89af52ca0ba5..efec82635ac5 100644
--- a/Makefile
+++ b/Makefile
@@ -15,19 +15,6 @@ NAME = Shy Crocodile
 PHONY := _all
 _all:
 
-# Do not use make's built-in rules and variables
-# (this increases performance and avoids hard-to-debug behaviour)
-MAKEFLAGS += -rR
-
-# Avoid funny character set dependencies
-unexport LC_ALL
-LC_COLLATE=C
-LC_NUMERIC=C
-export LC_COLLATE LC_NUMERIC
-
-# Avoid interference with shell env settings
-unexport GREP_OPTIONS
-
 # We are using a recursive build, so we need to do a little thinking
 # to get the ordering right.
 #
@@ -44,6 +31,21 @@ unexport GREP_OPTIONS
 # descending is started. They are now explicitly listed as the
 # prepare rule.
 
+ifneq ($(sub-make-done),1)
+
+# Do not use make's built-in rules and variables
+# (this increases performance and avoids hard-to-debug behaviour)
+MAKEFLAGS += -rR
+
+# Avoid funny character set dependencies
+unexport LC_ALL
+LC_COLLATE=C
+LC_NUMERIC=C
+export LC_COLLATE LC_NUMERIC
+
+# Avoid interference with shell env settings
+unexport GREP_OPTIONS
+
 # Beautify output
 # ---------------------------------------------------------------------------
 #
@@ -112,7 +114,6 @@ export quiet Q KBUILD_VERBOSE
 
 # KBUILD_SRC is not intended to be used by the regular user (for now),
 # it is set on invocation of make with KBUILD_OUTPUT or O= specified.
-ifeq ($(KBUILD_SRC),)
 
 # OK, Make called in directory where kernel src resides
 # Do we want to locate output files in a separate directory?
@@ -142,6 +143,13 @@ $(if $(KBUILD_OUTPUT),, \
 # 'sub-make' below.
 MAKEFLAGS += --include-dir=$(CURDIR)
 
+else
+
+# Do not print "Entering directory ..." at all for in-tree build.
+MAKEFLAGS += --no-print-directory
+
+endif # ifneq ($(KBUILD_OUTPUT),)
+
 PHONY += $(MAKECMDGOALS) sub-make
 
 $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
@@ -149,16 +157,12 @@ $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
 
 # Invoke a second make in the output directory, passing relevant variables
 sub-make:
-	$(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR) \
+	$(Q)$(MAKE) sub-make-done=1 \
+	$(if $(KBUILD_OUTPUT),-C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR)) \
 	-f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))
 
-# Leave processing to above invocation of make
-skip-makefile := 1
-endif # ifneq ($(KBUILD_OUTPUT),)
-endif # ifeq ($(KBUILD_SRC),)
-
+else # sub-make-done
 # We process the rest of the Makefile if this is the final invocation of make
-ifeq ($(skip-makefile),)
 
 # Do not print "Entering directory ...",
 # but we want to display it when entering to the output directory
@@ -1757,7 +1761,7 @@ $(cmd_files): ;	# Do not try to update included dependency files
 
 endif   # ifeq ($(config-targets),1)
 endif   # ifeq ($(mixed-targets),1)
-endif	# skip-makefile
+endif   # sub-make-done
 
 PHONY += FORCE
 FORCE:
-- 
2.19.1
