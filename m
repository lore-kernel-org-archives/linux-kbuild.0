Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prv1-mh.provo.novell.com ([137.65.248.33]:58974 "EHLO
        prv1-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbeICQ33 (ORCPT
        <rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
        Mon, 3 Sep 2018 12:29:29 -0400
Message-Id: <5B8D247E02000078001E48EC@prv1-mh.provo.novell.com>
Date: Mon, 03 Sep 2018 06:09:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2] kallsyms: reduce size a little on 64-bit
References: <5B8563A702000078001E2A82@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>

Both kallsyms_num_syms and kallsyms_markers[] don't really need to use
unsigned long as their (base) types; unsigned int fully suffices.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop unrelated hunk.
---
 kernel/kallsyms.c  |    4 ++--
 scripts/kallsyms.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--- 4.19-rc2/kernel/kallsyms.c
+++ 4.19-rc2-kallsyms-reduce-size/kernel/kallsyms.c
@@ -37,7 +37,7 @@ extern const u8 kallsyms_names[] __weak;
  * Tell the compiler that the count isn't in the small data section if the arch
  * has one (eg: FRV).
  */
-extern const unsigned long kallsyms_num_syms
+extern const unsigned int kallsyms_num_syms
 __attribute__((weak, section(".rodata")));
 
 extern const unsigned long kallsyms_relative_base
@@ -46,7 +46,7 @@ __attribute__((weak, section(".rodata"))
 extern const u8 kallsyms_token_table[] __weak;
 extern const u16 kallsyms_token_index[] __weak;
 
-extern const unsigned long kallsyms_markers[] __weak;
+extern const unsigned int kallsyms_markers[] __weak;
 
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
--- 4.19-rc2/scripts/kallsyms.c
+++ 4.19-rc2-kallsyms-reduce-size/scripts/kallsyms.c
@@ -405,7 +405,7 @@ static void write_src(void)
 	}
 
 	output_label("kallsyms_num_syms");
-	printf("\tPTR\t%u\n", table_cnt);
+	printf("\t.long\t%u\n", table_cnt);
 	printf("\n");
 
 	/* table of offset markers, that give the offset in the compressed stream
@@ -434,7 +434,7 @@ static void write_src(void)
 
 	output_label("kallsyms_markers");
 	for (i = 0; i < ((table_cnt + 255) >> 8); i++)
-		printf("\tPTR\t%d\n", markers[i]);
+		printf("\t.long\t%u\n", markers[i]);
 	printf("\n");
 
 	free(markers);
