Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:34040 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbeLKMCK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 07:02:10 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/4] kbuild: remove redundant quiet_modtag for $(obj-m)
Date: Tue, 11 Dec 2018 21:01:53 +0900
Message-Id: <1544529716-4917-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

All objects in $(obj-m) are included in $(real-obj-m) as well.

It is true composite objects are only contained in $(obj-m),
but [M] is hard-coded in quiet_cmd_link_multi-m.

This line is redundant.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6a6be9f..5a4fd82 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -110,8 +110,6 @@ $(real-obj-m:.o=.i)  : quiet_modtag := [M]
 $(real-obj-m:.o=.s)  : quiet_modtag := [M]
 $(real-obj-m:.o=.lst): quiet_modtag := [M]
 
-$(obj-m)             : quiet_modtag := [M]
-
 quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
 cmd_cc_s_c       = $(CC) $(c_flags) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
 
-- 
2.7.4
