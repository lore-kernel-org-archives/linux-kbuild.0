Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:52919 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgAGVcE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jan 2020 16:32:04 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] x86: orc: fix unused-function warning
Date: Tue,  7 Jan 2020 22:31:20 +0100
Message-Id: <20200107213127.209139-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Shile Zhang <shile.zhang@linux.alibaba.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org

The orc unwinder contains a new warning:

arch/x86/kernel/unwind_orc.c:210:12: error: 'orc_sort_cmp' defined but not used [-Werror=unused-function]
 static int orc_sort_cmp(const void *_a, const void *_b)
            ^~~~~~~~~~~~
arch/x86/kernel/unwind_orc.c:190:13: error: 'orc_sort_swap' defined but not used [-Werror=unused-function]
 static void orc_sort_swap(void *_a, void *_b, int size)
             ^~~~~~~~~~~~~

Move the #ifdef to hide the now unused functions.

Fixes: f14bf6a350df ("x86/unwind/orc: Remove boot-time ORC unwind tables sorting")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/kernel/unwind_orc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index abdf8911a1fb..538152cca46b 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -187,6 +187,7 @@ static struct orc_entry *orc_find(unsigned long ip)
 	return orc_ftrace_find(ip);
 }
 
+#ifdef CONFIG_MODULES
 static void orc_sort_swap(void *_a, void *_b, int size)
 {
 	struct orc_entry *orc_a, *orc_b;
@@ -229,7 +230,6 @@ static int orc_sort_cmp(const void *_a, const void *_b)
 	return orc_a->sp_reg == ORC_REG_UNDEFINED && !orc_a->end ? -1 : 1;
 }
 
-#ifdef CONFIG_MODULES
 void unwind_module_init(struct module *mod, void *_orc_ip, size_t orc_ip_size,
 			void *_orc, size_t orc_size)
 {
-- 
2.20.0
