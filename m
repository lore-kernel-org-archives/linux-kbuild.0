Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:33425 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbfIFPLZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 11:11:25 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] mostpost: don't warn about symbols from another file
Date: Fri,  6 Sep 2019 17:10:48 +0200
Message-Id: <20190906151059.1077708-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Emil Velikov <emil.l.velikov@gmail.com>, Denis Efremov <efremov@linux.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sam Ravnborg <sam@ravnborg.org>, WANG Chao <chao.wang@ucloud.cn>, Sami Tolvanen <samitolvanen@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On architectures such as ARM that have a list of symbols exported from
assembler in a separate C file, we get a lot of new warnings:

WARNING: "__ashrdi3" [vmlinux] is a static (unknown)
WARNING: "__lshrdi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_llsr" [vmlinux] is a static (unknown)
WARNING: "__aeabi_lasr" [vmlinux] is a static (unknown)
WARNING: "__aeabi_uidivmod" [vmlinux] is a static (unknown)
WARNING: "__udivsi3" [vmlinux] is a static (unknown)
WARNING: "_change_bit" [vmlinux] is a static (unknown)
WARNING: "__aeabi_idiv" [vmlinux] is a static (unknown)
WARNING: "__umodsi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_uidiv" [vmlinux] is a static (unknown)
WARNING: "__aeabi_idivmod" [vmlinux] is a static (unknown)
WARNING: "__muldi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_ulcmp" [vmlinux] is a static (unknown)
WARNING: "__raw_writesb" [vmlinux] is a static (unknown)
WARNING: "__raw_readsb" [vmlinux] is a static (unknown)
...

This is not helpful, as these are clearly not static symbols
at all. Suppress the warning in a case like this.

Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 76c221dd9b2b..4265dd924933 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2543,7 +2543,7 @@ int main(int argc, char **argv)
 		struct symbol *s = symbolhash[n];
 
 		while (s) {
-			if (s->is_static)
+			if (s->is_static && s->export != export_unknown)
 				warn("\"%s\" [%s] is a static %s\n",
 				     s->name, s->module->name,
 				     export_str(s->export));
-- 
2.20.0
