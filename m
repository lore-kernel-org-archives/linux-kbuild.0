Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:50045 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966059AbdIZRzr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Sep 2017 13:55:47 -0400
Received: by mail-pg0-f47.google.com with SMTP id m30so6319080pgn.6
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Sep 2017 10:55:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [RFC PATCH 1/2] kbuild: Add a cache for generated variables
Date: Tue, 26 Sep 2017 10:55:07 -0700
Message-Id: <20170926175508.29950-2-dianders@chromium.org>
In-Reply-To: <20170926175508.29950-1-dianders@chromium.org>
References: <20170926175508.29950-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: groeck@chromium.org, briannorris@chromium.org, Douglas Anderson <dianders@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

While timing a "no-op" build of the kernel (incrementally building the
kernel even though nothing changed) in the Chrome OS build system I
found that it was much slower than I expected.

Digging into things a bit, I found that quite a bit of the time was
spent invoking the C compiler even though we weren't actually building
anything.  Currently in the Chrome OS build system the C compiler is
called through a number of wrappers (one of which is written in
python!) and can take upwards of 100 ms to invoke even if we're not
doing anything difficult, so these invocations of the compiler were
taking a lot of time.  Worse the invocations couldn't seem to take
advantage of the multiple cores on my system.

Certainly it seems like we could make the compiler invocations in the
Chrome OS build system faster, but only to a point.  Inherently
invoking a program as big as a C compiler is a fairly heavy
operation.  Thus even if we can speed the compiler calls it made sense
to track down what was happening.

It turned out that all the compiler invocations were coming from
usages like this in the kernel's Makefile:

KBUILD_CFLAGS += $(call cc-option,-fno-delete-null-pointer-checks,)

Due to the way cc-option and similar statements work the above
contains an implicit call to the C compiler.  ...and due to the fact
that we're storing the result in KBUILD_CFLAGS, a simply expanded
variable, the call will happen every time the Makefile is parsed, even
if there are no users of KBUILD_CFLAGS.

Rather than redoing this computation every time, it makes a lot of
sense to cache the result of all of the Makefile's compiler calls just
like we do when we compile a ".c" file to a ".o" file.  Conceptually
this is quite a simple idea.  ...and since the calls to invoke the
compiler and similar tools are centrally located in the Kbuild.include
file this doesn't even need to be super invasive.

Implementing the cache in a simple-to-use and efficient way is not
quite as simple as it first sounds, though.  To get maximum speed we
really want the cache in a format that make can natively understand
and make doesn't really have an ability to load/parse files. ...but
make _can_ import other Makefiles, so the solution is to store the
cache in Makefile format.  This requires coming up with a valid/unique
Makefile variable name for each value to be cached, but that's
solvable with some cleverness.

After this change, we'll automatically create a "Makefile-cache.o"
file that will contain our cached variables.  We'll load this on each
invocation of make and will avoid recomputing anything that's already
in our cache.  The cache is stored in a format that it shouldn't need
any invalidation since anything that might change should affect the
"key" and any old cached value won't be used.  The cache will be
cleaned by virtue of the ".o" suffix by a "make clean".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/kbuild/makefiles.txt |  21 ++++++
 scripts/Kbuild.include             | 133 +++++++++++++++++++++++++++++++------
 2 files changed, 135 insertions(+), 19 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 329e740adea7..679e8483cb4f 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -581,6 +581,27 @@ more details, with real examples.
 		LDFLAGS_vmlinux += $(call ld-option, -X)
 
 
+--- 3.14 $(LD) support function cache
+
+One thing to realize about all the calls to the above support functions
+is that each use of them requires a full invocation of an external tool, like
+the C compiler, assembler, or linker.  If nothing else that invocation will
+cause a fork/exec/shared library link.  In some build environments, however, it
+could also involve traversing thorough one or more wrappers.  To put some
+numbers on it, I've measured compiler invocations of as fast as 4ms or
+as slow as 150ms.
+
+Many of the above support functions are used in places where they are
+evaluated on each invocation of Make before anything else can run.  Even on
+a simple command like "make help" we need to evaluate every single one of the
+variables.
+
+To avoid this slow overhead we can cache the result of these invocations.
+If we store this cache in a way that's easy for Make to use (like in Makefile
+format) then it will be very quick and we'll save a lot of time with each
+invocation of make.
+
+
 === 4 Host Program support
 
 Kbuild supports building executables on the host for use during the
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 9ffd3dda3889..de88120f1763 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -8,6 +8,8 @@ squote  := '
 empty   :=
 space   := $(empty) $(empty)
 space_escape := _-_SPACE_-_
+right_paren := )
+left_paren := (
 
 ###
 # Name of target with a '.' as filename prefix. foo/bar.o => foo/.bar.o
@@ -69,6 +71,53 @@ endef
 # gcc support functions
 # See documentation in Documentation/kbuild/makefiles.txt
 
+# Tools for caching Makefile variables that are "expensive" to compute.
+#
+# Here we want to help deal with variables that take a long time to compute
+# by making it easy to store these variables in a cache.
+#
+# The canonical example here is testing for compiler flags.  On a simple system
+# each call to the compiler takes 10 ms, but on a system with a compiler that's
+# called through various wrappers it can take upwards of 100 ms.  If we have
+# 100 calls to the compiler this can take 1 second (on a simple system) or 10
+# seconds (on a complicated system).
+#
+# The "cache" will be in Makefile syntax and can be directly included.
+# Any time we try to reference a variable that's not in the cache we'll
+# calculate it and store it in the cache for next time.
+
+# Include values from last time
+-include Makefile-cache.o
+
+# Usage:   $(call cached-val,variable_name,escaped_expensive_operation)
+# Example: $(call cached-val,md5_val,$$(shell md5sum /usr/bin/gcc)
+#
+# If the variable is already defined we'll just use it.  If it's not, it will
+# be calculated and stored in a persistent (disk-based) cache for the next
+# invocation of Make.  The call will evaluate to the value of the variable.
+#
+# This is a bit of voodoo, but basic explanation is that if the variable
+# was undefined then we'll evaluate the expensive operation and store it into
+# the variable.  We'll then store that value in the cache and finally output
+# the value.
+define __set-and-store
+ifeq ($(origin $(1)),undefined)
+  $$(eval $(1) := $$(2))
+  $$(shell echo '$(1) := $$($(1))' >> Makefile-cache.o)
+endif
+endef
+cached-val = $(eval $(call __set-and-store,__cached_$(1)))$(__cached_$(1))
+
+# Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
+#
+# Convert all '$', ')', '(', '\', '=', ' ', ',' to '_'
+__sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$(subst \,_,$(subst =,_,$(subst $(space),_,$(subst $(comma),_,$(1))))))))
+
+# Usage = $(call __comma,something_with_comma)
+#
+# Convert ',' to '$(comma)' which can help it getting interpreted by eval.
+__comma = $(subst $(comma),$$(comma),$(1))
+
 # cc-cross-prefix
 # Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
 # Return first prefix where a prefix$(CC) is found in PATH.
@@ -99,19 +148,34 @@ try-run = $(shell set -e;		\
 # as-option
 # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
-as-option = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
+as-option = \
+	$(call cached-val,$(call __sanitize-opt,\
+		as_opt_$(CC)_$(KBUILD_CFLAGS)_$(1)_$(2)),\
+	$$(call try-run,\
+	$(CC) $(call __comma,$(KBUILD_CFLAGS)) $(call __comma,$(1)) \
+	-c -x assembler /dev/null \
+	-o "$$$$TMP",$(call __comma,$(1)),$(call __comma,$(2))))
 
 # as-instr
 # Usage: cflags-y += $(call as-instr,instr,option1,option2)
 
-as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
+as-instr = \
+	$(call cached-val,$(call __sanitize-opt,\
+		as_instr_$(CC)_$(KBUILD_AFLAGS)_$(1)_$(2)_$(3)),\
+	$$(call try-run,\
+	printf "%b\n" "$(call __comma,$(1))" | \
+	$(CC) $(call __comma,$(KBUILD_AFLAGS)) -c -x assembler \
+	-o "$$$$TMP" -,$(call __comma,$(2)),$(call __comma,$(3))))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
-__cc-option = $(call try-run,\
-	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
+__cc-option = \
+	$(call cached-val,$(call __sanitize-opt,__cc_opt_$(1)_$(2)_$(3)_$(4)),\
+	$$(call try-run,\
+	$(call __comma,$(1)) -Werror \
+	$(call __comma,$(2)) \
+	$(call __comma,$(3)) -c -x c /dev/null \
+	-o "$$$$TMP",$(call __comma,$(strip $(3))),$(call __comma,$(strip $(4)))))
 
 # Do not attempt to build with gcc plugins during cc-option tests.
 # (And this uses delayed resolution so the flags will be up to date.)
@@ -130,24 +194,42 @@ hostcc-option = $(call __cc-option, $(HOSTCC),\
 
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
-cc-option-yn = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
+cc-option-yn = \
+	$(call cached-val,$(call __sanitize-opt,\
+		cc_opt_yn_$(CC)_$(KBUILD_CPPFLAGS)_$(CC_OPTION_CFLAGS)$(1)),\
+	$$(call try-run,\
+	$(CC) -Werror $(call __comma,$(KBUILD_CPPFLAGS)) \
+	$(call __comma,$(CC_OPTION_CFLAGS)) \
+	$(call __comma,$(1)) \
+	-c -x c /dev/null -o "$$$$TMP",y,n))
 
 # cc-disable-warning
 # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
-cc-disable-warning = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
+cc-disable-warning = \
+	$(call cached-val,$(call __sanitize-opt,\
+		cc_dis_wn_$(CC)_$(KBUILD_CPPFLAGS)_$(CC_OPTION_CFLAGS)$(1)_$(2)),\
+	$$(call try-run,\
+	$(CC) -Werror $(call __comma,$(KBUILD_CPPFLAGS)) \
+	$(call __comma,$(CC_OPTION_CFLAGS)) \
+	-W$(strip $(call __comma,$(1))) -c -x c /dev/null \
+	-o "$$$$TMP",-Wno-$(strip $(call __comma,$(1)))))
 
 # cc-name
 # Expands to either gcc or clang
-cc-name = $(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
+cc-name = \
+	$(call cached-val,$(call __sanitize-opt,cc_name_$(CC)),\
+	$$(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc))
 
 # cc-version
-cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
+cc-version = \
+	$(call cached-val,$(call __sanitize-opt,cc_version_$(CC)),\
+	$$(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC)))
 
 # cc-fullversion
-cc-fullversion = $(shell $(CONFIG_SHELL) \
-	$(srctree)/scripts/gcc-version.sh -p $(CC))
+cc-fullversion = \
+	$(call cached-val,$(call __sanitize-opt,cc_full_version_$(CC)),\
+	$$(shell $(CONFIG_SHELL) \
+	$(srctree)/scripts/gcc-version.sh -p $(CC)))
 
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
@@ -159,18 +241,31 @@ cc-if-fullversion = $(shell [ $(cc-fullversion) $(1) $(2) ] && echo $(3) || echo
 
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-cc-ldoption = $(call try-run,\
-	$(CC) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
+cc-ldoption = \
+	$(call cached-val,$(call __sanitize-opt,\
+		cc_ld_opt_$(CC)_$(1)_$(2)),\
+	$$(call try-run,\
+	$(CC) $(call __comma,$(1)) -nostdlib -x c /dev/null \
+	-o "$$$$TMP",$(call __comma,$(1)),$(call __comma,$(2))))
 
 # ld-option
 # Usage: LDFLAGS += $(call ld-option, -X)
-ld-option = $(call try-run,\
-	$(CC) -x c /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
+ld-option = \
+	$(call cached-val,$(call __sanitize-opt,\
+		ld_opt_$(CC)_$(LD)_$(1)_$(2)),\
+	$$(call try-run,\
+	$(CC) -x c /dev/null -c -o "$$$$TMPO" ; \
+	$(LD) $(call __comma,$(1)) "$$$$TMPO" \
+	-o "$$$$TMP",$(call __comma,$(1)),$(call __comma,$(2))))
 
 # ar-option
 # Usage: KBUILD_ARFLAGS := $(call ar-option,D)
 # Important: no spaces around options
-ar-option = $(call try-run, $(AR) rc$(1) "$$TMP",$(1),$(2))
+ar-option = \
+	$(call cached-val,$(call __sanitize-opt,\
+		ar_opt_$(AR)_$(1)_$(2)),\
+	$$(call try-run, $(AR) rc$(call __comma,$(1)) \
+	"$$$$TMP",$(call __comma,$(1)),$(call __comma,$(2))))
 
 # ld-version
 # Note this is mainly for HJ Lu's 3 number binutil versions
-- 
2.14.1.821.g8fa685d3b7-goog

