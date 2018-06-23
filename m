Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:44605 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751487AbeFWN6N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jun 2018 09:58:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 1/3] kbuild: use 'include' directive to load auto.conf from top Makefile
Date: Sat, 23 Jun 2018 22:56:07 +0900
Message-Id: <1529762169-13488-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When you build targets that require the kernel configuration, dot-config
is set to 1, then the top-level Makefile includes auto.conf.  However,
Make considers its inclusion is optional because the '-include' directive
is used.

If a necessary configuration file is missing for the external module
building, the following error message is displayed:

  ERROR: Kernel configuration is invalid.
         include/generated/autoconf.h or include/config/auto.conf are missing.
         Run 'make oldconfig && make prepare' on kernel src to fix it.

However, Make still continues building; /bin/false let the creation of
'include/config/auto.config' fail, but Make can ignore the error since
it is included by the '-include' directive.

Use the 'include' directive instead.  This allows the /bin/false
to correctly terminate the whole build process.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - New patch

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ca2af1a..413c2ed 100644
--- a/Makefile
+++ b/Makefile
@@ -589,7 +589,7 @@ virt-y		:= virt/
 endif # KBUILD_EXTMOD
 
 ifeq ($(dot-config),1)
--include include/config/auto.conf
+include include/config/auto.conf
 endif
 
 # The all: target is the default when no target is given on the
-- 
2.7.4

