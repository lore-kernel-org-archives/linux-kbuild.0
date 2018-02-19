Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:52477 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753184AbeBSRKs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Feb 2018 12:10:48 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] sh: fix build error for empty CONFIG_BUILTIN_DTB_SOURCE
Date: Tue, 20 Feb 2018 02:09:42 +0900
Message-Id: <1519060182-1746-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rich Felker <dalias@libc.org>, Mark Rutland <mark.rutland@arm.com>

If CONFIG_USE_BUILTIN_DTB is enabled, but CONFIG_BUILTIN_DTB_SOURCE
is empty (for example, allmodconfig), a build error occurs.

Surround obj-y with ifneq ... endif.

I replaced $(CONFIG_USE_BUILTIN_DTB) with 'y' since this is always
the case from the following code from arch/sh/Makefile:

  core-$(CONFIG_USE_BUILTIN_DTB)  += arch/sh/boot/dts/

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/sh/boot/dts/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/sh/boot/dts/Makefile b/arch/sh/boot/dts/Makefile
index 715def0..01d0f7f 100644
--- a/arch/sh/boot/dts/Makefile
+++ b/arch/sh/boot/dts/Makefile
@@ -1 +1,3 @@
-obj-$(CONFIG_USE_BUILTIN_DTB) += $(patsubst "%",%,$(CONFIG_BUILTIN_DTB_SOURCE)).dtb.o
+ifneq ($(CONFIG_BUILTIN_DTB_SOURCE),"")
+obj-y += $(patsubst "%",%,$(CONFIG_BUILTIN_DTB_SOURCE)).dtb.o
+endif
-- 
2.7.4

