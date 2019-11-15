Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:55303 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725848AbfKOGsK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 01:48:10 -0500
From: Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v3 3/7] scripts/sortextable: Remove dead code
Date: Fri, 15 Nov 2019 14:47:46 +0800
Message-Id: <20191115064750.47888-4-shile.zhang@linux.alibaba.com>
In-Reply-To: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Shile Zhang <shile.zhang@linux.alibaba.com>

Remove the comment out dead code, no functional changes.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 scripts/sortextable.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/sortextable.h b/scripts/sortextable.h
index b7e407e09f59..a2e3af7bf211 100644
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
-- 
2.24.0.rc2
