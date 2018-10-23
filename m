Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36218 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbeJWJbj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Oct 2018 05:31:39 -0400
Date: Mon, 22 Oct 2018 22:10:33 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH v2 2/5] kbuild: Removes unnecessary shadowed local variable.
Message-ID: <20181023011033.GA6580@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Removes an unnecessary shadowed local variable (start).
It was used only once, with the same value it was started before
the if block.

Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
---
 scripts/asn1_compiler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
index c146020fc783..1b28787028d3 100644
--- a/scripts/asn1_compiler.c
+++ b/scripts/asn1_compiler.c
@@ -413,7 +413,7 @@ static void tokenise(char *buffer, char *end)
 
 			/* Handle string tokens */
 			if (isalpha(*p)) {
-				const char **dir, *start = p;
+				const char **dir;
 
 				/* Can be a directive, type name or element
 				 * name.  Find the end of the name.
-- 
2.19.1
