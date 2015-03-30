Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:35708 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753084AbbC3NUr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 09:20:47 -0400
Received: by wicne17 with SMTP id ne17so31145209wic.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2015 06:20:46 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH 2/2] Kbuild: kallsyms: drop special handling of pre-3.0 GCC symbols
Date: Mon, 30 Mar 2015 15:20:32 +0200
Message-Id: <1427721632-11665-3-git-send-email-ard.biesheuvel@linaro.org>
In-Reply-To: <1427721632-11665-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1427721632-11665-1-git-send-email-ard.biesheuvel@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, mmarek@suse.cz, linux@arm.linux.org.uk
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Since we have required at least GCC v3.2 for some time now, we
can drop the special handling of the 'gcc[0-9]_compiled.' label
which is not emitted anymore since GCC v3.0.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 scripts/kallsyms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index f4b016782f0d..8fa81e84e295 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -214,7 +214,6 @@ static int symbol_valid(struct sym_entry *s)
 		NULL };
 
 	static char *special_suffixes[] = {
-		"_compiled.",		/* gcc < 3.0: "gcc[0-9]_compiled." */
 		"_veneer",		/* arm */
 		NULL };
 
-- 
1.8.3.2

