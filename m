Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:37687 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933382AbeFVT2K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 15:28:10 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 1/3] kconfig: avoid assert()-triggered segfaults in xfwrite()
Date: Fri, 22 Jun 2018 21:27:37 +0200
Message-Id: <20180622192739.5327-2-dirk@gouders.net>
In-Reply-To: <20180622192739.5327-1-dirk@gouders.net>
References: <20180622192739.5327-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Dirk Gouders <dirk@gouders.net>

xfwrite uses assert() to ensure it does not operate on empty strings.
Two users respect this, expr_print_file_helper() doesn't and causes
segfaults e.g. when the dependency for an empty default string is printed.

Fix this by calling xfwrite with an empty string pattern ("") for
empty strings.

INITRAMFS_SOURCE was one symbol that caused this problem, with this
fix applied the zconfdump() output for this symbol looks as follows:

------------------------------------------------------------------------
config INITRAMFS_SOURCE
  string
  symbol INITRAMFS_SOURCE
  prompt "Initramfs source file(s)" if BLK_DEV_INITRD
  default "" if BLK_DEV_INITRD
  help
This can be either a single cpio archive with a .cpio suffix or a
space-separated list of directories and files for building the
initramfs image.  A cpio archive should contain a filesystem archive
to be used as an initramfs image.  Directories should contain a
filesystem layout to be included in the initramfs image.  Files
should contain entries according to the format described by the
"usr/gen_init_cpio" program in the kernel tree.

When multiple directories and files are specified then the
initramfs image will be the aggregate of all of them.

See <file:Documentation/early-userspace/README> for more details.

If you are not sure, leave it blank.
------------------------------------------------------------------------

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/expr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index e1a39e90841d..e064bf4c2881 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1231,7 +1231,10 @@ void expr_print(struct expr *e,
 
 static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
 {
-	xfwrite(str, strlen(str), 1, data);
+	if (*str != '\0')
+		xfwrite(str, strlen(str), 1, data);
+	else
+		xfwrite("\"\"", 2, 1, data);
 }
 
 void expr_fprint(struct expr *e, FILE *out)
-- 
2.13.6

