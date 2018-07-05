Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:44119 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753372AbeGECln (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 22:41:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 07/12] kbuild: use 'include' directive to load auto.conf from top Makefile
Date: Thu,  5 Jul 2018 11:39:44 +0900
Message-Id: <1530758389-30862-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
References: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When you build targets that require the kernel configuration, dot-config
is set to 1, then the top-level Makefile includes auto.conf.  However,
Make considers its inclusion is optional because the '-include' directive
is used here.

If a necessary configuration file is missing for the external module
building, the following error message is displayed:

  ERROR: Kernel configuration is invalid.
         include/generated/autoconf.h or include/config/auto.conf are missing.
         Run 'make oldconfig && make prepare' on kernel src to fix it.

However, Make still continues building; /bin/false let the creation of
'include/config/auto.config' fail, but Make can ignore the error since
it is included by the '-include' directive.

I guess the reason of using '-include' directive was to suppress
the warning when you build the kernel from a pristine source tree:

  Makefile:605: include/config/auto.conf: No such file or directory

The previous commit made sure include/config/auto.conf exists after
the 'make *config' stage.  Now, we can use the 'include' directive
without showing the warning.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d15ac32..ef24068 100644
--- a/Makefile
+++ b/Makefile
@@ -584,7 +584,7 @@ virt-y		:= virt/
 endif # KBUILD_EXTMOD
 
 ifeq ($(dot-config),1)
--include include/config/auto.conf
+include include/config/auto.conf
 endif
 
 # The all: target is the default when no target is given on the
-- 
2.7.4

