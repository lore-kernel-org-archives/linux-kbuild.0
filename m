Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50681 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754899AbaKNMvK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Nov 2014 07:51:10 -0500
From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [PATCH v2 1/2] kernel: printk: specify alignment for struct printk_log
Date: Fri, 14 Nov 2014 15:50:45 +0300
Message-id: <1415969446-26356-2-git-send-email-a.ryabinin@samsung.com>
In-reply-to: <1415969446-26356-1-git-send-email-a.ryabinin@samsung.com>
References: <1415969446-26356-1-git-send-email-a.ryabinin@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrey Ryabinin <a.ryabinin@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

On architectures that have support for efficient unaligned access
struct printk_log has 4-byte alignment.
Specify alignment attribute in type declaration.

The whole point of this patch is to fix deadlock which happening
when UBSan detects unaligned access in printk() thus UBSan recursively
calls printk() with logbuf_lock held by top printk() call.

Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
---
 kernel/printk/printk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index ced2b84..39be027 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -223,7 +223,11 @@ struct printk_log {
 	u8 facility;		/* syslog facility */
 	u8 flags:5;		/* internal record flags */
 	u8 level:3;		/* syslog level */
-};
+}
+#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+__packed __aligned(4)
+#endif
+;
 
 /*
  * The logbuf_lock protects kmsg buffer, indices, counters.  This can be taken
@@ -261,11 +265,7 @@ static u32 clear_idx;
 #define LOG_LINE_MAX		(1024 - PREFIX_MAX)
 
 /* record buffer */
-#if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
-#define LOG_ALIGN 4
-#else
 #define LOG_ALIGN __alignof__(struct printk_log)
-#endif
 #define __LOG_BUF_LEN (1 << CONFIG_LOG_BUF_SHIFT)
 static char __log_buf[__LOG_BUF_LEN] __aligned(LOG_ALIGN);
 static char *log_buf = __log_buf;
-- 
2.1.3

