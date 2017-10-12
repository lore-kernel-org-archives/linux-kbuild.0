Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:60088 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751587AbdJLA5z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2017 20:57:55 -0400
MIME-Version: 1.0
In-Reply-To: <20171007202323.1993-1-nick.desaulniers@gmail.com>
References: <CAK7LNARTo+esxqmoLrXufRoP7qbJprwVOYiRB-a2jRd=AZ0sXg@mail.gmail.com>
 <20171007202323.1993-1-nick.desaulniers@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Oct 2017 09:56:55 +0900
Message-ID: <CAK7LNARtsLpYnPFK7kVMo6EhC_knHGxWLKum=3OFwNb_dHhTAw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: clang: remove crufty HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Behan Webster <behanw@converseincode.com>, dl9pf@gmx.de, Mark Charlebois <charlebm@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-08 5:23 GMT+09:00 Nick Desaulniers <nick.desaulniers@gmail.com>:
> When compiling with `make CC=clang HOSTCC=clang`, I was seeing warnings
> that clang did not recognize -fno-delete-null-pointer-checks for HOSTCC
> targets.  These were added in commit 61163efae020 ("kbuild: LLVMLinux:
> Add Kbuild support for building kernel with Clang").
>
> Clang does not support -fno-delete-null-pointer-checks, so adding it to
> HOSTCFLAGS if HOSTCC is clang does not make sense.
>
> It's not clear why the other warnings were disabled, and just for
> HOSTCFLAGS, but I can remove them, add -Werror to HOSTCFLAGS and compile
> with clang just fine.
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> ---
>  Makefile | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index cf007a31d575..5853d9492590 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -306,11 +306,6 @@ HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
>  HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
>  HOST_LOADLIBES := $(HOST_LFS_LIBS)
>
> -ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
> -HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
> -               -Wno-missing-field-initializers -fno-delete-null-pointer-checks
> -endif

Applied to linux-kbuild/kbuild.  Thanks.



-- 
Best Regards
Masahiro Yamada
