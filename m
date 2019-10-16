Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:21144 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbfJPFMY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 01:12:24 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unneeded variable, single-all
Date: Wed, 16 Oct 2019 14:12:15 +0900
Message-Id: <20191016051215.10909-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When single-build is set, everything in $(MAKECMDGOALS) is a single
target. You can use $(MAKECMDGOALS) to list out the single targets.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index ffd7a912fc46..710199f60c30 100644
--- a/Makefile
+++ b/Makefile
@@ -1764,11 +1764,9 @@ tools/%: FORCE
 
 ifdef single-build
 
-single-all := $(filter $(single-targets), $(MAKECMDGOALS))
-
 # .ko is special because modpost is needed
-single-ko := $(sort $(filter %.ko, $(single-all)))
-single-no-ko := $(sort $(patsubst %.ko,%.mod, $(single-all)))
+single-ko := $(sort $(filter %.ko, $(MAKECMDGOALS)))
+single-no-ko := $(sort $(patsubst %.ko,%.mod, $(MAKECMDGOALS)))
 
 $(single-ko): single_modpost
 	@:
-- 
2.17.1
