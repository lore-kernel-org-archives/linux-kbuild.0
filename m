Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:34039 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbeLKMCL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 07:02:11 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/4] kbuild: refactor quiet_modtag
Date: Tue, 11 Dec 2018 21:01:54 +0900
Message-Id: <1544529716-4917-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544529716-4917-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544529716-4917-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

part-of-module and quiet_modtag are set for the same targets.
Define quiet_modtag based on part-of-module.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5a4fd82..f26ae45 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -98,18 +98,13 @@ modkern_cflags =                                          \
 	$(if $(part-of-module),                           \
 		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
 		$(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
-quiet_modtag := $(empty)   $(empty)
+quiet_modtag = $(if $(part-of-module),[M],   )
 
 $(real-obj-m)        : part-of-module := y
 $(real-obj-m:.o=.i)  : part-of-module := y
 $(real-obj-m:.o=.s)  : part-of-module := y
 $(real-obj-m:.o=.lst): part-of-module := y
 
-$(real-obj-m)        : quiet_modtag := [M]
-$(real-obj-m:.o=.i)  : quiet_modtag := [M]
-$(real-obj-m:.o=.s)  : quiet_modtag := [M]
-$(real-obj-m:.o=.lst): quiet_modtag := [M]
-
 quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
 cmd_cc_s_c       = $(CC) $(c_flags) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
 
-- 
2.7.4
