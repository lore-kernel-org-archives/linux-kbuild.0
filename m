Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay.parallels.com ([195.214.232.42]:44547 "EHLO
	relay.parallels.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758101AbbLCPuH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Dec 2015 10:50:07 -0500
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: [PATCH v4 1/3] kernel: printk: specify alignment for struct printk_log
Date: Thu, 3 Dec 2015 18:50:05 +0300
Message-ID: <1449157807-20298-2-git-send-email-aryabinin@virtuozzo.com>
In-Reply-To: <1449157807-20298-1-git-send-email-aryabinin@virtuozzo.com>
References: <1449157807-20298-1-git-send-email-aryabinin@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Kostya Serebryany <kcc@google.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

On architectures that have support for efficient unaligned access
struct printk_log has 4-byte alignment.
Specify alignment attribute in type declaration.

The whole point of this patch is to fix deadlock which happening
when UBSAN detects unaligned access in printk() thus UBSAN recursively
calls printk() with logbuf_lock held by top printk() call.

Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
---
 kernel/printk/printk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0c9f0250..8712409 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -233,7 +233,11 @@ struct printk_log {
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
@@ -274,11 +278,7 @@ static u32 clear_idx;
 #define LOG_FACILITY(v)		((v) >> 3 & 0xff)
 
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
2.4.10

