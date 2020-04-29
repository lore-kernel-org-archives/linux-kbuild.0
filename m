Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:30766 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgD2Dq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 23:46:29 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 03/15] bpfilter: use 'userprogs' syntax to build bpfilter_umh
Date: Wed, 29 Apr 2020 12:45:15 +0900
Message-Id: <20200429034527.590520-4-masahiroy@kernel.org>
In-Reply-To: <20200429034527.590520-1-masahiroy@kernel.org>
References: <20200429034527.590520-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf <bpf@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

The user mode helper should be compiled for the same architecture as
the kernel.

This Makefile reused the 'hostprogs' syntax by overriding HOSTCC with CC.
Use the new syntax 'userprogs' to fix the Makefile mess.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2: None

 net/bpfilter/Makefile | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/net/bpfilter/Makefile b/net/bpfilter/Makefile
index f6209e4827b9..f23b53294fba 100644
--- a/net/bpfilter/Makefile
+++ b/net/bpfilter/Makefile
@@ -3,18 +3,14 @@
 # Makefile for the Linux BPFILTER layer.
 #
 
-hostprogs := bpfilter_umh
+userprogs := bpfilter_umh
 bpfilter_umh-objs := main.o
-KBUILD_HOSTCFLAGS += -I $(srctree)/tools/include/ -I $(srctree)/tools/include/uapi \
-			$(filter -m32 -m64, $(KBUILD_CFLAGS))
-HOSTCC := $(CC)
+userccflags += -I $(srctree)/tools/include/ -I $(srctree)/tools/include/uapi
 
-ifeq ($(CONFIG_BPFILTER_UMH), y)
-# builtin bpfilter_umh should be compiled with -static
+# builtin bpfilter_umh should be linked with -static
 # since rootfs isn't mounted at the time of __init
 # function is called and do_execv won't find elf interpreter
-KBUILD_HOSTLDFLAGS += -static $(filter -m32 -m64, $(KBUILD_CFLAGS))
-endif
+userldflags += -static
 
 $(obj)/bpfilter_umh_blob.o: $(obj)/bpfilter_umh
 
-- 
2.25.1
