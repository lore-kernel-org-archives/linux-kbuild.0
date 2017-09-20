Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:27620 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751826AbdITPTd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 11:19:33 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] hexagon: get rid of #include <generated/compile.h>
Date: Thu, 21 Sep 2017 00:17:50 +0900
Message-Id: <1505920670-8290-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-hexagon@vger.kernel.org, Richard Kuo <rkuo@codeaurora.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org

<generated/compile.h> is created (or updated) when Kbuild descends
into the init/ directory.  In parallel building from a pristine
source tree, there is no guarantee <generated/compile.h> exists when
arch/hexagon/kernel/ptrace.c is compiled.

For hexagon architecture, we know UTS_MACHINE is a fixed string
"hexagon", so let's hard-code it, like many architectures do.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/hexagon/kernel/ptrace.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/hexagon/kernel/ptrace.c b/arch/hexagon/kernel/ptrace.c
index ecd75e2..fa76493 100644
--- a/arch/hexagon/kernel/ptrace.c
+++ b/arch/hexagon/kernel/ptrace.c
@@ -18,8 +18,6 @@
  * 02110-1301, USA.
  */
 
-#include <generated/compile.h>
-
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
@@ -180,7 +178,7 @@ static const struct user_regset hexagon_regsets[] = {
 };
 
 static const struct user_regset_view hexagon_user_view = {
-	.name = UTS_MACHINE,
+	.name = "hexagon",
 	.e_machine = ELF_ARCH,
 	.ei_osabi = ELF_OSABI,
 	.regsets = hexagon_regsets,
-- 
2.7.4

