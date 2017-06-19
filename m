Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:21522 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbdFSHbA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jun 2017 03:31:00 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: deprecate cc-option-align
Date: Mon, 19 Jun 2017 16:28:22 +0900
Message-Id: <1497857303-15936-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Kees Cook <keescook@chromium.org>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Emese Revfy <re.emese@gmail.com>

Documentation/kbuild/makefiles.txt says the change for align options
occurred at GCC 3.0, and Documentation/process/changes.rst says the
minimal supported GCC version is 3.2, so it should be safe to hard-code
-falign* options.

Fix the only user arch/x86/Makefile_32.cpu and deprecate the
cc-option-align.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

x86 maintainers,

If this patch looks OK, could you give me Acked-by?


 Documentation/kbuild/makefiles.txt | 16 ----------------
 arch/x86/Makefile_32.cpu           |  7 +++----
 scripts/Kbuild.include             |  5 -----
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 1c49e87cea4f..247fb331c4b2 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -486,22 +486,6 @@ more details, with real examples.
 	respectively.
 	Note: cc-option-yn uses KBUILD_CFLAGS for $(CC) options
 
-    cc-option-align
-	gcc versions >= 3.0 changed the type of options used to specify
-	alignment of functions, loops etc. $(cc-option-align), when used
-	as prefix to the align options, will select the right prefix:
-	gcc < 3.00
-		cc-option-align = -malign
-	gcc >= 3.00
-		cc-option-align = -falign
-
-	Example:
-		KBUILD_CFLAGS += $(cc-option-align)-functions=4
-
-	In the above example, the option -falign-functions=4 is used for
-	gcc >= 3.00. For gcc < 3.00, -malign-functions=4 is used.
-	Note: cc-option-align uses KBUILD_CFLAGS for $(CC) options
-
     cc-disable-warning
 	cc-disable-warning checks if gcc supports a given warning and returns
 	the commandline switch to disable it. This special function is needed,
diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index a45eb15b7cf2..f3717d36718a 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -9,7 +9,6 @@ else
 tune		= $(call cc-option,-mcpu=$(1),$(2))
 endif
 
-align := $(cc-option-align)
 cflags-$(CONFIG_M486)		+= -march=i486
 cflags-$(CONFIG_M586)		+= -march=i586
 cflags-$(CONFIG_M586TSC)	+= -march=i586
@@ -24,11 +23,11 @@ cflags-$(CONFIG_MK6)		+= -march=k6
 # They make zero difference whatsosever to performance at this time.
 cflags-$(CONFIG_MK7)		+= -march=athlon
 cflags-$(CONFIG_MK8)		+= $(call cc-option,-march=k8,-march=athlon)
-cflags-$(CONFIG_MCRUSOE)	+= -march=i686 $(align)-functions=0 $(align)-jumps=0 $(align)-loops=0
-cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) $(align)-functions=0 $(align)-jumps=0 $(align)-loops=0
+cflags-$(CONFIG_MCRUSOE)	+= -march=i686 -falign-functions=0 -falign-jumps=0 -falign-loops=0
+cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) -falign-functions=0 -falign-jumps=0 -falign-loops=0
 cflags-$(CONFIG_MWINCHIPC6)	+= $(call cc-option,-march=winchip-c6,-march=i586)
 cflags-$(CONFIG_MWINCHIP3D)	+= $(call cc-option,-march=winchip2,-march=i586)
-cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)-functions=0 $(align)-jumps=0 $(align)-loops=0
+cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) -falign-functions=0 -falign-jumps=0 -falign-loops=0
 cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
 cflags-$(CONFIG_MVIAC7)		+= -march=i686
 cflags-$(CONFIG_MCORE2)		+= -march=i686 $(call tune,core2)
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 5001bf9b6579..9a7697d17fb5 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -133,11 +133,6 @@ hostcc-option = $(call __cc-option, $(HOSTCC),\
 cc-option-yn = $(call try-run,\
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
 
-# cc-option-align
-# Prefix align with either -falign or -malign
-cc-option-align = $(subst -functions=0,,\
-	$(call cc-option,-falign-functions=0,-malign-functions=0))
-
 # cc-disable-warning
 # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
 cc-disable-warning = $(call try-run,\
-- 
2.7.4

