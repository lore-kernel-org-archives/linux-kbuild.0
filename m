Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:58489 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033632AbdDUGWO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 02:22:14 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 1/2] kbuild: consolidate redundant sed script ASM offset generation
Date: Fri, 21 Apr 2017 15:21:10 +0900
Message-Id: <1492755671-19005-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1492755671-19005-1-git-send-email-yamada.masahiro@socionext.com>
References: <1492755671-19005-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Matthias Kaehlcke <mka@chromium.org>, David Howells <dhowells@redhat.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Jan Beulich <JBeulich@novell.com>, Alexander van Heukelum <heukelum@fastmail.fm>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This part ended up in redundant code after touched by multiple
people.

[1] Commit 3234282f33b2 ("x86, asm: Fix CFI macro invocations to
deal with shortcomings in gas") added parentheses for defined
expressions to support old gas for x86.

[2] Commit a22dcdb0032c ("x86, asm: Fix ancient-GAS workaround")
split the pattern into two to avoid parentheses for non-numeric
expressions.

[3] Commit 95a2f6f72d37 ("Partially revert patch that encloses
asm-offset.h numbers in brackets") removed parentheses from numeric
expressions as well because parentheses in MN10300 assembly have a
special meaning (pointer access).

Apparently, there is a conflict between [1] and [3].  After all,
[3] took precedence, and a long time has passed since then.

Now, merge the two patterns again because the first one is covered
by the other.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2: None

 scripts/Makefile.lib | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index e36427a..9c20690 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -415,7 +415,6 @@ cmd_xzmisc = (cat $(filter-out FORCE,$^) | \
 # Default sed regexp - multiline due to syntax constraints
 define sed-offsets
 	"/^->/{s:->#\(.*\):/* \1 */:; \
-	s:^->\([^ ]*\) [\$$#]*\([-0-9]*\) \(.*\):#define \1 \2 /* \3 */:; \
 	s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
 	s:->::; p;}"
 endef
-- 
2.7.4

