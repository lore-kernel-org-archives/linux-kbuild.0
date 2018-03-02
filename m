Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:37017 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1423109AbeCBNG6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Mar 2018 08:06:58 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] MAINTAINERS: take over Kconfig maintainership
Date: Fri,  2 Mar 2018 22:04:59 +0900
Message-Id: <1519995899-18187-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Ulf Magnusson <ulfalizer@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

I have recently picked up Kconfig patches to my tree without any
declaration.  Making it official now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c95c60..4623caf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7602,8 +7602,10 @@ F:	mm/kasan/
 F:	scripts/Makefile.kasan
 
 KCONFIG
+M:	Masahiro Yamada <yamada.masahiro@socionext.com>
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig
 L:	linux-kbuild@vger.kernel.org
-S:	Orphan
+S:	Maintained
 F:	Documentation/kbuild/kconfig-language.txt
 F:	scripts/kconfig/
 
-- 
2.7.4

