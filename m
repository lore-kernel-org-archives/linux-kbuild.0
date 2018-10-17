Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37533 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbeJQIBd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 04:01:33 -0400
Date: Tue, 16 Oct 2018 21:08:34 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH 2/4] Renames variable to fix shadow warning.
Message-ID: <20181017000834.GA21330@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Renames the char variable to avoid shadowing a variable previously
declared on this function.

Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
---
 arch/x86/entry/vdso/vdso2c.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.h
index fa847a620f40..9466998d0f28 100644
--- a/arch/x86/entry/vdso/vdso2c.h
+++ b/arch/x86/entry/vdso/vdso2c.h
@@ -93,11 +93,11 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 		int k;
 		ELF(Sym) *sym = raw_addr + GET_LE(&symtab_hdr->sh_offset) +
 			GET_LE(&symtab_hdr->sh_entsize) * i;
-		const char *name = raw_addr + GET_LE(&strtab_hdr->sh_offset) +
+		const char *name2 = raw_addr + GET_LE(&strtab_hdr->sh_offset) +
 			GET_LE(&sym->st_name);
 
 		for (k = 0; k < NSYMS; k++) {
-			if (!strcmp(name, required_syms[k].name)) {
+			if (!strcmp(name2, required_syms[k].name)) {
 				if (syms[k]) {
 					fail("duplicate symbol %s\n",
 					     required_syms[k].name);
-- 
2.19.1
