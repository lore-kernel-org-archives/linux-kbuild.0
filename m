Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:60899 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbeILJ4I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Sep 2018 05:56:08 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: prefix Makefile.dtbinst path with $(srctree) unconditionally
Date: Wed, 12 Sep 2018 13:52:54 +0900
Message-Id: <1536727974-28211-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

$(srctree) always points to the top of the source tree whether
KBUILD_SRC is set or not.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index ce53639..46cc43e 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -193,7 +193,7 @@ modbuiltin := -f $(srctree)/scripts/Makefile.modbuiltin obj
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.dtbinst obj=
 # Usage:
 # $(Q)$(MAKE) $(dtbinst)=dir
-dtbinst := -f $(if $(KBUILD_SRC),$(srctree)/)scripts/Makefile.dtbinst obj
+dtbinst := -f $(srctree)/scripts/Makefile.dtbinst obj
 
 ###
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.clean obj=
-- 
2.7.4
