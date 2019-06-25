Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:24772 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbfFYIwy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 04:52:54 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: add more hints about SUBDIRS replacement
Date: Tue, 25 Jun 2019 17:51:27 +0900
Message-Id: <20190625085127.9446-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, Herbert Xu <herbert@gondor.apana.org.au>, Sam Ravnborg <sam@ravnborg.org>, Xi Wang <wangxi11@huawei.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit 0126be38d988 ("kbuild: announce removal of SUBDIRS if used")
added a hint about the 'SUBDIRS' replacement, but it was not clear
enough.

Multiple people sent me similar questions, patches.

  https://lkml.org/lkml/2019/1/17/456

I did not mean to suggest M= for building a subdirectory in the kernel
tree.

From the commit 669efc76b317 ("net: hns3: fix compile error"), people
already (ab)use M=... to do that because it seems to work to some extent.

Documentation/kbuild/kbuild.txt says M= and KBUILD_EXTMOD are used for
building external modules.

In fact, Kbuild supports the single target '%/' for this purpose, but
this may not be noticed much.

Kindly add more hints.

Makefile:213: ================= WARNING ================
Makefile:214: 'SUBDIRS' will be removed after Linux 5.3
Makefile:215:
Makefile:216: If you are building an individual subdirectory
Makefile:217: in the kernel tree, you can do like this:
Makefile:218: $ make path/to/dir/you/want/to/build/
Makefile:219: (Do not forget the trailing slash)
Makefile:220:
Makefile:221: If you are building an external module,
Makefile:222: Please use 'M=' or 'KBUILD_EXTMOD' instead
Makefile:223: ==========================================

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 7a7c17eb0cbf..823a39d940c6 100644
--- a/Makefile
+++ b/Makefile
@@ -212,6 +212,13 @@ endif
 ifdef SUBDIRS
   $(warning ================= WARNING ================)
   $(warning 'SUBDIRS' will be removed after Linux 5.3)
+  $(warning )
+  $(warning If you are building an individual subdirectory)
+  $(warning in the kernel tree, you can do like this:)
+  $(warning $$ make path/to/dir/you/want/to/build/)
+  $(warning (Do not forget the trailing slash))
+  $(warning )
+  $(warning If you are building an external module,)
   $(warning Please use 'M=' or 'KBUILD_EXTMOD' instead)
   $(warning ==========================================)
   KBUILD_EXTMOD ?= $(SUBDIRS)
-- 
2.17.1
