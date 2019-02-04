Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39829 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfBDI4b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Feb 2019 03:56:31 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] sh: fix build error for empty CONFIG_BUILTIN_DTB_SOURCE again
Date: Mon,  4 Feb 2019 17:55:26 +0900
Message-Id: <1549270526-17230-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org, Rich Felker <dalias@libc.org>, Mark Rutland <mark.rutland@arm.com>

I fixed this build error in commit 1b1e4ee86e00 ("sh: fix build error
for empty CONFIG_BUILTIN_DTB_SOURCE"), but it came back again.

Since commit 37c8a5fafa3b ("kbuild: consolidate Devicetree dtb
build rules"), the combination of CONFIG_OF_EARLY_FLATTREE=y and
CONFIG_USE_BUILTIN_DTB=n results in the following build error:

make[1]: *** No rule to make target 'arch/sh/boot/dts/.dtb.o', needed by 'arch/sh/boot/dts/built-in.a'.  Stop.
make: *** [Makefile;1727: arch/sh/boot/dts/] Error 2

Prior to that commit, there was only one path to descend into
arch/sh/boot/dts/, and arch/sh/Makefile correctly guards it with
CONFIG_USE_BUILTIN_DTB:

  core-$(CONFIG_USE_BUILTIN_DTB)  += arch/sh/boot/dts/

Now, there is another path to descend there from the top Makefile
when CONFIG_OF_EARLY_FLATTREE=y. Add obj-$(CONFIG_USE_BUILTIN_DTB)
guard in case CONFIG_BUILTIN_DTB_SOURCE is hidden due to the unmet
'depends on'.

Fixes: 37c8a5fafa3b ("kbuild: consolidate Devicetree dtb build rules")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Observant reviewers may point out another problem.
There is a race condition when CONFIG_OF_EARLY_FLATTREE=y.

Some architectures (sh, xtensa, etc.) embed a DTB in vmlinux,
so there are two paths to descend into arch/*/boot/dts/.
For parallel build with -j<N> option, two threads may build
under arch/*/boot/dts/ simultaneously.

Yes, this is a problem, and it is in my TODO list.
For some reasons, I will postpone it by the next development cycle.

For now, I want to fix this sh build error first because kbuild test
robot is still complaining about it.


 arch/sh/boot/dts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/boot/dts/Makefile b/arch/sh/boot/dts/Makefile
index 01d0f7f..2563d1e 100644
--- a/arch/sh/boot/dts/Makefile
+++ b/arch/sh/boot/dts/Makefile
@@ -1,3 +1,3 @@
 ifneq ($(CONFIG_BUILTIN_DTB_SOURCE),"")
-obj-y += $(patsubst "%",%,$(CONFIG_BUILTIN_DTB_SOURCE)).dtb.o
+obj-$(CONFIG_USE_BUILTIN_DTB) += $(patsubst "%",%,$(CONFIG_BUILTIN_DTB_SOURCE)).dtb.o
 endif
-- 
2.7.4
