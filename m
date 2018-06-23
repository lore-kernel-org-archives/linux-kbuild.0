Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:43018 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751769AbeFWIlE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jun 2018 04:41:04 -0400
MIME-Version: 1.0
In-Reply-To: <20180619201458.4559-1-paul.burton@mips.com>
References: <20180619190225.7eguhiw3ixaiwpgl@pburton-laptop> <20180619201458.4559-1-paul.burton@mips.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 23 Jun 2018 17:40:12 +0900
Message-ID: <CAK7LNASFqH7a1ZLhp_aLQXTPxODPbctVwEZ+5SL1OMp0kRQJGQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Resolve -Wattribute-alias warnings from SYSCALL_DEFINEx()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Burton <paul.burton@mips.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Matthew Wilcox <matthew@wil.cx>, Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Matthias Kaehlcke <mka@chromium.org>, He Zhe <zhe.he@windriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michal Marek <michal.lkml@markovi.net>, Khem Raj <raj.khem@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Al Viro <viro@zeniv.linux.org.uk>, Stafford Horne <shorne@gmail.com>, Gideon Israel Dsouza <gidisrael@gmail.com>, Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

2018-06-20 5:14 GMT+09:00 Paul Burton <paul.burton@mips.com>:
> This series introduces infrastructure allowing compiler diagnostics to
> be disabled or their severity modified for specific pieces of code, with
> suitable abstractions to prevent that code from becoming tied to a
> specific compiler.
>
> This infrastructure is then used to disable the -Wattribute-alias
> warning around syscall definitions, which rely on type mismatches to
> sanitize arguments.
>
> Finally PowerPC-specific #pragma's are removed now that the generic code
> is handling this.
>
> The series takes Arnd's RFC patches & addresses the review comments they
> received. The most notable effect of this series to to avoid warnings &
> build failures caused by -Wattribute-alias when compiling the kernel
> with GCC 8.
>
> Applies cleanly atop v4.18-rc1.


Series, applied to linux-kbuild/fixes.
(since we need to fix warnings from GCC 8.1)


Thanks!



-- 
Best Regards
Masahiro Yamada
