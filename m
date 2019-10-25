Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:37462 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733282AbfJYLxI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 07:53:08 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] kconfig: Extend defconfig field size from 24 to 27
Date: Fri, 25 Oct 2019 13:53:05 +0200
Message-Id: <20191025115305.9769-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

There are 6 defconfigs with names longer than 24 characters, breaking
alignment in "make help".

The "winner" is "ecovec24-romimage_defconfig", counting in at 27
characters.

Extend the defconfig field size to 27 to restore alignment.
Don't use a larger value, to not encourage people to create even longer
defconfig names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>
---
v2:
  - Add Acked-by,
  - Reduce from 32 to 27, now avr32 and its long defconfigs have been
    removed,
  - Update statistics.
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5a1ef8db2cec69f6..a0934f3d0328b06c 100644
--- a/Makefile
+++ b/Makefile
@@ -1512,7 +1512,7 @@ help:
 	@echo  ''
 	@$(if $(boards), \
 		$(foreach b, $(boards), \
-		printf "  %-24s - Build for %s\\n" $(b) $(subst _defconfig,,$(b));) \
+		printf "  %-27s - Build for %s\\n" $(b) $(subst _defconfig,,$(b));) \
 		echo '')
 	@$(if $(board-dirs), \
 		$(foreach b, $(board-dirs), \
-- 
2.17.1
