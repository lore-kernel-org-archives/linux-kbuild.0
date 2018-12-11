Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:34041 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbeLKMCL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 07:02:11 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/4] kbuild: refactor part-of-module
Date: Tue, 11 Dec 2018 21:01:55 +0900
Message-Id: <1544529716-4917-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544529716-4917-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544529716-4917-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Use $(foreach ...) to make it shorter.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f26ae45..321b5b7 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -94,17 +94,15 @@ endif
 # ---------------------------------------------------------------------------
 
 # Default is built-in, unless we know otherwise
+$(foreach x, i lst o s, $(patsubst %.o,%.$(x),$(real-obj-m))): \
+	part-of-module := y
+
 modkern_cflags =                                          \
 	$(if $(part-of-module),                           \
 		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
 		$(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
 quiet_modtag = $(if $(part-of-module),[M],   )
 
-$(real-obj-m)        : part-of-module := y
-$(real-obj-m:.o=.i)  : part-of-module := y
-$(real-obj-m:.o=.s)  : part-of-module := y
-$(real-obj-m:.o=.lst): part-of-module := y
-
 quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
 cmd_cc_s_c       = $(CC) $(c_flags) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
 
-- 
2.7.4
