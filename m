Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:43904 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbeJXMaa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Oct 2018 08:30:30 -0400
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v3 2/5] kbuild: Removes unnecessary shadowed local variable.
Date: Wed, 24 Oct 2018 01:03:51 -0300
Message-Id: <20181024040354.24879-3-leobras.c@gmail.com>
In-Reply-To: <20181024040354.24879-1-leobras.c@gmail.com>
References: <20181024040354.24879-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Leonardo Bras <leobras.c@gmail.com>, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Removes an unnecessary shadowed local variable (start).
It was used only once, with the same value it was started before
the if block.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
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
