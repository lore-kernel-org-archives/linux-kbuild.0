Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f52.google.com ([74.125.83.52]:33106 "EHLO
        mail-pg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752734AbdFMA4D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2017 20:56:03 -0400
Received: by mail-pg0-f52.google.com with SMTP id f185so52292081pgc.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2017 17:56:03 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 2/3] x86/build: Use cc-option-no-kbuild for boot code compiler options
Date: Mon, 12 Jun 2017 17:55:30 -0700
Message-Id: <20170613005531.77656-3-mka@chromium.org>
In-Reply-To: <20170613005531.77656-1-mka@chromium.org>
References: <20170613005531.77656-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when checking if a
compiler option is available. These flags aren't used to build the boot
code, in consequence cc-option can yield wrong results. For example
-mpreferred-stack-boundary=2 is never set with a 64 bit compiler,
since the setting is only valid for 16 and 32 bit binaries. This
is also the case for 32 bit kernel builds, because the option -m32 is
added to KBUILD_CFLAGS after the assignment of REALMODE_CFLAGS.

Use cc-option-no-kbuild instead of cc-option for the boot mode options.
The macro receives the compiler options as parameter instead of using
KBUILD_C*FLAGS. For the boot code we pass REALMODE_CFLAGS.

Also use separate statements for the cc-option-no-kbuild checks instead
of performing them in the initial assignment of REALMODE_CFLAGS since
the variable is an input of the macro.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/x86/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index bf240b920473..86b725d69423 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -24,10 +24,11 @@ REALMODE_CFLAGS	:= $(M16_CFLAGS) -g -Os -D__KERNEL__ \
 		   -DDISABLE_BRANCH_PROFILING \
 		   -Wall -Wstrict-prototypes -march=i386 -mregparm=3 \
 		   -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
-		   -mno-mmx -mno-sse \
-		   $(call cc-option, -ffreestanding) \
-		   $(call cc-option, -fno-stack-protector) \
-		   $(call cc-option, -mpreferred-stack-boundary=2)
+		   -mno-mmx -mno-sse
+
+REALMODE_CFLAGS += $(call cc-option-no-kbuild, $(REALMODE_CFLAGS), -ffreestanding)
+REALMODE_CFLAGS += $(call cc-option-no-kbuild, $(REALMODE_CFLAGS), -fno-stack-protector)
+REALMODE_CFLAGS += $(call cc-option-no-kbuild, $(REALMODE_CFLAGS), -mpreferred-stack-boundary=2)
 export REALMODE_CFLAGS
 
 # BITS is used as extension for files which are available in a 32 bit
-- 
2.13.1.508.gb3defc5cc-goog

