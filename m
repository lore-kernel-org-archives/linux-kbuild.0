Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:58364 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389205AbfKGOdD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 09:33:03 -0500
From: shile.zhang@linux.alibaba.com
Subject: [RFC PATCH 3/4] x86/unwind/orc: Skip sorting if BUILDTIME_ORCTABLE_SORT is configured
Date: Thu,  7 Nov 2019 22:32:04 +0800
Message-Id: <20191107143205.206606-4-shile.zhang@linux.alibaba.com>
In-Reply-To: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Shile Zhang <shile.zhang@linux.alibaba.com>

From: Shile Zhang <shile.zhang@linux.alibaba.com>

The orc_unwind and orc_unwind_ip tables are sorted at build time if
BUILDTIME_ORCTABLE_SORT is configured, skip sort at boot time.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 arch/x86/kernel/unwind_orc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 332ae6530fa8..2c2fa9ef116e 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -273,9 +273,11 @@ void __init unwind_init(void)
 		return;
 	}
 
+#ifndef CONFIG_BUILDTIME_ORCTABLE_SORT
 	/* Sort the .orc_unwind and .orc_unwind_ip tables: */
 	sort(__start_orc_unwind_ip, num_entries, sizeof(int), orc_sort_cmp,
 	     orc_sort_swap);
+#endif
 
 	/* Initialize the fast lookup table: */
 	lookup_num_blocks = orc_lookup_end - orc_lookup;
-- 
2.24.0.rc2
