Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19709 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728508AbgEXPnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:24 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 13/29] modpost: load KBUILD_EXTRA_SYMBOLS files in order
Date: Mon, 25 May 2020 00:42:19 +0900
Message-Id: <20200524154235.380482-14-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Currently, modpost reads extra symbol dump files in the reverse order.
If '-e foo -e bar' is given, modpost reads bar, foo, in this order.

This is probably not a big deal, but there is no good reason to reverse
the order. Read files in the given order.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 33cdb78a4ba1..2f5fab40d859 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2569,8 +2569,8 @@ int main(int argc, char **argv)
 	int opt;
 	int err;
 	int n;
-	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
+	struct ext_sym_list **extsym_iter = &extsym_start;
 
 	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
@@ -2580,11 +2580,9 @@ int main(int argc, char **argv)
 			break;
 		case 'e':
 			external_module = 1;
-			extsym_iter =
-			   NOFAIL(malloc(sizeof(*extsym_iter)));
-			extsym_iter->next = extsym_start;
-			extsym_iter->file = optarg;
-			extsym_start = extsym_iter;
+			*extsym_iter = NOFAIL(calloc(1, sizeof(**extsym_iter)));
+			(*extsym_iter)->file = optarg;
+			extsym_iter = &(*extsym_iter)->next;
 			break;
 		case 'm':
 			modversions = 1;
@@ -2624,10 +2622,12 @@ int main(int argc, char **argv)
 	if (kernel_read)
 		read_dump(kernel_read, 1);
 	while (extsym_start) {
+		struct ext_sym_list *tmp;
+
 		read_dump(extsym_start->file, 0);
-		extsym_iter = extsym_start->next;
+		tmp = extsym_start->next;
 		free(extsym_start);
-		extsym_start = extsym_iter;
+		extsym_start = tmp;
 	}
 
 	while (optind < argc)
-- 
2.25.1
