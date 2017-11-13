Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40612 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbdKMKbf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 05:31:35 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 6/6] kbuild: remove redundant mkdir from ./Kbuild
Date: Mon, 13 Nov 2017 19:29:39 +0900
Message-Id: <1510568979-24440-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

These two targets are added to "targets".  Their directories are
automatically created.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 Kbuild | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Kbuild b/Kbuild
index 94c7527..f1997d8 100644
--- a/Kbuild
+++ b/Kbuild
@@ -17,7 +17,6 @@ targets := kernel/bounds.s
 
 # We use internal kbuild rules to avoid the "is up to date" message from make
 kernel/bounds.s: kernel/bounds.c FORCE
-	$(Q)mkdir -p $(dir $@)
 	$(call if_changed_dep,cc_s_c)
 
 $(obj)/$(bounds-file): kernel/bounds.s FORCE
@@ -53,7 +52,6 @@ targets += arch/$(SRCARCH)/kernel/asm-offsets.s
 # We use internal kbuild rules to avoid the "is up to date" message from make
 arch/$(SRCARCH)/kernel/asm-offsets.s: arch/$(SRCARCH)/kernel/asm-offsets.c \
                                       $(obj)/$(timeconst-file) $(obj)/$(bounds-file) FORCE
-	$(Q)mkdir -p $(dir $@)
 	$(call if_changed_dep,cc_s_c)
 
 $(obj)/$(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s FORCE
-- 
2.7.4

