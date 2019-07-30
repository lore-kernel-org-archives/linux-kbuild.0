Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:60070 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbfG3P7N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 11:59:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/4] kbuild: modpost: remove unnecessary dependency for __modpost
Date: Wed, 31 Jul 2019 00:59:01 +0900
Message-Id: <20190730155902.5557-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190730155902.5557-1-yamada.masahiro@socionext.com>
References: <20190730155902.5557-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

__modpost is a phony target. The dependency on FORCE is pointless.
All the objects have been built in the previous stage, so the
dependency on the objects are not necessary either.

Count the number of modules in a more straightforward way.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index c856512349cd..fdab32d6f552 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -86,11 +86,11 @@ modpost = scripts/mod/modpost                    \
 MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
 
 # We can go over command line length here, so be careful.
-quiet_cmd_modpost = MODPOST $(words $(filter-out vmlinux FORCE, $^)) modules
+quiet_cmd_modpost = MODPOST $(words $(modules)) modules
       cmd_modpost = sed 's/ko$$/o/' $(modorder) | $(modpost) $(MODPOST_OPT) -s -T -
 
 PHONY += __modpost
-__modpost: $(modules:.ko=.o) FORCE
+__modpost:
 	$(call cmd,modpost) $(wildcard vmlinux)
 
 quiet_cmd_kernel-mod = MODPOST $@
-- 
2.17.1
