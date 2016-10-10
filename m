Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:57031 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751917AbcJJMpO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Oct 2016 08:45:14 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] kbuild: honor '-s' option for tools/*
Date: Mon, 10 Oct 2016 14:36:37 +0200
Message-Id: <20161010123812.1425903-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Arnaldo Carvalho de Melo <acme@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jiri Olsa <jolsa@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When building with 'make -s' on x86, we always see the output for descending into
the tools/objtool directory when CONFIG_STACK_VALIDATION is set, but we should not
see any output. There are three related problems causing this:

* we override the MAKEFLAGS variable when entering tools, keeping only
  the -j and --j% options around when we should also propagate the -s
  flag (for some make versions) as well as the 's' character in the first
  word of the variable.

* The build system in tools/build/Makefile.build that is used for some
  parts of the build process of objtool implements the same
  logic as the normal kbuild, using 'quiet_$(cmd)' to indicate the
  string that should be printed, but lacks the logic to skip that
  when building with 'make -s'.

* The /other/ build system in tools/scripts/Makefile.include that is also
  used for building objtool checks for the 's' flag in the beginning of
  the first word of Makeflags, which works for GNU make 3.x, but not for
  GNU make 4.x, which has it in the end of that word.

This changes all three of the above to behave just like Kbuild does,
and print no output with 'make -s' regardless of the version of that
tool, but otherwise behaves as before. In case of
tools/scripts/Makefile.include, I decided to use an identical
conditional block to set the $(quiet) variable for consistency,
even though it is not used in the same way.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile                       |  5 +++--
 tools/build/Makefile.build     | 10 ++++++++++
 tools/scripts/Makefile.include | 12 +++++++++++-
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d5289117360b..3638bb27ba2c 100644
--- a/Makefile
+++ b/Makefile
@@ -1612,11 +1612,12 @@ image_name:
 # Clear a bunch of variables before executing the submake
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/
+	echo MAKEFLAGS=\""$(MAKEFLAGS)"\"
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(findstring s,$(firstword -$(MAKEFLAGS))) $(filter --j% -j -s,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/ $*
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(findstring s,$(firstword -$(MAKEFLAGS))) $(filter --j% -j -s,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/ $*
 
 # Single targets
 # ---------------------------------------------------------------------------
diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
index 99c0ccd2f176..e279a71c650d 100644
--- a/tools/build/Makefile.build
+++ b/tools/build/Makefile.build
@@ -19,6 +19,16 @@ else
   Q=@
 endif
 
+ifneq ($(filter 4.%,$(MAKE_VERSION)),)	# make-4
+ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
+  quiet=silent_
+endif
+else					# make-3.8x
+ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
+  quiet=silent_
+endif
+endif
+
 build-dir := $(srctree)/tools/build
 
 # Define $(fixdep) for dep-cmd function
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 8abbef164b4e..aa6c3c9261e4 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -58,7 +58,17 @@ descend = \
 QUIET_SUBDIR0  = +$(MAKE) $(COMMAND_O) -C # space to separate -C and subdir
 QUIET_SUBDIR1  =
 
-ifneq ($(findstring $(MAKEFLAGS),s),s)
+ifneq ($(filter 4.%,$(MAKE_VERSION)),) # make-4
+ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
+  quiet=silent_
+endif
+else                                   # make-3.8x
+ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
+  quiet=silent_
+endif
+endif
+
+ifneq ($(quiet),silent_)
   ifneq ($(V),1)
 	QUIET_CC       = @echo '  CC       '$@;
 	QUIET_CC_FPIC  = @echo '  CC FPIC  '$@;
-- 
2.9.0

