Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:34521 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752780AbdGUV52 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jul 2017 17:57:28 -0400
Received: by mail-pg0-f45.google.com with SMTP id 123so33605412pgj.1
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jul 2017 14:57:28 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/2] kbuild: Add macros cc-option-3 and __cc-option-3
Date: Fri, 21 Jul 2017 14:56:56 -0700
Message-Id: <20170721215657.81631-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Matthias Kaehlcke <mka@chromium.org>

The macro cc-option receives two parameters (the second may be empty). It
returns the first parameter if it is a valid compiler option, otherwise
the second one. It is not evaluated if the second parameter is a valid
compiler option. This seems to be fine in virtually all cases, however
there are scenarios where the second paramater needs to be evaluated too,
and an empty value (or a third option) should be returned if it is not
valid.

The macro cc-option-3 receives three parameters and returns parameter 1
or 2 (in this order) if one of them is found to be a valid compiler
option, and otherwise paramater 3. The macro __cc-option-3 works
analogously.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 scripts/Kbuild.include | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index dd8e2dde0b34..dc83635f2317 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -113,6 +113,11 @@ as-instr = $(call try-run,\
 __cc-option = $(call try-run,\
 	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
 
+# __cc-option-3
+# Usage: MY_CFLAGS += $(call __cc-option-3,$(CC),$(MY_CFLAGS),\
+#	-mpreferred-stack-boundary=2,-mstack-alignment=4,)
+__cc-option-3 = $(call __cc-option,$(1),$(2),$(3),$(call __cc-option,$(1),$(2),$(4),$(5)))
+
 # Do not attempt to build with gcc plugins during cc-option tests.
 # (And this uses delayed resolution so the flags will be up to date.)
 CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
@@ -123,6 +128,10 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 cc-option = $(call __cc-option, $(CC),\
 	$(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
 
+# cc-option-3
+# Usage: cflags-y += $(call cc-option-3,-mpreferred-stack-boundary=3,-mstack-alignment=8,)
+cc-option-3 = $(call cc-option,$(1),$(call cc-option,$(2),$(3)))
+
 # hostcc-option
 # Usage: cflags-y += $(call hostcc-option,-march=winchip-c6,-march=i586)
 hostcc-option = $(call __cc-option, $(HOSTCC),\
-- 
2.14.0.rc0.284.gd933b75aa4-goog

