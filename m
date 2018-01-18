Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:58742 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752955AbeAREOt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jan 2018 23:14:49 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: announce removal of oldnoconfig if used
Date: Thu, 18 Jan 2018 13:13:43 +0900
Message-Id: <1516248823-22790-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Ulf Magnusson <ulfalizer@gmail.com>, Marc Herbert <marc.herbert@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The 'oldnoconfig' is really confusing due to its counter-intuitive name.
It was renamed by commit fb16d8912db5 ("kconfig: replace 'oldnoconfig'
with 'olddefconfig', and keep the old name as an alias").

The 'oldnoconfig' has been kept as an alias for enough period of time,
and finally I am planning to remove it.  Meanwhile, the following
message will be displayed if oldnoconfig is used.

    WARNING: "oldnoconfig" target will be removed after Linux 4.19
              Please use "olddefconfig" instead.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 61cdc5e..9a349bd 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -92,6 +92,8 @@ PHONY += oldnoconfig savedefconfig defconfig
 # on its behavior (sets new symbols to their default value but not 'n') with the
 # counter-intuitive name.
 oldnoconfig: olddefconfig
+	@echo "  WARNING: \"oldnoconfig\" target will be removed after Linux 4.19"
+	@echo "            Please use \"olddefconfig\" instead."
 
 savedefconfig: $(obj)/conf
 	$< $(silent) --$@=defconfig $(Kconfig)
-- 
2.7.4

