Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35522 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750752AbcJQGNA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Oct 2016 02:13:00 -0400
Received: by mail-pf0-f195.google.com with SMTP id s8so12079999pfj.2
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Oct 2016 23:13:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] genksyms: handle va_list type
Date: Mon, 17 Oct 2016 17:12:48 +1100
Message-Id: <20161017061248.22722-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

genksyms currently does not handle va_list (treated as syntax
error). Add the __builtin_va_list keyword as a type.

Note: this patch does not regenerate generated parser files.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/genksyms/keywords.gperf | 1 +
 scripts/genksyms/parse.y        | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/scripts/genksyms/keywords.gperf b/scripts/genksyms/keywords.gperf
index a9096d9..bd4c4b2 100644
--- a/scripts/genksyms/keywords.gperf
+++ b/scripts/genksyms/keywords.gperf
@@ -27,6 +27,7 @@ __typeof, TYPEOF_KEYW
 __typeof__, TYPEOF_KEYW
 __volatile, VOLATILE_KEYW
 __volatile__, VOLATILE_KEYW
+__builtin_va_list, VA_LIST_KEYW
 # According to rth, c99 defines _Bool, __restrict, __restrict__, restrict.  KAO
 _Bool, BOOL_KEYW
 _restrict, RESTRICT_KEYW
diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 723ab30..4fba255 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -98,6 +98,7 @@ static void record_compound(struct string_list **keyw,
 %token VOID_KEYW
 %token VOLATILE_KEYW
 %token TYPEOF_KEYW
+%token VA_LIST_KEYW
 
 %token EXPORT_SYMBOL_KEYW
 
@@ -261,6 +262,7 @@ simple_type_specifier:
 	| DOUBLE_KEYW
 	| VOID_KEYW
 	| BOOL_KEYW
+	| VA_LIST_KEYW
 	| TYPE			{ (*$1)->tag = SYM_TYPEDEF; $$ = $1; }
 	;
 
-- 
2.9.3

