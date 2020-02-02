Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:58679 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgBBFKI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Feb 2020 00:10:08 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] kallsyms: fix type of kallsyms_token_table[]
Date: Sun,  2 Feb 2020 14:09:22 +0900
Message-Id: <20200202050922.12402-3-masahiroy@kernel.org>
In-Reply-To: <20200202050922.12402-1-masahiroy@kernel.org>
References: <20200202050922.12402-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org

kallsyms_token_table[] only contains ASCII characters. It should be
char instead of u8.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/kallsyms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 136ce049c4ad..53f84f685841 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -44,7 +44,7 @@ __attribute__((weak, section(".rodata")));
 extern const unsigned long kallsyms_relative_base
 __attribute__((weak, section(".rodata")));
 
-extern const u8 kallsyms_token_table[] __weak;
+extern const char kallsyms_token_table[] __weak;
 extern const u16 kallsyms_token_index[] __weak;
 
 extern const unsigned int kallsyms_markers[] __weak;
@@ -58,7 +58,8 @@ static unsigned int kallsyms_expand_symbol(unsigned int off,
 					   char *result, size_t maxlen)
 {
 	int len, skipped_first = 0;
-	const u8 *tptr, *data;
+	const char *tptr;
+	const u8 *data;
 
 	/* Get the compressed symbol length from the first symbol byte. */
 	data = &kallsyms_names[off];
-- 
2.17.1
