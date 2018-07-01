Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.horus.com ([78.46.148.228]:56973 "EHLO mail.horus.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752082AbeGANMu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Jul 2018 09:12:50 -0400
From: Matthias Reichl <hias@horus.com>
Subject: [PATCH] kbuild: honor HOSTCFLAGS and HOSTLDFLAGS in libelf test
Date: Sun,  1 Jul 2018 15:07:33 +0200
Message-Id: <20180701130733.7781-1-hias@horus.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Since commit 596a9f6768af ("objtool: Support HOSTCFLAGS and HOSTLDFLAGS")
objtool can use a libelf installed in a non-standard location by
passing in appropriate HOST flags.

The libelf check in the main Makefile is done without these flags
and fails if no libelf is installed on the system.

Fix this by adding HOSTCFLAGS and HOSTLDFLAGS to the libelf check.

Signed-off-by: Matthias Reichl <hias@horus.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c9132594860b..b0485fddc554 100644
--- a/Makefile
+++ b/Makefile
@@ -933,7 +933,7 @@ export mod_sign_cmd
 
 ifdef CONFIG_STACK_VALIDATION
   has_libelf := $(call try-run,\
-		echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -,1,0)
+		echo "int main() {}" | $(HOSTCC) $(HOSTCFLAGS) -xc -o /dev/null -lelf $(HOSTLDFLAGS) -,1,0)
   ifeq ($(has_libelf),1)
     objtool_target := tools/objtool FORCE
   else
-- 
2.11.0

