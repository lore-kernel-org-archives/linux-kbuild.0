Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:46839 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728982AbgGAJ32 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 05:29:28 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] bpfilter: allow to build bpfilter_umh as a module without static library
Date: Wed,  1 Jul 2020 18:26:44 +0900
Message-Id: <20200701092644.762234-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Kubecek <mkubecek@suse.cz>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Sam Ravnborg <sam@ravnborg.org>, Song Liu <songliubraving@fb.com>, =?UTF-8?q?Valdis=20Kl=20=C4=93=20tnieks?= <valdis.kletnieks@vt.edu>, Yonghong Song <yhs@fb.com>

Originally, bpfilter_umh was linked with -static only when
CONFIG_BPFILTER_UMH=y.

Commit 8a2cc0505cc4 ("bpfilter: use 'userprogs' syntax to build
bpfilter_umh") silently, accidentally dropped the CONFIG_BPFILTER_UMH=y
test in the Makefile. Revive it in order to link it dynamically when
CONFIG_BPFILTER_UMH=m.

Since commit b1183b6dca3e ("bpfilter: check if $(CC) can link static
libc in Kconfig"), the compiler must be capable of static linking to
enable CONFIG_BPFILTER_UMH, but it requires more than needed.

To loosen the compiler requirement, I changed the dependency as follows:

    depends on CC_CAN_LINK
    depends on m || CC_CAN_LINK_STATIC

If CONFIG_CC_CAN_LINK_STATIC in unset, CONFIG_BPFILTER_UMH is restricted
to 'm' or 'n'.

In theory, CONFIG_CC_CAN_LINK is not required for CONFIG_BPFILTER_UMH=y,
but I did not come up with a good way to describe it.

Fixes: 8a2cc0505cc4 ("bpfilter: use 'userprogs' syntax to build bpfilter_umh")
Reported-by: Michal Kubecek <mkubecek@suse.cz>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 net/bpfilter/Kconfig  | 10 ++++++----
 net/bpfilter/Makefile |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/bpfilter/Kconfig b/net/bpfilter/Kconfig
index 84015ef3ee27..73d0b12789f1 100644
--- a/net/bpfilter/Kconfig
+++ b/net/bpfilter/Kconfig
@@ -9,12 +9,14 @@ menuconfig BPFILTER
 if BPFILTER
 config BPFILTER_UMH
 	tristate "bpfilter kernel module with user mode helper"
-	depends on CC_CAN_LINK_STATIC
+	depends on CC_CAN_LINK
+	depends on m || CC_CAN_LINK_STATIC
 	default m
 	help
 	  This builds bpfilter kernel module with embedded user mode helper
 
-	  Note: your toolchain must support building static binaries, since
-	  rootfs isn't mounted at the time when __init functions are called
-	  and do_execv won't be able to find the elf interpreter.
+	  Note: To compile this as built-in, your toolchain must support
+	  building static binaries, since rootfs isn't mounted at the time
+	  when __init functions are called and do_execv won't be able to find
+	  the elf interpreter.
 endif
diff --git a/net/bpfilter/Makefile b/net/bpfilter/Makefile
index f23b53294fba..cdac82b8c53a 100644
--- a/net/bpfilter/Makefile
+++ b/net/bpfilter/Makefile
@@ -7,10 +7,12 @@ userprogs := bpfilter_umh
 bpfilter_umh-objs := main.o
 userccflags += -I $(srctree)/tools/include/ -I $(srctree)/tools/include/uapi
 
+ifeq ($(CONFIG_BPFILTER_UMH), y)
 # builtin bpfilter_umh should be linked with -static
 # since rootfs isn't mounted at the time of __init
 # function is called and do_execv won't find elf interpreter
 userldflags += -static
+endif
 
 $(obj)/bpfilter_umh_blob.o: $(obj)/bpfilter_umh
 
-- 
2.25.1
