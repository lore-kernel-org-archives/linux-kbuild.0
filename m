Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from galactus.symlabs.net ([91.121.6.203]:45641 "EHLO symlabs.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751009AbYEAFR0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 01:17:26 -0400
Message-ID: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net>
Date: Thu, 1 May 2008 07:07:55 +0200 (CEST)
Subject: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible
     by gas
From: sampo@symlabs.com
Reply-To: sampo@symlabs.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sampo@symlabs.com

Platform: x86
Compiler: gcc-3.4.6
Binutils: 2.17.50.0.8
Kernel under build: 2.6.25 (from kernel.org)

Problem: Build fails due to incompatibility of asm-offsets.h with
assembler. See below:

gcc -Wp,-MD,arch/x86/kernel/.entry_32.o.d  -nostdinc -isystem
/apps/gcc/3.4.6/lib/gcc/i686-pc-linux-gnu/3.4.6/include -D__KERNEL__
-Iinclude  -include include/linux/autoconf.h -D__ASSEMBLY__ -m32
-DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1
-Iinclude/asm-x86/mach-default     -c -o arch/x86/kernel/entry_32.o
arch/x86/kernel/entry_32.S
include/asm/asm-offsets.h: Assembler messages:
include/asm/asm-offsets.h:10: Error: invalid character '_' in mnemonic
include/asm/asm-offsets.h:11: Error: invalid character '_' in mnemonic
include/asm/asm-offsets.h:12: Error: invalid character '_' in mnemonic
include/asm/asm-offsets.h:13: Error: invalid character '_' in mnemonic
include/asm/asm-offsets.h:14: Error: invalid character '_' in mnemonic
include/asm/asm-offsets.h:15: Error: invalid character '_' in mnemonic
(snip - much more of the same)

Analysis:

1. All errors are related to use of offsetof() macro. The asm-offsets.h
   contains lines like

     IA32_SIGCONTEXT_ax $44 offsetof(struct sigcontext, ax)	#

2. offsetof() macro is defined in include/linux/stddef.h. It appears
   to rely on __compiler_offsetof() which maps to __builtin_offsetof()
   on gcc-4.x, but on gcc-3.4.6 the definition is as follows

     #define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

   I believe this C syntax is what is causing indigestion to gas.

3. The compilation can be forced to proceed bit further by
   adding to beginning of .S files #define __ASM_OFFSETS_H__
   which prevents the problematic include from being included.
   However, some .S files actually need the definitions.

4. In Documentation/Changes file the compiler requirement is
   documented as gcc-3.2. Therefore it seems reasonable to expect
   gcc-3.4.6 to work.

5. Last time I compiled kernel was 2.6.23.9. Back then this
   problem did not exist. The toolchain is the same as used back then.

6. googling did not return any enlightening entries, thus I presume
   this problem has not been reported yet.

Cheers,
--Sampo


