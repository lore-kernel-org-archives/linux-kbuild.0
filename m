Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from winston.telenet-ops.be ([195.130.137.75]:45160 "EHLO
	winston.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932245AbbEZNgW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 May 2015 09:36:22 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	by winston.telenet-ops.be (Postfix) with ESMTP id 74F9359077A
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2015 13:40:30 +0200 (CEST)
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] kconfig: Extend defconfig field size from 24 to 32
Date: Tue, 26 May 2015 13:39:55 +0200
Message-Id: <1432640395-17310-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1432640395-17310-1-git-send-email-geert+renesas@glider.be>
References: <1432640395-17310-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>

next-20150526 has 12 defconfigs with names longer than 24 characters,
breaking alignment in "make help".

The "winners" are "atngw100mkii_evklcd100_defconfig" and
"atngw100mkii_evklcd101_defconfig", counting in at 32 characters.

Extend the defconfig field size to 32 to restore alignment.
Don't use a larger value, to not encourage people to create even longer
defconfig names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 92a70785920535c6..ac6fa61b2cf3b222 100644
--- a/Makefile
+++ b/Makefile
@@ -1300,7 +1300,7 @@ help:
 	@echo  ''
 	@$(if $(boards), \
 		$(foreach b, $(boards), \
-		printf "  %-24s - Build for %s\\n" $(b) $(subst _defconfig,,$(b));) \
+		printf "  %-32s - Build for %s\\n" $(b) $(subst _defconfig,,$(b));) \
 		echo '')
 	@$(if $(board-dirs), \
 		$(foreach b, $(board-dirs), \
-- 
1.9.1

