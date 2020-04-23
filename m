Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:33701 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgDWHlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:41:37 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 04/16] net: bpfilter: use 'userprogs' syntax to build bpfilter_umh
Date: Thu, 23 Apr 2020 16:39:17 +0900
Message-Id: <20200423073929.127521-5-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

The user mode helper should be compiled for the same architecture as
the kernel.

This Makefile reuses the 'hostprogs' syntax by overriding HOSTCC with CC.

Now that Kbuild provides the syntax 'userprogs', use it to fix the
Makefile mess.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 net/bpfilter/Makefile | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/net/bpfilter/Makefile b/net/bpfilter/Makefile
index 36580301da70..6ee650c6badb 100644
--- a/net/bpfilter/Makefile
+++ b/net/bpfilter/Makefile
@@ -3,17 +3,14 @@
 # Makefile for the Linux BPFILTER layer.
 #
 
-hostprogs := bpfilter_umh
+userprogs := bpfilter_umh
 bpfilter_umh-objs := main.o
-KBUILD_HOSTCFLAGS += -I $(srctree)/tools/include/ -I $(srctree)/tools/include/uapi
-HOSTCC := $(CC)
+user-ccflags += -I $(srctree)/tools/include/ -I $(srctree)/tools/include/uapi
 
-ifeq ($(CONFIG_BPFILTER_UMH), y)
-# builtin bpfilter_umh should be compiled with -static
+# builtin bpfilter_umh should be linked with -static
 # since rootfs isn't mounted at the time of __init
 # function is called and do_execv won't find elf interpreter
-KBUILD_HOSTLDFLAGS += -static
-endif
+bpfilter_umh-ldflags += -static
 
 $(obj)/bpfilter_umh_blob.o: $(obj)/bpfilter_umh
 
-- 
2.25.1
