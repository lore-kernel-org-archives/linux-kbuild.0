Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726950AbgEGSvg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 May 2020 14:51:36 -0400
Date: Thu, 7 May 2020 13:56:01 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH] modpost: Replace zero-length array with flexible-array
Message-ID: <20200507185601.GA14759@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 scripts/basic/fixdep.c |    2 +-
 scripts/mod/modpost.c  |    2 +-
 scripts/mod/modpost.h  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 877ca2c88246..d98540552941 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -160,7 +160,7 @@ struct item {
 	struct item	*next;
 	unsigned int	len;
 	unsigned int	hash;
-	char		name[0];
+	char		name[];
 };
 
 #define HASHSZ 256
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5c3c50c5ec52..4d4b979d76be 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -166,7 +166,7 @@ struct symbol {
 				    *  (only for external modules) **/
 	unsigned int is_static:1;  /* 1 if symbol is not global */
 	enum export  export;       /* Type of export */
-	char name[0];
+	char name[];
 };
 
 static struct symbol *symbolhash[SYMBOL_HASH_SIZE];
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 60dca9b7106b..39f6c29fb568 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -111,7 +111,7 @@ buf_write(struct buffer *buf, const char *s, int len);
 
 struct namespace_list {
 	struct namespace_list *next;
-	char namespace[0];
+	char namespace[];
 };
 
 struct module {
