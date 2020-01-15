Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33105 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730090AbgAOLxD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jan 2020 06:53:03 -0500
Received: by mail-wm1-f65.google.com with SMTP id d139so4587288wmd.0
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Jan 2020 03:53:02 -0800 (PST)
From: Ilie Halip <ilie.halip@gmail.com>
Subject: [RFC PATCH] lib: move memcat_p.o to obj-y
Date: Wed, 15 Jan 2020 13:52:49 +0200
Message-Id: <20200115115249.27774-1-ilie.halip@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, clang-built-linux@googlegroups.com, Ilie Halip <ilie.halip@gmail.com>

The semantics of `--undefined` differ between ld.bfd and ld.lld:
    $ echo | gcc -x c -c - -o a.o
    $ echo "EXTERN(test)" > a.lds
    $ ld.bfd a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
    0000000000000000         *UND*      0000000000000000 test
    $ ld.lld a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
    $

When building with CONFIG_STM=m, there are no in-kernel users of memcat_p()
and ld.lld discards this symbol because it's linked in via --no-whole-archive.
It's marked as undefined by a linker script but ld.lld discards it anyway (as
seen in the above snippet).

Work around the ld.lld behavior by moving the object file to obj-y.

Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/515
---
 lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index 93217d44237f..eac343b81f77 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -30,7 +30,7 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
 	 flex_proportions.o ratelimit.o show_mem.o \
 	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
 	 earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
-	 nmi_backtrace.o nodemask.o win_minmax.o memcat_p.o
+	 nmi_backtrace.o nodemask.o win_minmax.o
 
 lib-$(CONFIG_PRINTK) += dump_stack.o
 lib-$(CONFIG_MMU) += ioremap.o
@@ -45,7 +45,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 bsearch.o find_bit.o llist.o memweight.o kfifo.o \
 	 percpu-refcount.o rhashtable.o \
 	 once.o refcount.o usercopy.o errseq.o bucket_locks.o \
-	 generic-radix-tree.o
+	 generic-radix-tree.o memcat_p.o
 obj-$(CONFIG_STRING_SELFTEST) += test_string.o
 obj-y += string_helpers.o
 obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o

base-commit: ee02f9544ebd8d38900dfe955710897b99483686
-- 
2.17.1
