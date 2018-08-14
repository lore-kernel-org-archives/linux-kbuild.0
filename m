Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:52898 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbeHNXjU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Aug 2018 19:39:20 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] modpost: check strdup() return value
Message-ID: <adc5b6e4-28c1-7fe2-b7b1-c6b1cd39f8ed@infradead.org>
Date: Tue, 14 Aug 2018 13:50:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Yuexing Wang <wangyxlandq@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

From: Randy Dunlap <rdunlap@infradead.org>

Fix missing error check for function strdup() in scripts/mod/modpost.c.

Fixes kernel bugzilla #200319:
https://bugzilla.kernel.org/show_bug.cgi?id=200319

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Yuexing Wang <wangyxlandq@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
---
 scripts/mod/modpost.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20180814.orig/scripts/mod/modpost.c
+++ linux-next-20180814/scripts/mod/modpost.c
@@ -672,7 +672,7 @@ static void handle_modversions(struct mo
 			if (ELF_ST_TYPE(sym->st_info) == STT_SPARC_REGISTER)
 				break;
 			if (symname[0] == '.') {
-				char *munged = strdup(symname);
+				char *munged = NOFAIL(strdup(symname));
 				munged[0] = '_';
 				munged[1] = toupper(munged[1]);
 				symname = munged;
