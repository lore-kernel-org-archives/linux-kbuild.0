Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f44.google.com ([74.125.83.44]:36300 "EHLO
        mail-pg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753813AbdFMXJ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 19:09:59 -0400
Received: by mail-pg0-f44.google.com with SMTP id a70so66701974pge.3
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Jun 2017 16:09:59 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 2/4] kbuild: Add hostcc-option macro
Date: Tue, 13 Jun 2017 16:08:52 -0700
Message-Id: <20170613230854.112282-3-mka@chromium.org>
In-Reply-To: <20170613230854.112282-1-mka@chromium.org>
References: <20170613230854.112282-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

hostcc-option is equivalent to cc-option, but uses the host compiler
and HOSTCFLAGS. Change HOSTCFLAGS to a simple expanded variable to
allow for HOSTCFLAGS += $(call hostcc-option, ...).

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- Patch added in v2

 Makefile               | 2 +-
 scripts/Kbuild.include | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 83f6d9972cab..b234bba6d652 100644
--- a/Makefile
+++ b/Makefile
@@ -303,7 +303,7 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 
 HOSTCC       = gcc
 HOSTCXX      = g++
-HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
+HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
 HOSTCXXFLAGS = -O2
 
 ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 6dd0d1a921d6..4965ed92fc1e 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -123,6 +123,10 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 cc-option = $(call cc-option-raw, $(CC), $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),\
 	$(1), $(2))
 
+# hostcc-option
+# Usage: HOSTCFLAGS += $(call hostcc-option, -fno-delete-null-pointer-checks,)
+hostcc-option = $(call cc-option-raw, $(HOSTCC), $(HOSTCFLAGS), $(1), $(2))
+
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
 cc-option-yn = $(call try-run,\
-- 
2.13.1.518.g3df882009-goog

