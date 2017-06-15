Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:34695 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbdFORmw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2017 13:42:52 -0400
Received: by mail-pf0-f171.google.com with SMTP id s66so10574640pfs.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2017 10:42:52 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 2/3] x86/build: Use __cc-option for boot code compiler options
Date: Thu, 15 Jun 2017 10:37:14 -0700
Message-Id: <20170615173715.40882-3-mka@chromium.org>
In-Reply-To: <20170615173715.40882-1-mka@chromium.org>
References: <20170615173715.40882-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

cc-option is used to enable compiler options for the boot code if they
are available. The macro uses KBUILD_CFLAGS and KBUILD_CPPFLAGS for the
check, however these flags aren't used to build the boot code, in
consequence cc-option can yield wrong results. For example
-mpreferred-stack-boundary=2 is never set with a 64-bit compiler,
since the setting is only valid for 16 and 32-bit binaries. This
is also the case for 32-bit kernel builds, because the option -m32 is
added to KBUILD_CFLAGS after the assignment of REALMODE_CFLAGS.

Use __cc-option instead of cc-option for the boot mode options.
The macro receives the compiler options as parameter instead of using
KBUILD_C*FLAGS, for the boot code we pass REALMODE_CFLAGS.

Also use separate statements for the __cc-option checks instead
of performing them in the initial assignment of REALMODE_CFLAGS since
the variable is an input of the macro.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v3:
- Use __cc-option instead of cc-option-raw
- Updated commit message

 arch/x86/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index bf240b920473..b2dae639f778 100644
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
+REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -ffreestanding)
+REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -fno-stack-protector)
+REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -mpreferred-stack-boundary=2)
 export REALMODE_CFLAGS
 
 # BITS is used as extension for files which are available in a 32 bit
-- 
2.13.1.518.g3df882009-goog

