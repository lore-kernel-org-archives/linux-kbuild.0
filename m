Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:53040 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756502AbdJKDyE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Oct 2017 23:54:04 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: add forward declaration of default target to Makefile.asm-generic
Date: Wed, 11 Oct 2017 12:52:29 +0900
Message-Id: <1507693949-23059-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

$(kbuild-file) and Kbuild.include are included before the default
target "all".

We will add a target into Kbuild.include.  In advance, add a forward
declaration of the default target.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.asm-generic | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
index a6c8c17..982fb7e 100644
--- a/scripts/Makefile.asm-generic
+++ b/scripts/Makefile.asm-generic
@@ -5,6 +5,9 @@
 # and for each file listed in this file with generic-y creates
 # a small wrapper file in $(obj) (arch/$(SRCARCH)/include/generated/$(src))
 
+PHONY += all
+all:
+
 kbuild-file := $(srctree)/arch/$(SRCARCH)/include/$(src)/Kbuild
 -include $(kbuild-file)
 
-- 
2.7.4

