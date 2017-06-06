Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:47908 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbdFFHQW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2017 03:16:22 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove duplicated arch/*/include/generated/uapi include path
Date: Tue,  6 Jun 2017 16:15:28 +0900
Message-Id: <1496733328-22521-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, James Hogan <james.hogan@imgtec.com>, Florian Fainelli <f.fainelli@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Commit 90ac086bca10 ("Makefile: include arch/*/include/generated/uapi
before .../generated") introduced this for bisect'ability.  The commit
chose to promote arch/*/include/generated/uapi in the search path
rather than cleaning stale headers.

After all, we found that approach was not enough, and ended up with
cleaning stale headers by commit cda2c65f981d ("kbuild: Remove stale
asm-generic wrappers").

So, the extra search path is no longer needed because Kbuild invokes
scripts/Makefile.asm-generic and remove stale headers before it starts
descending.

This commit is also reverting commit dc33db7c338e ("Kbuild: avoid
duplicate include path") because we have no more duplicated path.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 813ee12431b6..c2c212264752 100644
--- a/Makefile
+++ b/Makefile
@@ -387,12 +387,10 @@ USERINCLUDE    := \
 # Needed to be compatible with the O= option
 LINUXINCLUDE    := \
 		-I$(srctree)/arch/$(hdr-arch)/include \
-		-I$(objtree)/arch/$(hdr-arch)/include/generated/uapi \
 		-I$(objtree)/arch/$(hdr-arch)/include/generated \
 		$(if $(KBUILD_SRC), -I$(srctree)/include) \
-		-I$(objtree)/include
-
-LINUXINCLUDE	+= $(filter-out $(LINUXINCLUDE),$(USERINCLUDE))
+		-I$(objtree)/include \
+		$(USERINCLUDE)
 
 KBUILD_CPPFLAGS := -D__KERNEL__
 
-- 
2.7.4

