Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:47077 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757229AbeFSNBd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jun 2018 09:01:33 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/3] Revert "powerpc: fix build failure by disabling attribute-alias warning in pci_32"
In-Reply-To: <20180616005323.7938-4-paul.burton@mips.com>
References: <20180616005323.7938-1-paul.burton@mips.com> <20180616005323.7938-4-paul.burton@mips.com>
Date: Tue, 19 Jun 2018 23:01:27 +1000
Message-ID: <87tvpzvsk8.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Burton <paul.burton@mips.com>, linux-kbuild@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mips@linux-mips.org, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Matthew Wilcox <matthew@wil.cx>, Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Matthias Kaehlcke <mka@chromium.org>, He Zhe <zhe.he@windriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michal Marek <michal.lkml@markovi.net>, Khem Raj <raj.khem@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Al Viro <viro@zeniv.linux.org.uk>, Stafford Horne <shorne@gmail.com>, Gideon Israel Dsouza <gidisrael@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

Paul Burton <paul.burton@mips.com> writes:
> With SYSCALL_DEFINEx() disabling -Wattribute-alias generically, there's
> no need to duplicate that for PowerPC's pciconfig_iobase syscall.
>
> This reverts commit 415520373975 ("powerpc: fix build failure by
> disabling attribute-alias warning in pci_32").
>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

> ---
>
>  arch/powerpc/kernel/pci_32.c | 4 ----
>  1 file changed, 4 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
