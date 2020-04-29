Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:30777 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgD2Dq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 23:46:29 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 04/15] samples: seccomp: build sample programs for target architecture
Date: Wed, 29 Apr 2020 12:45:16 +0900
Message-Id: <20200429034527.590520-5-masahiroy@kernel.org>
In-Reply-To: <20200429034527.590520-1-masahiroy@kernel.org>
References: <20200429034527.590520-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf <bpf@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

These userspace programs include UAPI headers exported to usr/include/.
'make headers' always works for the target architecture (i.e. the same
architecture as the kernel), so the sample programs should be built for
the target as well. Kbuild now supports 'userprogs' for that.

I also guarded the CONFIG option by 'depends on CC_CAN_LINK' because
$(CC) may not provide libc.

The 'ifndef CROSS_COMPILE' is no longer needed.

BTW, the -m31 for s390 is left-over code. Commit 5a79859ae0f3 ("s390:
remove 31 bit support") killed it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2: None

 samples/Kconfig          |  2 +-
 samples/seccomp/Makefile | 42 +++-------------------------------------
 2 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index 9d236c346de5..8949e9646125 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -126,7 +126,7 @@ config SAMPLE_PIDFD
 
 config SAMPLE_SECCOMP
 	bool "Build seccomp sample code"
-	depends on SECCOMP_FILTER && HEADERS_INSTALL
+	depends on SECCOMP_FILTER && CC_CAN_LINK && HEADERS_INSTALL
 	help
 	  Build samples of seccomp filters using various methods of
 	  BPF filter construction.
diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
index 89279e8b87df..75916c23e416 100644
--- a/samples/seccomp/Makefile
+++ b/samples/seccomp/Makefile
@@ -1,44 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef CROSS_COMPILE
-hostprogs := bpf-fancy dropper bpf-direct user-trap
+userprogs := bpf-fancy dropper bpf-direct user-trap
 
-HOSTCFLAGS_bpf-fancy.o += -I$(objtree)/usr/include
-HOSTCFLAGS_bpf-fancy.o += -idirafter $(objtree)/include
-HOSTCFLAGS_bpf-helper.o += -I$(objtree)/usr/include
-HOSTCFLAGS_bpf-helper.o += -idirafter $(objtree)/include
 bpf-fancy-objs := bpf-fancy.o bpf-helper.o
 
-HOSTCFLAGS_dropper.o += -I$(objtree)/usr/include
-HOSTCFLAGS_dropper.o += -idirafter $(objtree)/include
-dropper-objs := dropper.o
+userccflags += -I usr/include
 
-HOSTCFLAGS_bpf-direct.o += -I$(objtree)/usr/include
-HOSTCFLAGS_bpf-direct.o += -idirafter $(objtree)/include
-bpf-direct-objs := bpf-direct.o
-
-HOSTCFLAGS_user-trap.o += -I$(objtree)/usr/include
-HOSTCFLAGS_user-trap.o += -idirafter $(objtree)/include
-user-trap-objs := user-trap.o
-
-# Try to match the kernel target.
-ifndef CONFIG_64BIT
-
-# s390 has -m31 flag to build 31 bit binaries
-ifndef CONFIG_S390
-MFLAG = -m32
-else
-MFLAG = -m31
-endif
-
-HOSTCFLAGS_bpf-direct.o += $(MFLAG)
-HOSTCFLAGS_dropper.o += $(MFLAG)
-HOSTCFLAGS_bpf-helper.o += $(MFLAG)
-HOSTCFLAGS_bpf-fancy.o += $(MFLAG)
-HOSTCFLAGS_user-trap.o += $(MFLAG)
-HOSTLDLIBS_bpf-direct += $(MFLAG)
-HOSTLDLIBS_bpf-fancy += $(MFLAG)
-HOSTLDLIBS_dropper += $(MFLAG)
-HOSTLDLIBS_user-trap += $(MFLAG)
-endif
-always-y := $(hostprogs)
-endif
+always-y := $(userprogs)
-- 
2.25.1
