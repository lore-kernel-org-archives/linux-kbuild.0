Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:28041 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbfETC5a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 May 2019 22:57:30 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: do not check name uniqueness of builtin modules
Date: Mon, 20 May 2019 11:54:37 +0900
Message-Id: <20190520025437.13825-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Schmitz <schmitzmic@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <yamada.masahiro@socionext.com>, Lucas De Marchi <lucas.demarchi@intel.com>

I just thought it was a good idea to scan builtin.modules in the name
uniqueness checking, but Stephen reported a false positive.

ppc64_defconfig produces:

  warning: same basename if the following are built as modules:
    arch/powerpc/platforms/powermac/nvram.ko
    drivers/char/nvram.ko

..., which is a false positive because the former is never built as
a module as you see in arch/powerpc/platforms/powermac/Makefile:

  # CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
  # need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=m is really
  # CONFIG_NVRAM=y
  obj-$(CONFIG_NVRAM:m=y)         += nvram.o

Since we cannot predict how tricky Makefiles are written in wild,
builtin.modules may potentially contain false positives. I do not
think it is a big deal as far as kmod is concerned, but false positive
warnings in the kernel build makes people upset. It is better to not
do it.

Even without checking builtin.modules, we have enough (and more solid)
test coverage with allmodconfig.

While I touched this part, I replaced the sed code with neater one
provided by Stephen.

Link: https://lkml.org/lkml/2019/5/19/120
Link: https://lkml.org/lkml/2019/5/19/123
Fixes: 3a48a91901c5 ("kbuild: check uniqueness of module names")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/modules-check.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index 2f659530e1ec..39e8cb36ba19 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -6,10 +6,10 @@ set -e
 # Check uniqueness of module names
 check_same_name_modules()
 {
-	for m in $(sed 's:.*/::' modules.order modules.builtin | sort | uniq -d)
+	for m in $(sed 's:.*/::' modules.order | sort | uniq -d)
 	do
-		echo "warning: same basename if the following are built as modules:" >&2
-		sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin >&2
+		echo "warning: same module names found:" >&2
+		sed -n "/\/$m/s:^kernel/:  :p" modules.order >&2
 	done
 }
 
-- 
2.17.1
