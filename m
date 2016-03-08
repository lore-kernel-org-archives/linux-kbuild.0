Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hotel311.server4you.de ([85.25.146.15]:54574 "EHLO
	hotel311.server4you.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753842AbcCHIjL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Mar 2016 03:39:11 -0500
From: Daniel Wagner <wagi@monom.org>
Subject: [PATCH] kbuild: Add option to turn incompatible pointer check into error
Date: Tue,  8 Mar 2016 09:29:09 +0100
Message-Id: <1457425749-24110-1-git-send-email-wagi@monom.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>, Thomas Gleixner <tglx@linutronix.de>

From: Daniel Wagner <daniel.wagner@bmw-carit.de>

With the introduction of the simple wait API we have two very
similar APIs in the kernel. For example wake_up() and swake_up()
is only one character away. Although the compiler will warn
happily the wrong usage it keeps on going an even links the kernel.
Thomas and Peter would rather like to see early missuses reported
as error early on.

In a first attempt we tried to wrap all swait and wait calls
into a macro which has an compile time type assertion. The result
was pretty ugly and wasn't able to catch all wrong usages.
woken_wake_function(), autoremove_wake_function() and wake_bit_function()
are assigned as function pointers. Wrapping them with a macro around is
not possible. Prefixing them with '_' was also not a real option
because there some users in the kernel which do use them as well.
All in all this attempt looked to intrusive and too ugly.

An alternative is to turn the pointer type check into an error which
catches wrong type uses. Obviously not only the swait/wait ones. That
isn't a bad thing either.

Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---

Hi,

This patch was part of the swait patchset [1]. Ingo reverted it later
because:

"So adding -Werror=incompatible-pointer-types wasn't a bad idea, but it
should really not be done in the scheduler tree: it exposes us to a
number of pre-existing warnings (most of them harmless), now upgraded
to build failures...

This should be done via the kbuild tree."

I tried to build a bunch of different architectures and configurations
to find any hold offs. For those architecture I had a working
toolchain it looks good. All but one are fixed or on the way to
mainline.

Here is the list of archs and config I tried out. First run was with the
config listed, followed by a allyesconfig and allmodconfig build. 

#    name      ARCH     CROSS_COMPILE        config
declare -a config=(
    "alpha     alpha    alpha-linux-gnu-     defconfig"
    "arm32     arm      arm-linux-gnu-       versatile_defconfig"
    "arm64     arm64    aarch64-linux-gnu-   defconfig"
    "cris10    cris     cris-linux-gnu-      etrax-100lx_defconfig"
    "frv       frv      frv-linux-gnu-       defconfig"
    "ia64      ia64     ia64-linux-gnu-      generic_defconfig"
    "m68k      m68k     m68k-linux-gnu-      amiga_defconfig"
    "mips32    mips     mips64-linux-gnu-    ar7_defconfig"
    "mips64    mips     mips64-linux-gnu-    bigsur_defconfig"
    "ppc64     powerpc  powerpc64-linux-gnu- pseries_defconfig"
    "s390      s390     s390x-linux-gnu-     defconfig"
    "sparc32   sparc    sparc64-linux-gnu-   sparc32_defconfig"
    "sparc64   sparc    sparc64-linux-gnu-   sparc64_defconfig"
    "um_x86_64 um       gcc                  defconfig"
    "x86_64    x86_64   gcc                  defconfig"

As said above for the missing arch I didn't get hold on a working
toolchain with gcc >= 5.2.

On alpha I found [2]. So far no feedback on the patch. Propoably missing
the right CCs.

x86 is breaking for allyesconfig in gma500. The fix is linus-next [3].

cheers,
daniel

[1] http://thread.gmane.org/gmane.linux.kernel/2156371
[2] http://thread.gmane.org/gmane.linux.ports.alpha/3494
[3] https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/diff/drivers/gpu/drm/gma500/mdfld_dsi_output.c?id=075f82f5db32848f5cbcdf5d7d6668b7c087b49f


Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 2d519d2..a0ff507 100644
--- a/Makefile
+++ b/Makefile
@@ -773,6 +773,9 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=strict-prototypes)
 # Prohibit date/time macros, which would make the build non-deterministic
 KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
 
+# enforce correct pointer usage
+KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
+
 # use the deterministic mode of AR if available
 KBUILD_ARFLAGS := $(call ar-option,D)
 
-- 
2.5.0
