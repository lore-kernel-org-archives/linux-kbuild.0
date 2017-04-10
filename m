Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35449 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751712AbdDJUKq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Apr 2017 16:10:46 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH] MAINTAINERS: relinquish kconfig
Date: Mon, 10 Apr 2017 22:10:34 +0200
Message-Id: <20170410201034.11046-1-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.masahiro@socionext.com>, Vincent Legoll <vincent.legoll@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

Since about the time I was actually added in that file, I've been
almost entirely absent, which totally sucks, and there is no excuse
for my behaviour and for not having relinquished this earlier.

My deepest apologies.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Vincent Legoll <vincent.legoll@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 MAINTAINERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fdd5350..58899aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7058,10 +7058,8 @@ F:	mm/kasan/
 F:	scripts/Makefile.kasan
 
 KCONFIG
-M:	"Yann E. MORIN" <yann.morin.1998@free.fr>
 L:	linux-kbuild@vger.kernel.org
-T:	git git://gitorious.org/linux-kconfig/linux-kconfig
-S:	Maintained
+S:	Orphan
 F:	Documentation/kbuild/kconfig-language.txt
 F:	scripts/kconfig/
 
-- 
2.9.3

