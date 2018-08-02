Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:40543 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732068AbeHBPjB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Aug 2018 11:39:01 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] Kbuild: Makefile.modbuiltin: include auto.conf and tristate.conf mandatory
Date: Thu,  2 Aug 2018 15:47:08 +0200
Message-Id: <20180802134708.26456-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The files auto.conf and tristate.conf are mandatory for building
modules.builtin files, therefore include them as such.

Usually, the top-level Makefile ensures that those files exist but we
want to make sure we get noticed if they are missing for whatever
reason.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/Makefile.modbuiltin | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
index 40867a41615b..a072a4267746 100644
--- a/scripts/Makefile.modbuiltin
+++ b/scripts/Makefile.modbuiltin
@@ -8,10 +8,10 @@ src := $(obj)
 PHONY := __modbuiltin
 __modbuiltin:
 
--include include/config/auto.conf
+include include/config/auto.conf
 # tristate.conf sets tristate variables to uppercase 'Y' or 'M'
 # That way, we get the list of built-in modules in obj-Y
--include include/config/tristate.conf
+include include/config/tristate.conf
 
 include scripts/Kbuild.include
 
-- 
2.16.4

