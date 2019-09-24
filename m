Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:39949 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbfIXMIU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Sep 2019 08:08:20 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] modpost: fix static EXPORT_SYMBOL warnings for UML build
Date: Tue, 24 Sep 2019 21:07:40 +0900
Message-Id: <20190924120740.12425-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Denis Efremov <efremov@linux.com>, Johannes Berg <johannes@sipsolutions.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Johannes Berg reports lots of modpost warnings on ARCH=um builds:

WARNING: "rename" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "lseek" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "ftruncate64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "getuid" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "lseek64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "unlink" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "pwrite64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "close" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "opendir" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "pread64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "syscall" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "readdir" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "readdir64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "futimes" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__lxstat" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "write" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "closedir" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__xstat" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "fsync" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__lxstat64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__fxstat64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "telldir" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "printf" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "readlink" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__sprintf_chk" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "link" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "rmdir" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "fdatasync" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "truncate" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "statfs" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__errno_location" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__xmknod" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "open64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "truncate64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "open" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "read" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "chown" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "chmod" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "utime" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "fchmod" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "seekdir" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "ioctl" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "dup2" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "statfs64" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "utimes" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "mkdir" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "fchown" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__guard" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "symlink" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "access" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__stack_smash_handler" [vmlinux] is a static EXPORT_SYMBOL

When you run "make", the modpost is run twice; before linking vmlinux,
and before building modules. All the warnings above are from the second
modpost.

The offending symbols are defined not in vmlinux, but in the C library.
The first modpost is run against the relocatable vmlinux.o, and those
warnings are nicely suppressed because the SH_UNDEF entries from the
symbol table clear the ->is_static flag.

The second modpost is run against the executable vmlinux (+ modules),
where those symbols have been resolved, but the definitions do not
exist.

This commit fixes it in a straight forward way. Suppress the static
EXPORT_SYMBOL warnings from "vmlinux".

We see the same warnings twice anyway. For example, ARCH=arm64 defconfig
shows the following warning twice:

WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_GPL

So, it is reasonable to suppress the second one.

Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
Reported-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3961941e8e7a..442d5e2ad688 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2652,15 +2652,20 @@ int main(int argc, char **argv)
 		fatal("modpost: Section mismatches detected.\n"
 		      "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
 	for (n = 0; n < SYMBOL_HASH_SIZE; n++) {
-		struct symbol *s = symbolhash[n];
+		struct symbol *s;
+
+		for (s = symbolhash[n]; s; s = s->next) {
+			/*
+			 * Do not check "vmlinux". This avoids the same warnings
+			 * shown twice, and false-positives for ARCH=um.
+			 */
+			if (is_vmlinux(s->module->name) && !s->module->is_dot_o)
+				continue;
 
-		while (s) {
 			if (s->is_static)
 				warn("\"%s\" [%s] is a static %s\n",
 				     s->name, s->module->name,
 				     export_str(s->export));
-
-			s = s->next;
 		}
 	}
 
-- 
2.17.1
