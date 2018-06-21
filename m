Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:44131 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932813AbeFUADx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jun 2018 20:03:53 -0400
Date: Wed, 20 Jun 2018 17:02:23 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 1/3] kbuild: add macro for controlling warnings to
 linux/compiler.h
Message-ID: <20180621000223.lpiilk2f6zosouuu@pburton-laptop>
References: <20180616005323.7938-1-paul.burton@mips.com>
 <20180616005323.7938-2-paul.burton@mips.com>
 <CAK7LNASvCha27kU4ipn23uOpNuxkzJrNzWBwYcxN4n=3xtv8SA@mail.gmail.com>
 <20180619190225.7eguhiw3ixaiwpgl@pburton-laptop>
 <CAK7LNAQRu0p8_8DqEdmUUPfc4gC60SSj90vTpz3iKaiE596-TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQRu0p8_8DqEdmUUPfc4gC60SSj90vTpz3iKaiE596-TA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Ingo Molnar <mingo@kernel.org>, Matthew Wilcox <matthew@wil.cx>, Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Matthias Kaehlcke <mka@chromium.org>, He Zhe <zhe.he@windriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michal Marek <michal.lkml@markovi.net>, Khem Raj <raj.khem@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Al Viro <viro@zeniv.linux.org.uk>, Stafford Horne <shorne@gmail.com>, Gideon Israel Dsouza <gidisrael@gmail.com>, Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

Hi Masahiro,

On Thu, Jun 21, 2018 at 08:21:01AM +0900, Masahiro Yamada wrote:
> V2 is good except one nit.
> (I left a comment in it)

Thanks, and yes I agree with your comment that the GCC<4.6 __diag()
definition can be removed.

> I can fix it up locally if it is tedious to re-spin, though.

If you wouldn't mind that'd be great :)

Thanks,
    Paul
