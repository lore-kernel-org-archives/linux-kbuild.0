Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:57192 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751017AbeBUEZ2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 23:25:28 -0500
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH RFC] kbuild: drop superfluous GCC_PLUGINS_CFLAGS assignment
Date: Wed, 21 Feb 2018 12:25:07 +0800
Message-ID: <20180221042507.31379-1-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, re.emese@gmail.com

GCC_PLUGINS_CFLAGS is already in the environment, so it is superfluous
to add it in commanline of final build of init/

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
This is only tested with Randomizing Structure Layout plugin. The test
method is not so grace but I think it can prove the correctness of this
patch. On the other hand, if we concerns that some flags cannot be
passed during final build, should also consider all the other flags.

Currently, with Randomizing plugin enabled, the crash utility can't work
with it, the symptom is a Segmentation fault due to infinite function call.

With the patch, the symptom is exactly the same, so I am sure the plugin works.

 scripts/link-vmlinux.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index e6818b8e7141..e07b2d251ad6 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -248,7 +248,7 @@ else
 fi;
 
 # final build of init/
-${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init GCC_PLUGINS_CFLAGS="${GCC_PLUGINS_CFLAGS}"
+${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init
 
 archive_builtin
 
-- 
2.14.3



