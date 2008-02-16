Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:56949 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752816AbYBPNOh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Feb 2008 08:14:37 -0500
Date: Sat, 16 Feb 2008 08:14:31 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] kbuild:  Some cheap typo and grammar fixes.
Message-ID: <alpine.LFD.1.00.0802160812400.22496@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

 Documentation/kbuild/makefiles.txt |    4 ++--
 scripts/Kbuild.include             |   14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 7a77533..3042f09 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -277,9 +277,9 @@ more details, with real examples.
 --- 3.7 Compilation flags

     ccflags-y, asflags-y and ldflags-y
-	The three flags listed above applies only to the kbuild makefile
+	The three flags listed above apply only to the kbuild makefile
 	where they are assigned. They are used for all the normal
-	cc, as and ld invocation happenign during a recursive build.
+	cc, as and ld invocation happening during a recursive build.
 	Note: Flags with the same behaviour were previously named:
 	EXTRA_CFLAGS, EXTRA_AFLAGS and EXTRA_LDFLAGS.
 	They are yet supported but their use are deprecated.
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index d64e6ba..944651e 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -79,7 +79,7 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)

 # try-run
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
-# Exit code chooses option. "$$TMP" is can be used as temporary file and
+# Exit code chooses option. "$$TMP" can be used as temporary file and
 # is automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP="$(TMPOUT).$$$$.tmp";	\
@@ -157,7 +157,7 @@ echo-cmd = $(if $($(quiet)cmd_$(1)),\
 # printing commands
 cmd = @$(echo-cmd) $(cmd_$(1))

-# Add $(obj)/ for paths that are not absolute
+# Add $(obj)/ prefix for paths that are not absolute
 objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))

 ###
@@ -169,7 +169,7 @@ objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
 # See Documentation/kbuild/makefiles.txt for more info

 ifneq ($(KBUILD_NOCMDDEP),1)
-# Check if both arguments has same arguments. Result is empty string if equal.
+# Check if argument lists are equivalent. Result is empty string if equal.
 # User may override this check using make KBUILD_NOCMDDEP=1
 arg-check = $(strip $(filter-out $(cmd_$(1)), $(cmd_$@)) \
                     $(filter-out $(cmd_$@),   $(cmd_$(1))) )
@@ -181,7 +181,7 @@ endif
 # in $(cmd_xxx) double $$ your perl vars
 make-cmd = $(subst \#,\\\#,$(subst $$,$$$$,$(call escsq,$(cmd_$(1)))))

-# Find any prerequisites that is newer than target or that does not exist.
+# Find any prerequisites that are newer than target or that do not exist.
 # PHONY targets skipped in both cases.
 any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)

@@ -208,7 +208,7 @@ if_changed_rule = $(if $(strip $(any-prereq) $(arg-check) ),                 \
 	$(rule_$(1)))

 ###
-# why - tell why a a target got build
+# why - explain why a target got built
 #       enabled by make V=2
 #       Output (listed in the order they are checked):
 #          (1) - due to target is PHONY
@@ -217,12 +217,12 @@ if_changed_rule = $(if $(strip $(any-prereq) $(arg-check) ),                 \
 #          (4) - due to command line change
 #          (5) - due to missing .cmd file
 #          (6) - due to target not in $(targets)
-# (1) PHONY targets are always build
+# (1) PHONY targets are always built
 # (2) No target, so we better build it
 # (3) Prerequisite is newer than target
 # (4) The command line stored in the file named dir/.target.cmd
 #     differed from actual command line. This happens when compiler
-#     options changes
+#     options change
 # (5) No dir/.target.cmd file (used to store command line)
 # (6) No dir/.target.cmd file and target not listed in $(targets)
 #     This is a good hint that there is a bug in the kbuild file

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
