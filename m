Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f208.google.com ([209.85.219.208]:52743 "EHLO
	mail-ew0-f208.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751752AbZJYPFW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 25 Oct 2009 11:05:22 -0400
Message-ID: <4AE46934.2000203@tuffmail.co.uk>
Date: Sun, 25 Oct 2009 15:05:24 +0000
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: [PATCH] kallsyms: clean up alignment (potentially save a few bytes
 on ARM)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On ARM, .align N means "align to 2^N bytes".  What we actually want is
"align to N bytes".

Let's use the .balign directive of gnu as, which is explicitly defined
to address this issue.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
---
 scripts/kallsyms.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 86c3896..55de9e8 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -297,10 +297,10 @@ static void write_src(void)
 	printf("#include <asm/types.h>\n");
 	printf("#if BITS_PER_LONG == 64\n");
 	printf("#define PTR .quad\n");
-	printf("#define ALGN .align 8\n");
+	printf("#define ALGN .balign 8\n");
 	printf("#else\n");
 	printf("#define PTR .long\n");
-	printf("#define ALGN .align 4\n");
+	printf("#define ALGN .balign 4\n");
 	printf("#endif\n");
 
 	printf("\t.section .rodata, \"a\"\n");

