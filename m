Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57121 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757698AbdACOP2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jan 2017 09:15:28 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 2/3] genksyms: Fix segfault with invalid declarations
Date: Tue,  3 Jan 2017 15:14:55 +0100
Message-Id: <20170103141456.12743-2-mmarek@suse.com>
In-Reply-To: <20170103141456.12743-1-mmarek@suse.com>
References: <20170103141456.12743-1-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>

Do not try to recover too early and segfault when parsing invalid
declarations such as

echo 'int (int);' | scripts/genksyms/genksyms
echo 'int a, (int);' | scripts/genksyms/genksyms
echo 'extern void *__inline_memcpy((void *), (const void *), (__kernel_size_t));' | scripts/genksyms/genksyms

The last one was a real-life bug with
include/asm-generic/asm-prototypes.h on x86_64.

Reported-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Michal Marek <mmarek@suse.com>
---
 scripts/genksyms/parse.y | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 4fba255e54ae..00a6d7e54971 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -322,8 +322,6 @@ direct_declarator:
 		{ $$ = $2; }
 	| '(' declarator ')'
 		{ $$ = $3; }
-	| '(' error ')'
-		{ $$ = $3; }
 	;
 
 /* Nested declarators differ from regular declarators in that they do
-- 
2.10.2

