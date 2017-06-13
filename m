Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:35090 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753217AbdFMXJ6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 19:09:58 -0400
Received: by mail-pg0-f47.google.com with SMTP id k71so66715487pgd.2
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Jun 2017 16:09:57 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 1/4] kbuild: Add cc-option-raw macro
Date: Tue, 13 Jun 2017 16:08:51 -0700
Message-Id: <20170613230854.112282-2-mka@chromium.org>
In-Reply-To: <20170613230854.112282-1-mka@chromium.org>
References: <20170613230854.112282-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
whether an option is supported or not. This is fine for options used to
build the kernel itself, however some components like the x86 boot code
use a different set of flags.

Add the new macro cc-option-raw which serves the same purpose as
cc-option but has additional parameters. One parameter is the compiler
with which the check should be performed, the other the compiler options
to be used instead KBUILD_C*FLAGS. The compiler parameter allows other
macros like hostcc-option to be implemented on top of cc-option-raw.

Also rework cc-option to make use of cc-option-raw.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- Changed macro name from Add cc-option-no-kbuild to cc-option-raw
- Added compiler as parameter to the macro
- Reworked cc-option to make use of cc-option-raw
- Updated commit message

 scripts/Kbuild.include | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 61f87a99bf0a..6dd0d1a921d6 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -108,6 +108,11 @@ as-option = $(call try-run,\
 as-instr = $(call try-run,\
 	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
 
+# cc-option-raw
+# Usage: MY_CFLAGS += $(call cc-option-raw,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
+cc-option-raw = $(call try-run,\
+	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
+
 # Do not attempt to build with gcc plugins during cc-option tests.
 # (And this uses delayed resolution so the flags will be up to date.)
 CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
@@ -115,8 +120,8 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 # cc-option
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
 
-cc-option = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+cc-option = $(call cc-option-raw, $(CC), $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),\
+	$(1), $(2))
 
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
-- 
2.13.1.518.g3df882009-goog

