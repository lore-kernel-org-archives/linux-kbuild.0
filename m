Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57545 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbfEOHkZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 03:40:25 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH] kbuild: check uniqueness of basename of modules
Date: Wed, 15 May 2019 16:38:18 +0900
Message-Id: <20190515073818.22486-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

In the recent build test of linux-next, Stephen saw a build error
caused by a broken .tmp_versions/*.mod file:

  https://lkml.org/lkml/2019/5/13/991

drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
basename, and there is a race in generating .tmp_versions/asix.mod

Kbuild has not checked this before, and it occasionally shows up with
obscure error message when this kind of race occurs.

It is not trivial to catch this potential issue by eyes.

Hence, this script.

I compile-tested allmodconfig for the latest kernel as of writing,
it detected the following:

warning: same basename '88pm800.ko' if the following are built as modules:
  drivers/regulator/88pm800.ko
  drivers/mfd/88pm800.ko
warning: same basename 'adv7511.ko' if the following are built as modules:
  drivers/gpu/drm/bridge/adv7511/adv7511.ko
  drivers/media/i2c/adv7511.ko
warning: same basename 'asix.ko' if the following are built as modules:
  drivers/net/phy/asix.ko
  drivers/net/usb/asix.ko
warning: same basename 'coda.ko' if the following are built as modules:
  fs/coda/coda.ko
  drivers/media/platform/coda/coda.ko
warning: same basename 'realtek.ko' if the following are built as modules:
  drivers/net/phy/realtek.ko
  drivers/net/dsa/realtek.ko

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 [Alternative fix ? ]

I do not know about the user experience of modprobe etc.
when two different modules have the same name.
It does not matter if this is correctly handled by modules.order?

If this is just a problem of the build system, it is pretty easy to fix.
For example, if we prepend the directory path, parallel build will
never write to the same file simultanously.

  asix.mod -> drivers/net/phy/asix.mod
  asix.mod -> drivers/net/usb/asix.mod

 [Futher discussion]

Linus Torvalds pointed out that it is silly to add the same prefix to
each file since the sub-system is already represented by the directory
path.

See this:
https://lkml.org/lkml/2017/7/12/430

We can keep the basename short enough to distinguish in the subsytem
in theory.

So, I am not surprised to see the same file name in different
directory locations.

On the other hand, a module is named after the file name when
it consists of a single C source file.

Of course, you can always give a different module name.

For example, see
 drivers/nvmem/Makefile

I am not a big fan of it since it looks ugly.

I think we can play it by ear, but I just wanted to point out this
related to the module name uniqueness.


 Makefile                 |  1 +
 scripts/modules-check.sh | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100755 scripts/modules-check.sh

diff --git a/Makefile b/Makefile
index a61a95b6b38f..30792fec7a12 100644
--- a/Makefile
+++ b/Makefile
@@ -1290,6 +1290,7 @@ modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
 	$(Q)$(AWK) '!x[$$0]++' $(vmlinux-dirs:%=$(objtree)/%/modules.order) > $(objtree)/modules.order
 	@$(kecho) '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
 
 modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
 	$(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
new file mode 100755
index 000000000000..944e68bd22b0
--- /dev/null
+++ b/scripts/modules-check.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+# Warn if two or more modules have the same basename
+check_same_name_modules()
+{
+	same_name_modules=$(cat modules.order modules.builtin | \
+				xargs basename -a | sort | uniq -d)
+
+	for m in $same_name_modules
+	do
+		echo "warning: same basename '$m' if the following are built as modules:"
+		grep --no-filename -e /$m modules.order modules.builtin | \
+							sed 's:^kernel/:  :'
+	done
+}
+
+check_same_name_modules
-- 
2.17.1
