Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:36298 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgAMHaY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 02:30:24 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: remove 'Building modules, stage 2.' log
Date: Mon, 13 Jan 2020 16:30:17 +0900
Message-Id: <20200113073017.6910-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This log is displayed every time modules are built, but it is not
so important.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 69897d5d3a70..b4d3f2d122ac 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -90,7 +90,6 @@ quiet_cmd_modpost = MODPOST $(words $(modules)) modules
       cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST)
 
 __modpost:
-	@$(kecho) '  Building modules, stage 2.'
 	$(call cmd,modpost)
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
-- 
2.17.1
