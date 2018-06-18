Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:41150 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752650AbeFRNGA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jun 2018 09:06:00 -0400
MIME-Version: 1.0
In-Reply-To: <20180616005323.7938-1-paul.burton@mips.com>
References: <20180616005323.7938-1-paul.burton@mips.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Jun 2018 15:05:57 +0200
Message-ID: <CAK8P3a2Yz-02On2K2U0+8+tR8RQCQ+KWh7CrtqL9L+FweP+TPQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Resolve -Wattribute-alias warnings from SYSCALL_DEFINEx()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Burton <paul.burton@mips.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Ingo Molnar <mingo@kernel.org>, Matthew Wilcox <matthew@wil.cx>, Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Matthias Kaehlcke <mka@chromium.org>, He Zhe <zhe.he@windriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michal Marek <michal.lkml@markovi.net>, Khem Raj <raj.khem@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Al Viro <viro@zeniv.linux.org.uk>, Stafford Horne <shorne@gmail.com>, Gideon Israel Dsouza <gidisrael@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Sat, Jun 16, 2018 at 2:53 AM, Paul Burton <paul.burton@mips.com> wrote:
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
> Applies cleanly atop master as of 9215310cf13b ("Merge
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net").
>

Sorry I dropped the ball on this earlier, and thanks a lot for picking
it up again! From what I can tell, your version addresses all issues
I was aware of, so we should merge that.

      Arnd
