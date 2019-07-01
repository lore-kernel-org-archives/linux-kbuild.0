Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:61398 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGABA6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Jun 2019 21:00:58 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/7] init/Kconfig: add CONFIG_CC_CAN_LINK
Date: Mon,  1 Jul 2019 09:58:39 +0900
Message-Id: <20190701005845.12475-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190701005845.12475-1-yamada.masahiro@socionext.com>
References: <20190701005845.12475-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Joel Fernandes <joel@joelfernandes.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Song Liu <songliubraving@fb.com>, "David S. Miller" <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org, Yonghong Song <yhs@fb.com>, linux-kernel@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>, bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>

Currently, scripts/cc-can-link.sh is run just for BPFILTER_UMH, but
defining CC_CAN_LINK will be useful in other places.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4:
 - New patch

Changes in v3: None
Changes in v2: None

 init/Kconfig         | 3 +++
 net/bpfilter/Kconfig | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index df5bba27e3fe..2e9813daa2c1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -24,6 +24,9 @@ config CLANG_VERSION
 	int
 	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
 
+config CC_CAN_LINK
+	def_bool $(success,$(srctree)/scripts/cc-can-link.sh $(CC))
+
 config CC_HAS_ASM_GOTO
 	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
 
diff --git a/net/bpfilter/Kconfig b/net/bpfilter/Kconfig
index 91f9d878165e..fed9290e3b41 100644
--- a/net/bpfilter/Kconfig
+++ b/net/bpfilter/Kconfig
@@ -9,7 +9,7 @@ menuconfig BPFILTER
 if BPFILTER
 config BPFILTER_UMH
 	tristate "bpfilter kernel module with user mode helper"
-	depends on $(success,$(srctree)/scripts/cc-can-link.sh $(CC))
+	depends on CC_CAN_LINK
 	default m
 	help
 	  This builds bpfilter kernel module with embedded user mode helper
-- 
2.17.1
