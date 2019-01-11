Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:49632 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfAKDX1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Jan 2019 22:23:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] KVM: powerpc: remove -I. header search paths
Date: Fri, 11 Jan 2019 12:22:31 +0900
Message-Id: <1547176954-17739-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547176954-17739-1-git-send-email-yamada.masahiro@socionext.com>
References: <1547176954-17739-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Paul Mackerras <paulus@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org

The header search path -I. in kernel Makefiles is very suspicious;
it allows the compiler to search for headers in the top of $(srctree),
where obviously no header file exists.

Commit 46f43c6ee022 ("KVM: powerpc: convert marker probes to event
trace") first added these options, but they are completely useless.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/powerpc/kvm/Makefile | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 64f1135..3223aec 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -10,11 +10,6 @@ common-objs-y = $(KVM)/kvm_main.o $(KVM)/eventfd.o
 common-objs-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
 common-objs-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
 
-CFLAGS_e500_mmu.o := -I.
-CFLAGS_e500_mmu_host.o := -I.
-CFLAGS_emulate.o  := -I.
-CFLAGS_emulate_loadstore.o  := -I.
-
 common-objs-y += powerpc.o emulate_loadstore.o
 obj-$(CONFIG_KVM_EXIT_TIMING) += timing.o
 obj-$(CONFIG_KVM_BOOK3S_HANDLER) += book3s_exports.o
-- 
2.7.4
