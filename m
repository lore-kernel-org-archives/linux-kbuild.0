Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:49077 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbfJCKaB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 06:30:01 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/4] modpost: do not set ->preloaded for symbols from Module.symvers
Date: Thu,  3 Oct 2019 19:29:15 +0900
Message-Id: <20191003102915.28301-4-yamada.masahiro@socionext.com>
In-Reply-To: <20191003102915.28301-1-yamada.masahiro@socionext.com>
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Now that there is no overwrap between symbols from ELF files and
ones from Module.symvers.

So, the 'exported twice' warning should be reported irrespective
of where the symbol in question came from. Only the exceptional case
is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
typically occurs for EXPORT_SYMBOL in .S files.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5234555cf550..6ca38d10efc5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2457,7 +2457,6 @@ static void read_dump(const char *fname, unsigned int kernel)
 		s = sym_add_exported(symname, namespace, mod,
 				     export_no(export));
 		s->kernel    = kernel;
-		s->preloaded = 1;
 		s->is_static = 0;
 		sym_update_crc(symname, mod, crc, export_no(export));
 	}
-- 
2.17.1
