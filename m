Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19694 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 29/29] modpost: change elf_info->size to size_t
Date: Mon, 25 May 2020 00:42:35 +0900
Message-Id: <20200524154235.380482-30-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Align with the mmap / munmap APIs.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 9 ++++-----
 scripts/mod/modpost.h | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 527f71b662b0..a0e44991a525 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -439,7 +439,7 @@ static void sym_set_crc(const char *name, unsigned int crc)
 	s->crc_valid = 1;
 }
 
-static void *grab_file(const char *filename, unsigned long *size)
+static void *grab_file(const char *filename, size_t *size)
 {
 	struct stat st;
 	void *map = MAP_FAILED;
@@ -461,7 +461,7 @@ static void *grab_file(const char *filename, unsigned long *size)
 	return map;
 }
 
-static void release_file(void *file, unsigned long size)
+static void release_file(void *file, size_t size)
 {
 	munmap(file, size);
 }
@@ -517,9 +517,8 @@ static int parse_elf(struct elf_info *info, const char *filename)
 
 	/* Check if file offset is correct */
 	if (hdr->e_shoff > info->size) {
-		fatal("section header offset=%lu in file '%s' is bigger than "
-		      "filesize=%lu\n", (unsigned long)hdr->e_shoff,
-		      filename, info->size);
+		fatal("section header offset=%lu in file '%s' is bigger than filesize=%zu\n",
+		      (unsigned long)hdr->e_shoff, filename, info->size);
 		return 0;
 	}
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 1df87d204c9a..efb74dba19e2 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -133,7 +133,7 @@ struct module {
 };
 
 struct elf_info {
-	unsigned long size;
+	size_t size;
 	Elf_Ehdr     *hdr;
 	Elf_Shdr     *sechdrs;
 	Elf_Sym      *symtab_start;
-- 
2.25.1
