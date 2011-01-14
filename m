Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta11.emeryville.ca.mail.comcast.net ([76.96.27.211]:40996
	"EHLO qmta11.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757817Ab1ANOT2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:19:28 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 10/27] um: change to new flag variables
Date: Fri, 14 Jan 2011 06:12:33 -0800
Message-Id: <5aad31d623bac32d84886aa95e8ac0b934df1a49.1295006565.git.mfm@muteddisk.com>
In-Reply-To: <cover.1295006561.git.mfm@muteddisk.com>
References: <cover.1295006561.git.mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y and EXTRA_AFLAGS with asflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
---
 arch/um/sys-ppc/Makefile |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/um/sys-ppc/Makefile b/arch/um/sys-ppc/Makefile
index b8bc844..20d363b 100644
--- a/arch/um/sys-ppc/Makefile
+++ b/arch/um/sys-ppc/Makefile
@@ -6,7 +6,7 @@ OBJ = built-in.o
 OBJS = ptrace.o sigcontext.o checksum.o miscthings.o misc.o \
 	ptrace_user.o sysrq.o
 
-EXTRA_AFLAGS := -DCONFIG_PPC32 -I. -I$(srctree)/arch/ppc/kernel
+asflags-y := -DCONFIG_PPC32 -I. -I$(srctree)/arch/ppc/kernel
 
 all: $(OBJ)
 
@@ -15,10 +15,10 @@ $(OBJ): $(OBJS)
 	$(LD) $(LINKFLAGS) --start-group $^ --end-group -o $@
 
 ptrace_user.o: ptrace_user.c
-	$(CC) -D__KERNEL__ $(USER_CFLAGS) $(EXTRA_CFLAGS) -c -o $@ $<
+	$(CC) -D__KERNEL__ $(USER_CFLAGS) $(ccflags-y) -c -o $@ $<
 
 sigcontext.o: sigcontext.c
-	$(CC) $(USER_CFLAGS) $(EXTRA_CFLAGS) -c -o $@ $<
+	$(CC) $(USER_CFLAGS) $(ccflags-y) -c -o $@ $<
 
 checksum.S:
 	rm -f $@
@@ -53,13 +53,13 @@ ppc_defs.h: mk_defs.c ppc_defs.head \
 checksum.o: checksum.S
 	rm -f asm
 	ln -s $(srctree)/include/asm-ppc asm
-	$(CC) $(EXTRA_AFLAGS) $(KBUILD_AFLAGS) -D__ASSEMBLY__ -D__UM_PPC__ -c $< -o $*.o
+	$(CC) $(asflags-y) $(KBUILD_AFLAGS) -D__ASSEMBLY__ -D__UM_PPC__ -c $< -o $*.o
 	rm -f asm
 
 misc.o: misc.S ppc_defs.h
 	rm -f asm
 	ln -s $(srctree)/include/asm-ppc asm
-	$(CC) $(EXTRA_AFLAGS) $(KBUILD_AFLAGS) -D__ASSEMBLY__ -D__UM_PPC__ -c $< -o $*.o
+	$(CC) $(asflags-y) $(KBUILD_AFLAGS) -D__ASSEMBLY__ -D__UM_PPC__ -c $< -o $*.o
 	rm -f asm
 
 clean-files := $(OBJS) ppc_defs.h checksum.S mk_defs.c
-- 
1.7.3.4

