Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34210 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730649AbfCZGcn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Mar 2019 02:32:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: fix warning "overriding recipe for target 'Makefile'"
Date: Tue, 26 Mar 2019 15:32:16 +0900
Message-Id: <1553581936-6476-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

If you do "make Makefile" with GNU Make 3.x, the following warning
is displayed:

  $ make Makefile
  Makefile:165: warning: overriding recipe for target 'Makefile'
  Makefile:51: warning: ignoring old recipe for target 'Makefile'
  make[1]: Nothing to be done for 'Makefile'.
  make: Nothing to be done for 'Makefile'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 70fc778..1b361bd 100644
--- a/Makefile
+++ b/Makefile
@@ -161,7 +161,7 @@ ifeq ($(need-sub-make),1)
 
 PHONY += $(MAKECMDGOALS) sub-make
 
-$(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
+$(filter-out _all sub-make $(lastword $(MAKEFILE_LIST)), $(MAKECMDGOALS)) _all: sub-make
 	@:
 
 # Invoke a second make in the output directory, passing relevant variables
-- 
2.7.4
