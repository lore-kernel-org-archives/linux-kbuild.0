Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:35683 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753209AbdFMA4C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2017 20:56:02 -0400
Received: by mail-pf0-f170.google.com with SMTP id l89so58874860pfi.2
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2017 17:56:01 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/3] kbuild: Add cc-option-no-kbuild macro
Date: Mon, 12 Jun 2017 17:55:29 -0700
Message-Id: <20170613005531.77656-2-mka@chromium.org>
In-Reply-To: <20170613005531.77656-1-mka@chromium.org>
References: <20170613005531.77656-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
whether an option is supported or not. This is fine for options used to
build the kernel itself, however some components like the x86 boot code
use a different set of flags.

Add the new macro cc-option-no-kbuild which does the same as cc-option
except that it has an additional parameter with the compiler options
which are used instead of KBUILD_CFLAGS and KBUILD_CPPFLAGS.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 scripts/Kbuild.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 61f87a99bf0a..d9fdc740105f 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -128,6 +128,11 @@ cc-option-yn = $(call try-run,\
 cc-option-align = $(subst -functions=0,,\
 	$(call cc-option,-falign-functions=0,-malign-functions=0))
 
+# cc-option-no-kbuild
+# Usage: cflags-no-kbuild-y += $(call cc-option-no-kbuild,<other flags>,-march=winchip-c6,-march=i586)
+cc-option-no-kbuild = $(call try-run,\
+	$(CC) -Werror $(filter-out $(GCC_PLUGINS_CFLAGS),$(1)) $(2) -c -x c /dev/null -o "$$TMP",$(2),$(3))
+
 # cc-disable-warning
 # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
 cc-disable-warning = $(call try-run,\
-- 
2.13.1.508.gb3defc5cc-goog

