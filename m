Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg012.nifty.com ([202.248.44.38]:25644 "EHLO
	conuserg012-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753786AbcCMAjj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Mar 2016 19:39:39 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: specify modules(_install) as PHONY rather than FORCE
Date: Sun, 13 Mar 2016 09:39:22 +0900
Message-Id: <1457829562-31752-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

As in other places, PHONY is a better fit for "modules" and
"modules_install".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e3ef6b6..64cf099 100644
--- a/Makefile
+++ b/Makefile
@@ -1157,7 +1157,8 @@ else # CONFIG_MODULES
 # Modules not configured
 # ---------------------------------------------------------------------------
 
-modules modules_install: FORCE
+PHONY += modules modules_install
+modules modules_install:
 	@echo >&2
 	@echo >&2 "The present kernel configuration has modules disabled."
 	@echo >&2 "Type 'make config' and enable loadable module support."
-- 
1.9.1

