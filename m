Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:59224 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfJCH7Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 03:59:16 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 4/6] kbuild: fix build error of 'make nsdeps' in clean tree
Date: Thu,  3 Oct 2019 16:58:24 +0900
Message-Id: <20191003075826.7478-5-yamada.masahiro@socionext.com>
In-Reply-To: <20191003075826.7478-1-yamada.masahiro@socionext.com>
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shaun Ruffell <sruffell@sruffell.net>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Running 'make nsdeps' in a clean source tree fails as follows:

$ make -s clean; make -s defconfig; make nsdeps
   [ snip ]
awk: fatal: cannot open file `init/modules.order' for reading (No such file or directory)
make: *** [Makefile;1307: modules.order] Error 2
make: *** Deleting file 'modules.order'
make: *** Waiting for unfinished jobs....

The cause of the error is 'make nsdeps' does not build modules at all.
Set KBUILD_MODULES to fix it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
---

Changes in v2: None

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6f54f2f95743..d97f38ad5d9f 100644
--- a/Makefile
+++ b/Makefile
@@ -616,7 +616,7 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all _all modules,$(MAKECMDGOALS)),)
+ifneq ($(filter all _all modules nsdeps,$(MAKECMDGOALS)),)
   KBUILD_MODULES := 1
 endif
 
-- 
2.17.1
