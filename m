Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:33352 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbeLQQRs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Dec 2018 11:17:48 -0500
Received: by mail-qt1-f196.google.com with SMTP id l11so14713760qtp.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Dec 2018 08:17:47 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Subject: [PATCH] kbuild: error for CONFIG_ORC_UNWINDER is too much
Date: Mon, 17 Dec 2018 11:17:28 -0500
Message-Id: <20181217161728.6875-1-cai@lca.pw>
In-Reply-To: <869bc700-1d6d-b950-76c7-5d0fc589152c@lca.pw>
References: <869bc700-1d6d-b950-76c7-5d0fc589152c@lca.pw>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: jpoimboe@redhat.com, mingo@kernel.org, bp@alien8.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>

Since ifdef will be evaluated immediately in the first phrase of the
Makefile read-in, there is no guarantee that the value for
CONFIG_ORC_UNWINDER will be up-to-date until in the second phrase that
this recipe is ran.

include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig

Hence, change error to warning as this is essentially a best guess. The
original bug can be reproduced this way,

* make sure none of libelf-dev, libelf-devel or elfutils-libelf-devel
installed.

 # make distclean

* generate a default .config where CONFIG_UNWINDER_ORC is enabled by
default.
 # make menuconfig (exit -> save)

 # grep CONFIG_UNWINDER_ORC .config
CONFIG_UNWINDER_ORC=y

 # make menuconfig (deselect CONFIG_UNWINDER_ORC)

 # grep CONFIG_UNWINDER_ORC .config
 # CONFIG_UNWINDER_ORC is not set

 # make
Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install
libelf-dev, libelf-devel or elfutils-libelf-devel

 # grep CONFIG_UNWINDER_ORC include/config/auto.conf
CONFIG_UNWINDER_ORC=y

Fixes: 3dd40cb320f (objtool: Upgrade libelf-devel warning to error for
CONFIG_ORC_UNWINDER)
Signed-off-by: Qian Cai <cai@lca.pw>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 56d5270f22f8..eeb4ec49d393 100644
--- a/Makefile
+++ b/Makefile
@@ -963,7 +963,7 @@ ifdef CONFIG_STACK_VALIDATION
     objtool_target := tools/objtool FORCE
   else
     ifdef CONFIG_UNWINDER_ORC
-      $(error "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
+      $(warning "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
     else
       $(warning "Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
     endif
-- 
2.17.2 (Apple Git-113)
