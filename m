Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([193.142.43.55]:47781 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfLMKDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Dec 2019 05:03:54 -0500
Date: Fri, 13 Dec 2019 10:03:37 -0000
From: "tip-bot2 for Shile Zhang" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
Subject: [tip: core/objtool] scripts/sortextable: Remove dead code
In-Reply-To: <20191204004633.88660-4-shile.zhang@linux.alibaba.com>
References: <20191204004633.88660-4-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Message-ID: <157623141795.30329.4389292245949858856.tip-bot2@tip-bot2>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-tip-commits@vger.kernel.org
Cc: Shile Zhang <shile.zhang@linux.alibaba.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>

The following commit has been merged into the core/objtool branch of tip:

Commit-ID:     abe4f92ca8948a3e04c56788354933c326909acb
Gitweb:        https://git.kernel.org/tip/abe4f92ca8948a3e04c56788354933c326909acb
Author:        Shile Zhang <shile.zhang@linux.alibaba.com>
AuthorDate:    Wed, 04 Dec 2019 08:46:29 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 13 Dec 2019 10:47:58 +01:00

scripts/sortextable: Remove dead code

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Link: https://lkml.kernel.org/r/20191204004633.88660-4-shile.zhang@linux.alibaba.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 scripts/sortextable.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/sortextable.h b/scripts/sortextable.h
index b7e407e..a2e3af7 100644
--- a/scripts/sortextable.h
+++ b/scripts/sortextable.h
@@ -201,10 +201,6 @@ static int do_func(Elf_Ehdr *ehdr,
 		_r(&sort_needed_sym->st_value) -
 		_r(&sort_needed_sec->sh_addr);
 
-#if 0
-	printf("sort done marker at %lx\n",
-	       (unsigned long)((char *)sort_done_location - (char *)ehdr));
-#endif
 	/* We sorted it, clear the flag. */
 	w(0, sort_done_location);
 	return 0;
