Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:34042 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbeLKMCL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 07:02:11 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/4] kbuild: handle part-of-module correctly for *.ll and *.symtypes
Date: Tue, 11 Dec 2018 21:01:56 +0900
Message-Id: <1544529716-4917-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544529716-4917-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544529716-4917-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The single targets *.ll and *.symtypes never treated as a module.
Fix this.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 321b5b7..795fedc 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -94,7 +94,7 @@ endif
 # ---------------------------------------------------------------------------
 
 # Default is built-in, unless we know otherwise
-$(foreach x, i lst o s, $(patsubst %.o,%.$(x),$(real-obj-m))): \
+$(foreach x, i ll lst o s symtypes, $(patsubst %.o,%.$(x),$(real-obj-m))): \
 	part-of-module := y
 
 modkern_cflags =                                          \
-- 
2.7.4
