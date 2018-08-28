Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prv1-mh.provo.novell.com ([137.65.248.33]:37195 "EHLO
        prv1-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbeH1TNW (ORCPT
        <rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
        Tue, 28 Aug 2018 15:13:22 -0400
Message-Id: <5B8563A702000078001E2A82@prv1-mh.provo.novell.com>
Date: Tue, 28 Aug 2018 09:00:55 -0600
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] kallsyms: reduce size a little on 64-bit
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
 kernel/kallsyms.c  |    4 ++--
 scripts/kallsyms.c |    6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

--- 4.19-rc1/kernel/kallsyms.c
+++ 4.19-rc1-kallsyms-reduce-size/kernel/kallsyms.c
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
--- 4.19-rc1/scripts/kallsyms.c
+++ 4.19-rc1-kallsyms-reduce-size/scripts/kallsyms.c
@@ -182,6 +182,8 @@ static int symbol_in_range(struct sym_en
 	for (i = 0; i < entries; ++i) {
 		ar = &ranges[i];
 
+		if (!ar->end)
+			continue;
 		if (s->addr >= ar->start && s->addr <= ar->end)
 			return 1;
 	}
@@ -405,7 +407,7 @@ static void write_src(void)
 	}
 
 	output_label("kallsyms_num_syms");
-	printf("\tPTR\t%u\n", table_cnt);
+	printf("\t.long\t%u\n", table_cnt);
 	printf("\n");
 
 	/* table of offset markers, that give the offset in the compressed stream
@@ -434,7 +436,7 @@ static void write_src(void)
 
 	output_label("kallsyms_markers");
 	for (i = 0; i < ((table_cnt + 255) >> 8); i++)
-		printf("\tPTR\t%d\n", markers[i]);
+		printf("\t.long\t%u\n", markers[i]);
 	printf("\n");
 
 	free(markers);
