Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:26868 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbfGaGOY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jul 2019 02:14:24 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: add [M] marker for build log of *.mod.o
Date: Wed, 31 Jul 2019 15:13:58 +0900
Message-Id: <20190731061358.30117-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This builds module objects, so [M] makes sense.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 6e328190d609..6c237af41417 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -112,7 +112,7 @@ $(modules:.ko=.mod.c): modules-modpost ;
 # modname is set to make c_flags define KBUILD_MODNAME
 modname = $(notdir $(@:.mod.o=))
 
-quiet_cmd_cc_o_c = CC      $@
+quiet_cmd_cc_o_c = CC [M]  $@
       cmd_cc_o_c = $(CC) $(c_flags) $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE) \
 		   -c -o $@ $<
 
-- 
2.17.1
