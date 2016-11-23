Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34482 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933872AbcKWQmL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 11:42:11 -0500
Received: by mail-pg0-f65.google.com with SMTP id e9so1427092pgc.1
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2016 08:42:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 3/7] kbuild/genksyms: handle va_list type
Date: Thu, 24 Nov 2016 03:41:39 +1100
Message-Id: <20161123164143.16839-4-npiggin@gmail.com>
In-Reply-To: <20161123164143.16839-1-npiggin@gmail.com>
References: <20161123164143.16839-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

genksyms currently does not handle va_list. Add the __builtin_va_list
keyword as a type. This reduces the amount of syntax errors thrown,
but so far no export symbol has a type with a va_list argument, so
there is currently no bug in the end result.

Note: this patch does not regenerate shipped parser files.

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
2.10.2

