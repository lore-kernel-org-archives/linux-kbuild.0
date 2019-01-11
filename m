Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:31937 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728545AbfAKCwG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Jan 2019 21:52:06 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: clean generated *conf-cfg files
Date: Fri, 11 Jan 2019 11:51:48 +0900
Message-Id: <1547175108-14744-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

I accidentally dropped '*' in the previous renaming patch.

Revive it so that 'make mrproper' can clean the generated files.

Fixes: d86271af6460 ("kconfig: rename generated .*conf-cfg to *conf-cfg")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index c05ab00..1819735 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -206,4 +206,4 @@ filechk_conf_cfg = $(CONFIG_SHELL) $<
 $(obj)/%conf-cfg: $(src)/%conf-cfg.sh FORCE
 	$(call filechk,conf_cfg)
 
-clean-files += conf-cfg
+clean-files += *conf-cfg
-- 
2.7.4
