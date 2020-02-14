Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389118AbgBNQAV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Feb 2020 11:00:21 -0500
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.5 536/542] kbuild: make multiple directory targets work
Date: Fri, 14 Feb 2020 10:48:48 -0500
Message-Id: <20200214154854.6746-536-sashal@kernel.org>
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit f566e1fbadb686e28f1c307e356114b2865ef588 ]

Currently, the single-target build does not work when two
or more sub-directories are given:

  $ make fs/ kernel/ lib/
    CALL    scripts/checksyscalls.sh
    CALL    scripts/atomic/check-atomics.sh
    DESCEND  objtool
  make[2]: Nothing to be done for 'kernel/'.
  make[2]: Nothing to be done for 'fs/'.
  make[2]: Nothing to be done for 'lib/'.

Make it work properly.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fdaa1e262320d..b65e891c4deae 100644
--- a/Makefile
+++ b/Makefile
@@ -1691,7 +1691,7 @@ PHONY += descend $(build-dirs)
 descend: $(build-dirs)
 $(build-dirs): prepare
 	$(Q)$(MAKE) $(build)=$@ \
-	single-build=$(if $(filter-out $@/, $(single-no-ko)),1) \
+	single-build=$(if $(filter-out $@/, $(filter $@/%, $(single-no-ko))),1) \
 	need-builtin=1 need-modorder=1
 
 clean-dirs := $(addprefix _clean_, $(clean-dirs))
-- 
2.20.1
