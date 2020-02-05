Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:24774 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgBEGw1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 01:52:27 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: make multiple directory targets work properly
Date: Wed,  5 Feb 2020 15:51:52 +0900
Message-Id: <20200205065152.873-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

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
---

Linus,

If you want to use this patch soon (seems useful since
you are travelling), please feel free to apply it directly.

If you wait for my next pull request, I will apply it to
my tree.

Either is fine with me.



 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 65a5dc653deb..ef8913a8eb2a 100644
--- a/Makefile
+++ b/Makefile
@@ -1679,7 +1679,7 @@ PHONY += descend $(build-dirs)
 descend: $(build-dirs)
 $(build-dirs): prepare
 	$(Q)$(MAKE) $(build)=$@ \
-	single-build=$(if $(filter-out $@/, $(single-no-ko)),1) \
+	single-build=$(if $(filter-out $@/, $(filter $@/%, $(single-no-ko))),1) \
 	need-builtin=1 need-modorder=1
 
 clean-dirs := $(addprefix _clean_, $(clean-dirs))
-- 
2.17.1
