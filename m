Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34077 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfHJPyV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:21 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 02/11] kbuild: refactor part-of-module more
Date: Sun, 11 Aug 2019 00:52:58 +0900
Message-Id: <20190810155307.29322-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Make it even shorter.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2f66ed388d1c..64e47a9a54c5 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -98,8 +98,7 @@ endif
 # ---------------------------------------------------------------------------
 
 # Default is built-in, unless we know otherwise
-$(foreach x, i ll lst o s symtypes, $(patsubst %.o,%.$(x),$(real-obj-m))): \
-	part-of-module := y
+part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
 
 modkern_cflags =                                          \
 	$(if $(part-of-module),                           \
-- 
2.17.1
