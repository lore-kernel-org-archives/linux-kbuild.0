Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64763 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfF3BgH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Jun 2019 21:36:07 -0400
MIME-Version: 1.0
References: <20190627163903.28398-1-yamada.masahiro@socionext.com> <20190627163903.28398-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190627163903.28398-2-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 30 Jun 2019 10:35:24 +0900
Message-ID: <CAK7LNAQ4Z0BxqFrNdQDWJqbJBW9bSvnzVkvJTZZ-1mMKD7Y6SQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] kbuild: compile-test UAPI headers to ensure they
 are self-contained
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Song Liu <songliubraving@fb.com>, Michal Marek <michal.lkml@markovi.net>, bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, Jani Nikula <jani.nikula@intel.com>, Networking <netdev@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yonghong Song <yhs@fb.com>, linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>, Martin KaFai Lau <kafai@fb.com>

On Fri, Jun 28, 2019 at 1:40 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Multiple people have suggested compile-testing UAPI headers to ensure
> they can be really included from user-space. "make headers_check" is
> obviously not enough to catch bugs, and we often leak references to
> kernel-space definition to user-space.
>
> Use the new header-test-y syntax to implement it. Please note exported
> headers are compile-tested with a completely different set of compiler
> flags. The header search path is set to $(objtree)/usr/include since
> exported headers should not include unexported ones.
>
> We use -std=gnu89 for the kernel space since the kernel code highly
> depends on GNU extensions. On the other hand, UAPI headers should be
> written in more standardized C, so they are compiled with -std=c90.
> This will emit errors if C++ style comments, the keyword 'inline', etc.
> are used. Please use C style comments (/* ... */), '__inline__', etc.
> in UAPI headers.
>
> There is additional compiler requirement to enable this test because
> many of UAPI headers include <stdlib.h>, <sys/ioctl.h>, <sys/time.h>,
> etc. directly or indirectly. You cannot use kernel.org pre-built
> toolchains [1] since they lack <stdlib.h>.
>
> I added scripts/cc-system-headers.sh to check the system header
> availability, which CONFIG_UAPI_HEADER_TEST depends on.


Perhaps, we could use scripts/cc-can-link.sh for this purpose.

The intention is slightly different, but a compiler to link
user-space programs must provide necessary standard headers.


-- 
Best Regards
Masahiro Yamada
