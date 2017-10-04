Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:51822 "EHLO
        mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbdJDWiS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 18:38:18 -0400
Received: by mail-pf0-f181.google.com with SMTP id n14so5087447pfh.8
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Oct 2017 15:38:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 1/2] kbuild: Add a cache for generated variables
Date: Wed,  4 Oct 2017 15:37:16 -0700
Message-Id: <20171004223717.3010-2-dianders@chromium.org>
In-Reply-To: <20171004223717.3010-1-dianders@chromium.org>
References: <20171004223717.3010-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: groeck@chromium.org, sjg@chromium.org, briannorris@chromium.org, Douglas Anderson <dianders@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

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

After this change, we'll automatically create a ".cache.mk" file that
will contain our cached variables.  We'll load this on each invocation
of make and will avoid recomputing anything that's already in our
cache.  The cache is stored in a format that it shouldn't need any
invalidation since anything that might change should affect the "key"
and any old cached value won't be used.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Abstract at a different level (like shell-cached) per Masahiro Yamada
- Include ld-version, which I missed the first time

 Documentation/kbuild/makefiles.txt | 21 +++++++++
 scripts/Kbuild.include             | 90 ++++++++++++++++++++++++++++++++------
 2 files changed, 97 insertions(+), 14 deletions(-)

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
index 9ffd3dda3889..c539c709a00c 100644
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
@@ -69,6 +71,56 @@ endef
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
+make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if $(obj),$(obj)/)).cache.mk
+-include $(make-cache)
+
+# Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
+#
+# Convert all '$', ')', '(', '\', '=', ' ', ',', ':' to '_'
+__sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$(subst \,_,$(subst =,_,$(subst $(space),_,$(subst $(comma),_,$(subst :,_,$(1)))))))))
+
+# Usage:   $(call shell-cached,shell_command)
+# Example: $(call shell-cached,md5sum /usr/bin/gcc)
+#
+# If we've already seen a call to this exact shell command (even in a
+# previous invocation of make!) we'll return the value.  If not, we'll
+# compute it and store the result for future runs.
+#
+# This is a bit of voodoo, but basic explanation is that if the variable
+# was undefined then we'll evaluate the shell command and store the result
+# into the variable.  We'll then store that value in the cache and finally
+# output the value.
+#
+# NOTE: The $$(2) here isn't actually a parameter to __run-and-store.  We
+# happen to know that the caller will have their shell command in $(2) so the
+# result of "call"ing this will produce a reference to that $(2).  The reason
+# for this strangeness is to avoid an extra level of eval (and escaping) of
+# $(2).
+define __run-and-store
+ifeq ($(origin $(1)),undefined)
+  $$(eval $(1) := $$(shell $$(2)))
+  $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
+endif
+endef
+__shell-cached = $(eval $(call __run-and-store,$(1)))$($(1))
+shell-cached = $(call __shell-cached,__cached_$(call __sanitize-opt,$(1)),$(1))
+
 # cc-cross-prefix
 # Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
 # Return first prefix where a prefix$(CC) is found in PATH.
@@ -87,30 +139,40 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
 # Exit code chooses option. "$$TMP" serves as a temporary file and is
 # automatically cleaned up.
-try-run = $(shell set -e;		\
+__try-run = set -e;			\
 	TMP="$(TMPOUT).$$$$.tmp";	\
 	TMPO="$(TMPOUT).$$$$.o";	\
 	if ($(1)) >/dev/null 2>&1;	\
 	then echo "$(2)";		\
 	else echo "$(3)";		\
 	fi;				\
-	rm -f "$$TMP" "$$TMPO")
+	rm -f "$$TMP" "$$TMPO"
+
+# try-run
+# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
+# Exit code chooses option. "$$TMP" serves as a temporary file and is
+# automatically cleaned up.
+try-run = $(shell $(__try-run))
+
+# try-run-cached
+# This works like try-run, but the result is cached.
+try-run-cached = $(call shell-cached,$(__try-run))
 
 # as-option
 # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
-as-option = $(call try-run,\
+as-option = $(call try-run-cached,\
 	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
 
 # as-instr
 # Usage: cflags-y += $(call as-instr,instr,option1,option2)
 
-as-instr = $(call try-run,\
+as-instr = $(call try-run-cached,\
 	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
-__cc-option = $(call try-run,\
+__cc-option = $(call try-run-cached,\
 	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
 
 # Do not attempt to build with gcc plugins during cc-option tests.
@@ -130,23 +192,23 @@ hostcc-option = $(call __cc-option, $(HOSTCC),\
 
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
-cc-option-yn = $(call try-run,\
+cc-option-yn = $(call try-run-cached,\
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
 
 # cc-disable-warning
 # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
-cc-disable-warning = $(call try-run,\
+cc-disable-warning = $(call try-run-cached,\
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
 
 # cc-name
 # Expands to either gcc or clang
-cc-name = $(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
+cc-name = $(call shell-cached,$(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
 
 # cc-version
-cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
+cc-version = $(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
 
 # cc-fullversion
-cc-fullversion = $(shell $(CONFIG_SHELL) \
+cc-fullversion = $(call shell-cached,$(CONFIG_SHELL) \
 	$(srctree)/scripts/gcc-version.sh -p $(CC))
 
 # cc-ifversion
@@ -159,22 +221,22 @@ cc-if-fullversion = $(shell [ $(cc-fullversion) $(1) $(2) ] && echo $(3) || echo
 
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-cc-ldoption = $(call try-run,\
+cc-ldoption = $(call try-run-cached,\
 	$(CC) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
 
 # ld-option
 # Usage: LDFLAGS += $(call ld-option, -X)
-ld-option = $(call try-run,\
+ld-option = $(call try-run-cached,\
 	$(CC) -x c /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
 
 # ar-option
 # Usage: KBUILD_ARFLAGS := $(call ar-option,D)
 # Important: no spaces around options
-ar-option = $(call try-run, $(AR) rc$(1) "$$TMP",$(1),$(2))
+ar-option = $(call try-run-cached, $(AR) rc$(1) "$$TMP",$(1),$(2))
 
 # ld-version
 # Note this is mainly for HJ Lu's 3 number binutil versions
-ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
+ld-version = $(call shell-cached,$(LD) --version | $(srctree)/scripts/ld-version.sh)
 
 # ld-ifversion
 # Usage:  $(call ld-ifversion, -ge, 22252, y)
-- 
2.14.2.920.gcf0c67979c-goog

