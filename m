Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:47217 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754378Ab0HWQFM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Aug 2010 12:05:12 -0400
Received: by fxm13 with SMTP id 13so3053214fxm.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Aug 2010 09:05:11 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kbuild: fix segmentation fault in recursive dependency check
Date: Mon, 23 Aug 2010 12:02:55 -0400
Message-Id: <1282579375-12985-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

 #0  sym_check_deps (sym=0xbb904c90) at scripts/kconfig/symbol.c:950
950                             fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
(gdb) bt
 #0  sym_check_deps (sym=0xbb904c90) at scripts/kconfig/symbol.c:950
 #1  0x0804b4c2 in sym_check_expr_deps (e=0xbb5ec8e0) at scripts/kconfig/symbol.c:1007
 #2  0x0804b549 in sym_check_sym_deps (sym=0xbb904c90) at scripts/kconfig/symbol.c:1032
 #3  0x0804b950 in sym_check_deps (sym=0xbb904c90) at scripts/kconfig/symbol.c:1111
 #4  0x0804b4c2 in sym_check_expr_deps (e=0xbb5e99a0) at scripts/kconfig/symbol.c:1007
 #5  0x0804b50f in sym_check_sym_deps (sym=0xbb904d30) at scripts/kconfig/symbol.c:1024
 #6  0x0804b950 in sym_check_deps (sym=0xbb904d30) at scripts/kconfig/symbol.c:1111
 #7  0x0804b4c2 in sym_check_expr_deps (e=0xbb5f1840) at scripts/kconfig/symbol.c:1007
 #8  0x0804b4a8 in sym_check_expr_deps (e=0xbb5f1830) at scripts/kconfig/symbol.c:994
 #9  0x0804b549 in sym_check_sym_deps (sym=0xbb970240) at scripts/kconfig/symbol.c:1032
 #10 0x0804b950 in sym_check_deps (sym=0xbb970240) at scripts/kconfig/symbol.c:1111
 #11 0x08052e37 in conf_parse (name=0x804a09a "\203Ä\020¡\004z\005\b\205À\017\205É") at scripts/kconfig/zconf.tab.c:2244
 #12 0x0804a09a in main (ac=3, av=0xbfbfe004) at scripts/kconfig/conf.c:505

In this case, `stack->prop' is NULL, but it may also end-up being NULL at the
end of the loop just before. Places the check before using `prop' to catch both
cases.

This fix `scripts/kconfig/conf' segmentation fault on SH as of v2.6.36-rc2 and
allow to fix the underlying issue.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/symbol.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index e95718f..0968f15 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -946,6 +946,13 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 					break;
 			}
 		}
+
+		if (!prop) {
+			fprintf(stderr,
+			    "unexpected recursive dependency error\n");
+			return;
+		}
+
 		if (stack->sym == last_sym)
 			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
 				prop->file->name, prop->lineno);
-- 
1.7.2.30.gc37d7.dirty

