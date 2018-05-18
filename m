Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:33673 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750977AbeERExu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 May 2018 00:53:50 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/5] kbuild: do not display CHK for filechk
Date: Fri, 18 May 2018 13:52:22 +0900
Message-Id: <1526619146-1895-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1526619146-1895-1-git-send-email-yamada.masahiro@socionext.com>
References: <1526619146-1895-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

filechk displays two short logs; CHK for creating a temporary file,
and UPD for really updating the target.

IMHO, the build system can be quiet when the target file has not
been updated.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 50cee53..c7fedc5 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -57,7 +57,6 @@ kecho := $($(quiet)kecho)
 #   to specify a valid file as first prerequisite (often the kbuild file)
 define filechk
 	$(Q)set -e;				\
-	$(kecho) '  CHK     $@';		\
 	mkdir -p $(dir $@);			\
 	$(filechk_$(1)) < $< > $@.tmp;		\
 	if [ -r $@ ] && cmp -s $@ $@.tmp; then	\
-- 
2.7.4

