Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38321 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 16/29] modpost: rename ext_sym_list to dump_list
Date: Sun, 17 May 2020 18:48:46 +0900
Message-Id: <20200517094859.2376211-17-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The -i option is used to include Modules.symver as well as files from
$(KBUILD_EXTRA_SYMBOLS).

Make the struct and variable names more generic.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d3141b217b57..a5bac158d344 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2539,8 +2539,8 @@ static void write_namespace_deps_files(const char *fname)
 	free(ns_deps_buf.p);
 }
 
-struct ext_sym_list {
-	struct ext_sym_list *next;
+struct dump_list {
+	struct dump_list *next;
 	const char *file;
 };
 
@@ -2553,16 +2553,17 @@ int main(int argc, char **argv)
 	int opt;
 	int err;
 	int n;
-	struct ext_sym_list *extsym_start = NULL;
-	struct ext_sym_list **extsym_iter = &extsym_start;
+	struct dump_list *dump_read_start = NULL;
+	struct dump_list **dump_read_iter = &dump_read_start;
 
 	while ((opt = getopt(argc, argv, "i:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
 		case 'i':
 			external_module = 1;
-			*extsym_iter = NOFAIL(calloc(1, sizeof(**extsym_iter)));
-			(*extsym_iter)->file = optarg;
-			extsym_iter = &(*extsym_iter)->next;
+			*dump_read_iter =
+				NOFAIL(calloc(1, sizeof(**dump_read_iter)));
+			(*dump_read_iter)->file = optarg;
+			dump_read_iter = &(*dump_read_iter)->next;
 			break;
 		case 'm':
 			modversions = 1;
@@ -2599,13 +2600,13 @@ int main(int argc, char **argv)
 		}
 	}
 
-	while (extsym_start) {
-		struct ext_sym_list *tmp;
+	while (dump_read_start) {
+		struct dump_list *tmp;
 
-		read_dump(extsym_start->file);
-		tmp = extsym_start->next;
-		free(extsym_start);
-		extsym_start = tmp;
+		read_dump(dump_read_start->file);
+		tmp = dump_read_start->next;
+		free(dump_read_start);
+		dump_read_start = tmp;
 	}
 
 	while (optind < argc)
-- 
2.25.1
