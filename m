Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:54400 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932165AbeFPAzT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jun 2018 20:55:19 -0400
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH 0/3] Resolve -Wattribute-alias warnings from SYSCALL_DEFINEx()
Date: Fri, 15 Jun 2018 17:53:19 -0700
Message-ID: <20180616005323.7938-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mips@linux-mips.org, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Matthew Wilcox <matthew@wil.cx>, Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Matthias Kaehlcke <mka@chromium.org>, He Zhe <zhe.he@windriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michal Marek <michal.lkml@markovi.net>, Khem Raj <raj.khem@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Al Viro <viro@zeniv.linux.org.uk>, Stafford Horne <shorne@gmail.com>, Gideon Israel Dsouza <gidisrael@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Paul Burton <paul.burton@mips.com>

This series introduces infrastructure allowing compiler diagnostics to
be disabled or their severity modified for specific pieces of code, with
suitable abstractions to prevent that code from becoming tied to a
specific compiler.

This infrastructure is then used to disable the -Wattribute-alias
warning around syscall definitions, which rely on type mismatches to
sanitize arguments.

Finally PowerPC-specific #pragma's are removed now that the generic code
is handling this.

The series takes Arnd's RFC patches & addresses the review comments they
received. The most notable effect of this series to to avoid warnings &
build failures caused by -Wattribute-alias when compiling the kernel
with GCC 8.

Applies cleanly atop master as of 9215310cf13b ("Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net").

Thanks,
    Paul

Arnd Bergmann (2):
  kbuild: add macro for controlling warnings to linux/compiler.h
  disable -Wattribute-alias warning for SYSCALL_DEFINEx()

Paul Burton (1):
  Revert "powerpc: fix build failure by disabling attribute-alias
    warning in pci_32"

 arch/powerpc/kernel/pci_32.c   |  4 ---
 include/linux/compat.h         |  8 ++++-
 include/linux/compiler-gcc.h   | 66 ++++++++++++++++++++++++++++++++++
 include/linux/compiler_types.h | 18 ++++++++++
 include/linux/syscalls.h       |  4 +++
 5 files changed, 95 insertions(+), 5 deletions(-)

-- 
2.17.1

