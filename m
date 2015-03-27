Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:27770 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753281AbbC0LoN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Mar 2015 07:44:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/4] kbuild: include $(src)/Makefile rather than $(obj)/Makefile
Date: Fri, 27 Mar 2015 20:43:37 +0900
Message-Id: <1427456618-23830-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1427456618-23830-1-git-send-email-yamada.masahiro@socionext.com>
References: <1427456618-23830-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>

This commit actually has no impact because $(src) and $(obj) point
to the same path, but $(src)/Makefile looks better when we include
source files.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.dtbinst | 2 +-
 scripts/Makefile.fwinst  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 7cbff16..1c15717 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -18,7 +18,7 @@ export dtbinst-root ?= $(obj)
 
 include include/config/auto.conf
 include scripts/Kbuild.include
-include $(obj)/Makefile
+include $(src)/Makefile
 
 PHONY += __dtbs_install_prep
 __dtbs_install_prep:
diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
index baf5eae..b272900 100644
--- a/scripts/Makefile.fwinst
+++ b/scripts/Makefile.fwinst
@@ -13,7 +13,7 @@ src := $(obj)
 -include $(objtree)/.config
 
 include scripts/Kbuild.include
-include $(obj)/Makefile
+include $(src)/Makefile
 
 include scripts/Makefile.host
 
-- 
1.9.1

