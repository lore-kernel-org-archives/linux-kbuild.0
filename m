Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from szxga01-in.huawei.com ([58.251.152.64]:27707 "EHLO
	szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752617AbbCGD5d (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Mar 2015 22:57:33 -0500
From: Sheng Yong <shengyong1@huawei.com>
Subject: [PATCH V2] genksyms: fix segmentation fault if `name' is NULL
Date: Sat, 7 Mar 2015 04:08:45 +0000
Message-ID: <1425701325-165693-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

For case where redefines typedef in both .h and .c files, the parser
will get a `name' with value NULL, which leads to segmentation fault
when generating crc32 value in __add_symbol().

if CONFIG_MODVERSIONS is selected, and a kernel module looks like:
==================
/* foo.c */

typedef int (*foo)(int);

int test(void) { return 0; }
EXPORT_SYMBOL(test);

static int __init foo_init(void) { return 0; }
static void __exit foo_exit(void) { return; }
module_init(foo_init);
module_exit(foo_exit);

/* foo.h */
typedef int (*foo)(int);
==================
When compiling, we could get a segmentation fault. We can also reproduce
this error by compiling a userspace program like the following:
==================
/* foo.c */
typedef int (*foo)(int);
int main() { return 0; }

/* foo.h */
typedef int (*foo)(int);

$ $ gcc -E -D__GENKSYMS__ foo.c | ./scripts/genksyms/genksyms
Segmentation fault
==================

So before generating crc32 value, check whether `name' is NULL. If so,
report the location and error message.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 scripts/genksyms/genksyms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 88632df..bedf3ee 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -238,6 +238,12 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 			return NULL;
 	}
 
+	if (!name) {
+		print_location();
+		fprintf(stderr, "Unexpected symbol with NULL name\n");
+		return NULL;
+	}
+
 	h = crc32(name) % HASH_BUCKETS;
 	for (sym = symtab[h]; sym; sym = sym->hash_next) {
 		if (map_to_ns(sym->type) == map_to_ns(type) &&
-- 
1.8.3.4

