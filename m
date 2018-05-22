Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:45460 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751374AbeEVHXv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 May 2018 03:23:51 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 1/4] kbuild: do not display CHK for filechk
Date: Tue, 22 May 2018 16:22:18 +0900
Message-Id: <1526973741-664-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1526973741-664-1-git-send-email-yamada.masahiro@socionext.com>
References: <1526973741-664-1-git-send-email-yamada.masahiro@socionext.com>
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

Changes in v3: None
Changes in v2: None

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

