Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:31221 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgDEQcV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 12:32:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
Date: Mon,  6 Apr 2020 01:30:52 +0900
Message-Id: <20200405163052.18942-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org
Cc: clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org

As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
CONFIG_SGI_IP32 is enabled.

The use of EXPORT_SYMBOL in static libraries potentially causes a
problem for the llvm linker [1]. So, I want to forcibly link lib-y
objects to vmlinux when CONFIG_MODULES=y.

As a groundwork, we must fix multiple definitions that have previously
been hidden by lib-y.

The prom_cleanup() in this file is already marked as __weak (because
it is overridden by the one in arch/mips/sgi-ip22/ip22-mc.c).
I think it should be OK to do the same for these two.

[1]: https://github.com/ClangBuiltLinux/linux/issues/515

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

If MIPS maintainers ack this patch,
I want to inser it before the following patch:

https://patchwork.kernel.org/patch/11432969/

 arch/mips/fw/arc/memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
index dbbcddc82823..89fa6e62a3b3 100644
--- a/arch/mips/fw/arc/memory.c
+++ b/arch/mips/fw/arc/memory.c
@@ -117,7 +117,7 @@ static int __init prom_memtype_classify(union linux_memtypes type)
 	return memtype_classify_arc(type);
 }
 
-void __init prom_meminit(void)
+void __weak __init prom_meminit(void)
 {
 	struct linux_mdesc *p;
 
@@ -162,7 +162,7 @@ void __weak __init prom_cleanup(void)
 {
 }
 
-void __init prom_free_prom_memory(void)
+void __weak __init prom_free_prom_memory(void)
 {
 	int i;
 
-- 
2.17.1
