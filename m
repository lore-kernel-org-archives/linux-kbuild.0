Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:55700 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbeIROR6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Sep 2018 10:17:58 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/4] kbuild: remove user ID check in scripts/mkmakefile
Date: Tue, 18 Sep 2018 17:45:52 +0900
Message-Id: <1537260354-30082-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1537260354-30082-1-git-send-email-yamada.masahiro@socionext.com>
References: <1537260354-30082-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This line was added by commit fd5f0cd6b0ce ("kbuild: Do not overwrite
makefile as anohter user").  Its commit description says the intention
was to prevent $(objtree)/Makefile from being owned by root when e.g.
running 'make install'.

However, as commit 19514fc665ff ("arm, kbuild: make "make install" not
depend on vmlinux") stated, installation targets must not modify the
source tree in the first place.  If they do, we are already screwed up.
We must fix the root cause.

Installation targets should just copy files verbatim, hence we never
expect $(objtree)/Makefile is touched by root.  The user ID check in
scripts/mkmakefile is unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mkmakefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/mkmakefile b/scripts/mkmakefile
index e2106444..2435428 100755
--- a/scripts/mkmakefile
+++ b/scripts/mkmakefile
@@ -8,7 +8,6 @@
 # $1 - Kernel src directory
 # $2 - Output directory
 
-test ! -r $2/Makefile -o -O $2/Makefile || exit 0
 # Only overwrite automatically generated Makefiles
 # (so we do not overwrite kernel Makefile)
 if test -e $2/Makefile && ! grep -q Automatically $2/Makefile
-- 
2.7.4
