Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:59502 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbeHOWYM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 18:24:12 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] scripts: modpost: check memory allocation results
Message-ID: <eafb5a94-f140-27f2-bc91-c6b95a18c97d@infradead.org>
Date: Wed, 15 Aug 2018 12:30:38 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Yuexing Wang <wangyxlandq@gmail.com>

From: Randy Dunlap <rdunlap@infradead.org>

Fix missing error check for memory allocation functions in
scripts/mod/modpost.c.

Fixes kernel bugzilla #200319:
https://bugzilla.kernel.org/show_bug.cgi?id=200319

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Yuexing Wang <wangyxlandq@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
---
v2: add checks in more places

 scripts/mod/modpost.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20180814.orig/scripts/mod/modpost.c
+++ linux-next-20180814/scripts/mod/modpost.c
@@ -672,7 +672,7 @@ static void handle_modversions(struct mo
 			if (ELF_ST_TYPE(sym->st_info) == STT_SPARC_REGISTER)
 				break;
 			if (symname[0] == '.') {
-				char *munged = strdup(symname);
+				char *munged = NOFAIL(strdup(symname));
 				munged[0] = '_';
 				munged[1] = toupper(munged[1]);
 				symname = munged;
@@ -1318,7 +1318,7 @@ static Elf_Sym *find_elf_symbol2(struct
 static char *sec2annotation(const char *s)
 {
 	if (match(s, init_exit_sections)) {
-		char *p = malloc(20);
+		char *p = NOFAIL(malloc(20));
 		char *r = p;
 
 		*p++ = '_';
@@ -1338,7 +1338,7 @@ static char *sec2annotation(const char *
 			strcat(p, " ");
 		return r;
 	} else {
-		return strdup("");
+		return NOFAIL(strdup(""));
 	}
 }
 
@@ -2036,7 +2036,7 @@ void buf_write(struct buffer *buf, const
 {
 	if (buf->size - buf->pos < len) {
 		buf->size += len + SZ;
-		buf->p = realloc(buf->p, buf->size);
+		buf->p = NOFAIL(realloc(buf->p, buf->size));
 	}
 	strncpy(buf->p + buf->pos, s, len);
 	buf->pos += len;
