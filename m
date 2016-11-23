Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36306 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934445AbcKWQmN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 11:42:13 -0500
Received: by mail-pg0-f66.google.com with SMTP id x23so1425150pgx.3
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2016 08:42:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 4/7] kbuild: improve linker compatibility with lib-ksyms.o build
Date: Thu, 24 Nov 2016 03:41:40 +1100
Message-Id: <20161123164143.16839-5-npiggin@gmail.com>
In-Reply-To: <20161123164143.16839-1-npiggin@gmail.com>
References: <20161123164143.16839-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

lib-ksyms.o is created by linking an empty input file with a linker
script containing the interesting bits. Currently the empty input file
is an archive containing nothing, however this causes the gold linker
to segfault.

I have opened a bug against gold

  https://sourceware.org/bugzilla/show_bug.cgi?id=20767

However this can be worked around by assembling an empty file to link
with instead. The resulting lib-ksyms.o is slightly larger (seemingly
due to empty .text, .data, .bss setions added), but final linked
output should not be changed.

Reported-by: Anton Blanchard <anton@samba.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 41d2901..8925209 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -490,7 +490,7 @@ quiet_cmd_export_list = EXPORTS $@
 cmd_export_list = $(OBJDUMP) -h $< | \
 	sed -ne '/___ksymtab/{s/.*+/$(ref_prefix)/;s/ .*/)/;p}' >$(ksyms-lds);\
 	rm -f $(dummy-object);\
-	$(AR) rcs$(KBUILD_ARFLAGS) $(dummy-object);\
+	echo | $(CC) $(a_flags) -c -o $(dummy-object) -x assembler -;\
 	$(LD) $(ld_flags) -r -o $@ -T $(ksyms-lds) $(dummy-object);\
 	rm $(dummy-object) $(ksyms-lds)
 
-- 
2.10.2

