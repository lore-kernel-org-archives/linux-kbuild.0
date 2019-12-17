Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:56751 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfLQETB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:19:01 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] kconfig: use $(PERL) in Makefile
Date: Tue, 17 Dec 2019 13:18:19 +0900
Message-Id: <20191217041819.29732-2-masahiroy@kernel.org>
In-Reply-To: <20191217041819.29732-1-masahiroy@kernel.org>
References: <20191217041819.29732-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

The top Makefile defines and exports the variable 'PERL'. Use it in
case somebody wants to specify a particular version of perl from the
command line.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index f826a257d576..953a2859302c 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -47,7 +47,7 @@ build_gconfig: $(obj)/gconf
 build_xconfig: $(obj)/qconf
 
 localyesconfig localmodconfig: $(obj)/conf
-	$(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
+	$(Q)$(PERL) $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 				\
 		cmp -s .tmp.config .config ||			\
 		(mv -f .config .config.old.1;			\
-- 
2.17.1
