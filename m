Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f201.google.com ([209.85.167.201]:46530 "EHLO
        mail-oi1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfCADMc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Feb 2019 22:12:32 -0500
Received: by mail-oi1-f201.google.com with SMTP id v138so9984835oie.13
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Feb 2019 19:12:31 -0800 (PST)
Date: Fri,  1 Mar 2019 04:12:01 +0100
In-Reply-To: <20190301031201.7416-1-jannh@google.com>
Message-Id: <20190301031201.7416-2-jannh@google.com>
Mime-Version: 1.0
References: <20190301031201.7416-1-jannh@google.com>
Subject: [PATCH 2/2] x86/unwind: add hardcoded ORC entry for NULL
From: Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, jannh@google.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, syzbot <syzbot+ca95b2b7aef9e7cbd6ab@syzkaller.appspotmail.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

When the ORC unwinder is invoked for an oops caused by IP==0,
it currently has no idea what to do because there is no debug information
for the stack frame of NULL.

But if RIP is NULL, it is very likely that the last successfully executed
instruction was an indirect CALL/JMP, and it is possible to unwind out in
the same way as for the first instruction of a normal function. Hardcode
a corresponding ORC entry.


With an artificially-added NULL call in prctl_set_seccomp(), before this
patch, the trace is:

Call Trace:
 ? __x64_sys_prctl+0x402/0x680
 ? __ia32_sys_prctl+0x6e0/0x6e0
 ? __do_page_fault+0x457/0x620
 ? do_syscall_64+0x6d/0x160
 ? entry_SYSCALL_64_after_hwframe+0x44/0xa9

After this patch, the trace looks like this:

Call Trace:
 __x64_sys_prctl+0x402/0x680
 ? __ia32_sys_prctl+0x6e0/0x6e0
 ? __do_page_fault+0x457/0x620
 do_syscall_64+0x6d/0x160
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

prctl_set_seccomp() still doesn't show up in the trace because for some
reason, tail call optimization is only disabled in builds that use the
frame pointer unwinder.

Signed-off-by: Jann Horn <jannh@google.com>
---
Is there a reason why the top-level Makefile only sets
-fno-optimize-sibling-calls if CONFIG_FRAME_POINTER is set?
I suspect that this is just a historical thing, because reliable
unwinding didn't work without frame pointers until ORC came along.
I'm not quite sure how best to express "don't do tail optimization if
either frame pointers are used or ORC is used" in a Makefile, and
whether we want an indirection through Kconfig for that, so I'm not
doing anything about it in this series.
Can someone send a patch to deal with it properly?


 arch/x86/kernel/unwind_orc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 26038eacf74a..89be1be1790c 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -113,6 +113,20 @@ static struct orc_entry *orc_ftrace_find(unsigned long ip)
 }
 #endif
 
+/*
+ * If we crash with IP==0, the last successfully executed instruction
+ * was probably an indirect function call with a NULL function pointer,
+ * and we don't have unwind information for NULL.
+ * This hardcoded ORC entry for IP==0 allows us to unwind from a NULL function
+ * pointer into its parent and then continue normally from there.
+ */
+static struct orc_entry null_orc_entry = {
+	.sp_offset = sizeof(long),
+	.sp_reg = ORC_REG_SP,
+	.bp_reg = ORC_REG_UNDEFINED,
+	.type = ORC_TYPE_CALL
+};
+
 static struct orc_entry *orc_find(unsigned long ip)
 {
 	static struct orc_entry *orc;
@@ -120,6 +134,9 @@ static struct orc_entry *orc_find(unsigned long ip)
 	if (!orc_init)
 		return NULL;
 
+	if (ip == 0)
+		return &null_orc_entry;
+
 	/* For non-init vmlinux addresses, use the fast lookup table: */
 	if (ip >= LOOKUP_START_IP && ip < LOOKUP_STOP_IP) {
 		unsigned int idx, start, stop;
-- 
2.21.0.352.gf09ad66450-goog
