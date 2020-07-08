Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgGHTIM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 15:08:12 -0400
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] kbuild: Move -Wtype-limits to W=2
Date: Wed,  8 Jul 2020 21:07:56 +0200
Message-Id: <20200708190756.16810-1-rikard.falkeborn@gmail.com>
In-Reply-To: <CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com>
References: <CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@linux-foundation.org
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, arnd@arndb.de, emil.l.velikov@gmail.com, geert@linux-m68k.org, keescook@chromium.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, lkp@intel.com, mm-commits@vger.kernel.org, rikard.falkeborn@gmail.com, syednwaris@gmail.com, vilhelm.gray@gmail.com, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org

-Wtype-limits is included in -Wextra which is added at W=1. It warns
(among other things) that 'comparison of an unsigned variable `< 0` is
always false. This causes noisy warnings, especially when used in
macros, hence it is more suitable for W=2.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
See also discussion at https://lore.kernel.org/lkml/CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com/

 scripts/Makefile.extrawarn | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 4aea7cf71d11..62c275685b75 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -35,6 +35,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
 # The following turn off the warnings enabled by -Wextra
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-sign-compare
+KBUILD_CFLAGS += -Wno-type-limits
 
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
 
@@ -66,6 +67,7 @@ KBUILD_CFLAGS += -Wshadow
 KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
 KBUILD_CFLAGS += -Wmissing-field-initializers
 KBUILD_CFLAGS += -Wsign-compare
+KBUILD_CFLAGS += -Wtype-limits
 KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
 KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
 
-- 
2.27.0
