Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:47940 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752826AbcLHLzN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 06:55:13 -0500
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 1/2] kbuild: keep __mcount_loc table through dead code elimination
Date: Thu, 8 Dec 2016 12:55:06 +0100
Message-ID: <1481198107-17019-2-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1481198107-17019-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1481198107-17019-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, Michal Marek <mmarek@suse.com>
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kbuild@vger.kernel.org

When CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is enabled we must ensure
__mcount_loc is preserved, as otherwise there are no valid entries for
ftrace to work with.

Fixes: 4b89b7f7aad5 ('kbuild: keep data tables through dead code elimination')

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 0968d13..f492aa4 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -89,7 +89,7 @@
 #ifdef CONFIG_FTRACE_MCOUNT_RECORD
 #define MCOUNT_REC()	. = ALIGN(8);				\
 			VMLINUX_SYMBOL(__start_mcount_loc) = .; \
-			*(__mcount_loc)				\
+			KEEP(*(__mcount_loc))			\
 			VMLINUX_SYMBOL(__stop_mcount_loc) = .;
 #else
 #define MCOUNT_REC()
-- 
2.7.4

