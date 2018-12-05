Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:60898 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbeLEHh7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 02:37:59 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove a special handling for *.agh in Makefile.headersinst
Date: Wed,  5 Dec 2018 16:37:53 +0900
Message-Id: <1543995473-25080-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

scripts/Makefile.headersinst takes care of *.agh just for

  arch/cris/include/uapi/arch-v10/arch/sv_addr.agh

because renaming exported headers is difficult (or impossible).

This code is no longer necessary thanks to commit c690eddc2f3b ("CRIS:
Drop support for the CRIS port").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.headersinst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 0d4a96d..3d1ebaa 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -44,7 +44,6 @@ kbuild-file := $(srctree)/$(obj)/Kbuild
 installdir    := $(INSTALL_HDR_PATH)/$(dst)
 gendir        := $(objtree)/$(subst include/,include/generated/,$(obj))
 header-files  := $(notdir $(wildcard $(srcdir)/*.h))
-header-files  += $(notdir $(wildcard $(srcdir)/*.agh))
 header-files  := $(filter-out $(no-export-headers), $(header-files))
 genhdr-files  := $(notdir $(wildcard $(gendir)/*.h))
 genhdr-files  := $(filter-out $(header-files), $(genhdr-files))
-- 
2.7.4
