Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:30277 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932939AbeCSL1T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Mar 2018 07:27:19 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 7/7] kbuild: clean up multi-used module link rule
Date: Mon, 19 Mar 2018 20:26:13 +0900
Message-Id: <1521458773-14224-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1521458773-14224-1-git-send-email-yamada.masahiro@socionext.com>
References: <1521458773-14224-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

cmd_link_multi-link is used only for cmd_link_multi-m.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e5c1aa3..77cce68 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -526,10 +526,8 @@ $($(subst $(obj)/,,$(@:.o=-objs)))    \
 $($(subst $(obj)/,,$(@:.o=-y)))       \
 $($(subst $(obj)/,,$(@:.o=-m)))), $^)
 
-cmd_link_multi-link = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
-
 quiet_cmd_link_multi-m = LD [M]  $@
-cmd_link_multi-m = $(cmd_link_multi-link)
+cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-- 
2.7.4

