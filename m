Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:34662 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753113AbdHOBaY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Aug 2017 21:30:24 -0400
Received: by mail-pg0-f45.google.com with SMTP id u185so57739485pgb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Aug 2017 18:30:23 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 1/2] kbuild: Also evaluate alternative option passed to cc-option, etc
Date: Mon, 14 Aug 2017 18:29:40 -0700
Message-Id: <20170815012941.75151-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Matthias Kaehlcke <mka@chromium.org>

The macro cc-option receives two parameters (the second may be empty). It
returns the first parameter if it is a valid compiler option, otherwise
the second one. It is not evaluated if the second parameter is a valid
compiler option. This seems to be fine in virtually all cases, however
there are scenarios where the second parameter needs to be evaluated
too, and an empty value (or a third option) should be returned if it is
not valid.

The new macro try-run-opt receives a 'base command' and two options as
parameters. It runs 'base command' + option 1 and returns option 1
upon success. In case of failure 'base command' + option 2 is executed,
in case of success option 2 is returned, otherwise an empty string.

Rework [__]cc-option, ld-option, and cc-ldoption to use try-run-opt
instead of try-run to make sure the alternative option is evaluated.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- add try-run-opt instead of cc-option-3
- use try-run-opt for [__]cc-option, ld-option and ccld-option
- updated subject (was 'kbuild: Add macros cc-option-3 and __cc-option-3')
  and commit message

 scripts/Kbuild.include | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index dd8e2dde0b34..48a6d0e9b073 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -85,8 +85,8 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
 
 # try-run
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
-# Exit code chooses option. "$$TMP" is can be used as temporary file and
-# is automatically cleaned up.
+# Runs the command $1, exit code chooses option. "$$TMP" is used as temporary
+# file and is automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP="$(TMPOUT).$$$$.tmp";	\
 	TMPO="$(TMPOUT).$$$$.o";	\
@@ -96,6 +96,23 @@ try-run = $(shell set -e;		\
 	fi;				\
 	rm -f "$$TMP" "$$TMPO")
 
+# try-run-opt
+# Usage: option = $(call try-run-opt, $(CC)...-o "$$TMP",option-ok,otherwise)
+# Runs the command '$1 $2' and outputs $2 if the execution was successful.
+# Otherwise runs '$1 $3' (if $3 is not empty) and outputs $3 upon success. No
+# output if both commands fail. "$$TMP" is used as temporary file and is
+# automatically cleaned up.
+try-run-opt = $(shell set -e;           \
+        TMP="$(TMPOUT).$$$$.tmp";       \
+        TMPO="$(TMPOUT).$$$$.o";        \
+        if ($(1) $(2)) >/dev/null 2>&1; \
+        then echo "$(2)";               \
+        elif [ -n "$(3)" ] && ($(1) $(3)) >/dev/null 2>&1;      \
+        then echo "$(3)";               \
+        else echo "";                   \
+        fi;                             \
+        rm -f "$$TMP" "$$TMPO")
+
 # as-option
 # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
@@ -110,8 +127,8 @@ as-instr = $(call try-run,\
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
-__cc-option = $(call try-run,\
-	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
+__cc-option = $(call try-run-opt,\
+	$(1) -Werror $(2) -c -x c /dev/null -o "$$TMP",$(3),$(4))
 
 # Do not attempt to build with gcc plugins during cc-option tests.
 # (And this uses delayed resolution so the flags will be up to date.)
@@ -159,13 +176,13 @@ cc-if-fullversion = $(shell [ $(cc-fullversion) $(1) $(2) ] && echo $(3) || echo
 
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-cc-ldoption = $(call try-run,\
-	$(CC) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
+cc-ldoption = $(call try-run-opt,\
+	$(CC) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
 
 # ld-option
 # Usage: LDFLAGS += $(call ld-option, -X)
-ld-option = $(call try-run,\
-	$(CC) -x c /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
+ld-option = $(call try-run-opt,\
+	$(CC) -x c /dev/null -c -o "$$TMPO" ; $(LD) "$$TMPO" -o "$$TMP",$(1),$(2))
 
 # ar-option
 # Usage: KBUILD_ARFLAGS := $(call ar-option,D)
-- 
2.14.0.434.g98096fd7a8-goog

