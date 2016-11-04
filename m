Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36535 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753180AbcKDHKN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 03:10:13 -0400
Received: by mail-pf0-f195.google.com with SMTP id n85so7064883pfi.3
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Nov 2016 00:10:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] kbuild: improve linker compatibility with lib-ksyms.o build
Date: Fri,  4 Nov 2016 18:10:04 +1100
Message-Id: <20161104071004.2816-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

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

Hi Michal,

If we can sneak this into 4.9 it would be nice, so we don't have a
release version of the kernel out there with this bug.

Thanks,
Nick

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 05c6bb4..fc6ebe4 100644
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
2.9.3

