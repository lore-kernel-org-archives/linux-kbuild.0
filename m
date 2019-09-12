Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:43160 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfILHdr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 03:33:47 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: warn orphan obj-y objects
Date: Thu, 12 Sep 2019 16:33:34 +0900
Message-Id: <20190912073336.7036-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190912073336.7036-1-yamada.masahiro@socionext.com>
References: <20190912073336.7036-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

obj-y specifies objects linked into vmlinux, but they are actually
linked if and only if that sub-directory is visited by the chain of
obj-y. If you have an orphan obj-y object, it is a bug, but may not
easy to notice. This commit provides build-time warning.

I tested allmodconfig based on v5.3-rc4, and I saw one warning:

scripts/Makefile.build:57: 'sound/soc/sprd/sprd-mcdt.o' will not be linked to vmlinux even though obj-y is specified.

This is a proper warning. sound/soc/sprd/sprd-mcdt.o is compiled as
built-in since CONFIG_SND_SOC_SPRD_MCDT is boolean. However, CONFIG_SND
and CONFIG_SND_SOC are tristate, and set to m by allmodconfig.
So, Kbuild descends into sound/soc/, then sound/soc/sprd/ by obj-m.
sound/soc/sprd/sprd-mcdt.o is not linked to vmlinux.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build  | 6 ++++++
 scripts/link-vmlinux.sh | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 54fc68168686..d30b04707fec 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -52,6 +52,12 @@ ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
 
+ifeq ($(need-builtin),)
+ifneq ($(real-obj-y),)
+$(warning '$(real-obj-y)' will not be linked to vmlinux even though obj-y is specified.)
+endif
+endif
+
 ifeq ($(need-modorder),)
 ifneq ($(obj-m),)
 $(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 2438a9faf3f1..8961d999b86b 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -216,7 +216,7 @@ else
 fi;
 
 # final build of init/
-${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init
+${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
 
 #link vmlinux.o
 info LD vmlinux.o
-- 
2.17.1
