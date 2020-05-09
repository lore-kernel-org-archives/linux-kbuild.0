Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:30644 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgEIHlK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 May 2020 03:41:10 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] bpfilter: check if $(CC) can static link in Kconfig
Date: Sat,  9 May 2020 16:39:15 +0900
Message-Id: <20200509073915.860588-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Valdis Kletnieks <valdis.kletnieks@vt.edu>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org

On Fedora, linking static libraries requires the glibc-static RPM
package, which is not part of the glibc-devel package.

CONFIG_CC_CAN_LINK does not check the capability of static linking,
so you can enable CONFIG_BPFILTER_UMH, then fail to build.

  HOSTLD  net/bpfilter/bpfilter_umh
/usr/bin/ld: cannot find -lc
collect2: error: ld returned 1 exit status

Add CONFIG_CC_CAN_LINK_STATIC, and make CONFIG_BPFILTER_UMH depend
on it.

Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

I will insert this after
https://patchwork.kernel.org/patch/11515997/

 init/Kconfig         | 5 +++++
 net/bpfilter/Kconfig | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 57562a8e2761..d0ff16e93794 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -49,6 +49,11 @@ config CC_CAN_LINK
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m64-flag)) if 64BIT
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m32-flag))
 
+config CC_CAN_LINK_STATIC
+	bool
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m64-flag)) if 64BIT
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m32-flag))
+
 config CC_HAS_ASM_GOTO
 	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
 
diff --git a/net/bpfilter/Kconfig b/net/bpfilter/Kconfig
index fed9290e3b41..045144d4a42c 100644
--- a/net/bpfilter/Kconfig
+++ b/net/bpfilter/Kconfig
@@ -9,7 +9,7 @@ menuconfig BPFILTER
 if BPFILTER
 config BPFILTER_UMH
 	tristate "bpfilter kernel module with user mode helper"
-	depends on CC_CAN_LINK
+	depends on CC_CAN_LINK_STATIC
 	default m
 	help
 	  This builds bpfilter kernel module with embedded user mode helper
-- 
2.25.1
