Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fr1.as29.net ([62.210.131.231]:51997 "EHLO
	toothrot.meleeweb.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868AbaHPS7y (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Aug 2014 14:59:54 -0400
From: Bertrand Jacquin <beber@meleeweb.net>
Subject: [PATCH 3/3] modsign: lookup lines ending in .ko in .mod files
Date: Sat, 16 Aug 2014 20:50:16 +0200
Message-Id: <1408215016-1848-4-git-send-email-beber@meleeweb.net>
In-Reply-To: <1408215016-1848-1-git-send-email-beber@meleeweb.net>
References: <1408215016-1848-1-git-send-email-beber@meleeweb.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org
Cc: Bertrand Jacquin <beber@meleeweb.net>, linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>

This does the same as commit ef591a5 (scripts/Makefile.modpost: error
in finding modules from .mod files), but for scripts/Makefile.modsign

Maybe we should also apply to Makefile.modsign and Makefile.modinst
the change applied to Makefile.modpost by commit ea4054a (modpost:
handle huge numbers of modules) ?

Reviewed-by: Willy Tarreau <w@1wt.eu>
Signed-off-by: Bertrand Jacquin <beber@meleeweb.net>
---
 scripts/Makefile.modsign | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modsign b/scripts/Makefile.modsign
index abfda62..b6ac708 100644
--- a/scripts/Makefile.modsign
+++ b/scripts/Makefile.modsign
@@ -7,7 +7,7 @@ __modsign:
 
 include scripts/Kbuild.include
 
-__modules := $(sort $(shell grep -h '\.ko' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
+__modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
 modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))
 
 PHONY += $(modules)
-- 
2.0.4

