Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15124 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728110AbgERPft (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 May 2020 11:35:49 -0400
Subject: [PATCH] scripts/sorttable: Correctly handle mmap() returning
 MAP_FAILED
From: Greg Kurz <groug@kaod.org>
Date: Mon, 18 May 2020 17:35:42 +0200
Message-ID: <158981614256.106494.12226121528668381542.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, linux-kbuild@vger.kernel.org, mingo@kernel.org

The caller of mmap_file() assumes it returns a valid address or NULL
on error. If mmap() fails for some reason, MAP_FAILED is returned
instead and sorttable crashes later when trying to dereference the
pointer:

Program received signal SIGSEGV, Segmentation fault.
0x0000000000402b25 in do_file (fname=0x7fffffffe5e2 "vmlinux",
    addr=0xffffffffffffffff) at scripts/sorttable.c:264
264             switch (ehdr->e_ident[EI_DATA]) {
(gdb) p ehdr
$1 = (Elf32_Ehdr *) 0xffffffffffffffff

mmap() can only return NULL if the user explicitely asks for it with
MAP_FIXED, which isn't the case here. So, rather than changing the
semantics of mmap_file() and having the caller to cope with an
extra sentinel, return NULL when mmap() fails.

This bug exists since the addition of the sortextable binary (previous
name of sorttable). That code was borrowed from scripts/recordmount.c
which had the same issue. It got fixed in a similar manner by commit
3f1df12019f3 ("recordmcount: Rewrite error/success handling").

Cc: stable@vger.kernel.org # v3.5
Fixes: a79f248b9b30 ("scripts: Add sortextable to sort the kernel's exception table.")
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 scripts/sorttable.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index ec6b5e81eba1..5ad7a9bbff42 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -91,6 +91,7 @@ static void *mmap_file(char const *fname, size_t *size)
 	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
 	if (addr == MAP_FAILED) {
 		fprintf(stderr, "Could not mmap file: %s\n", fname);
+		addr = NULL;
 		goto out;
 	}
 
