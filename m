Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38239 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388413AbfGXXud (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jul 2019 19:50:33 -0400
Received: by mail-pg1-f194.google.com with SMTP id f5so13173787pgu.5
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2019 16:50:33 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] kbuild: Check for unknown options with cc-option and clang in Kbuild
Date: Wed, 24 Jul 2019 16:50:30 -0700
Message-Id: <20190724235030.131144-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, Peter Smith <peter.smith@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Douglas Anderson <dianders@chromium.org>

If the particular version of clang a user has doesn't enable
-Werror=unknown-warning-option by default, even though it is the
default[1], then make sure to pass the option to the Kconfig cc-option
command so that testing options from Kconfig files works properly.
Otherwise, depending on the default values setup in the clang toolchain
we will silently assume options such as -Wmaybe-uninitialized are
supported by clang, when they really aren't.

This issue only started happening for me once commit 589834b3a009
("kbuild: Add -Werror=unknown-warning-option to CLANG_FLAGS") was
applied on top of commit b303c6df80c9 ("kbuild: compute false-positive
-Wmaybe-uninitialized cases in Kconfig"). This leads kbuild to try and
test for the existence of the -Wmaybe-uninitialized flag with the
cc-option command in scripts/Kconfig.include, and it doesn't see an
error returned from the option test so it sets the config value to Y.
Then the makefile tries to pass the unknown option on the command line
and -Werror=unknown-warning-option catches the invalid option and breaks
the build.

Note: this doesn't change the cc-option tests in Makefiles, because
those use a different rule that includes KBUILD_CFLAGS by default, and
the KBUILD_CFLAGS already has -Werror=unknown-warning-option. Thanks to
Doug for pointing out the different rule.

[1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
Cc: Peter Smith <peter.smith@linaro.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Change-Id: I3bb69d45bb062d1306acbf19bc0adfb60f706442
---
 Makefile                | 5 +++++
 scripts/Kconfig.include | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9be5834073f8..28177674178a 100644
--- a/Makefile
+++ b/Makefile
@@ -517,6 +517,8 @@ ifdef building_out_of_srctree
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
 endif
 
+KCONFIG_CC_OPTION_FLAGS := -Werror
+
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
@@ -531,11 +533,14 @@ ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS	+= -no-integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
+KCONFIG_CC_OPTION_FLAGS += -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
+export KCONFIG_CC_OPTION_FLAGS
+
 # The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
 # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 8a5c4d645eb1..144e83e7cb81 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -25,7 +25,7 @@ failure = $(if-success,$(1),n,y)
 
 # $(cc-option,<flag>)
 # Return y if the compiler supports <flag>, n otherwise
-cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
+cc-option = $(success,$(CC) $(KCONFIG_CC_OPTION_FLAGS) $(1) -E -x c /dev/null -o /dev/null)
 
 # $(ld-option,<flag>)
 # Return y if the linker supports <flag>, n otherwise
-- 
Sent by a computer through tubes
