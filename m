Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:65148 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751778AbdI1Kxa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Sep 2017 06:53:30 -0400
MIME-Version: 1.0
In-Reply-To: <20170926022835.30916-1-nick.desaulniers@gmail.com>
References: <20170926022835.30916-1-nick.desaulniers@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Sep 2017 19:52:35 +0900
Message-ID: <CAK7LNARwbqviGS4THmftO3mCkxpjPmQHxDbFjTsBXptyEG5cMg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clang: remove crufty HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Behan Webster <behanw@converseincode.com>, dl9pf@gmx.de, Mark Charlebois <charlebm@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Nick,

2017-09-26 11:28 GMT+09:00 Nick Desaulniers <nick.desaulniers@gmail.com>:
> When compiling with `make CC=clang HOSTCC=clang`, I was seeing warnings
> that clang did not recognize -fno-delete-null-pointer-checks for HOSTCC
> targets.  These were added in commit 61163efae020 ("kbuild: LLVMLinux:
> Add Kbuild support for building kernel with Clang").  That patch wraps
> that flag in cc-option for KBUILD_CFLAGS, but not hostcc-option for
> HOSTCFLAGS. Either hostcc-option did not exist, or the author was not
> setting HOSTCC to clang as well as CC when authored.
>
> It's not clear why the other warnings were disabled, and just for
> HOSTCFLAGS, but I can remove them, add -Werror to HOSTCFLAGS and compile
> with clang just fine.
>
> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> ---
> * It may also be worthwhile keep the old flags, and simply wrap
>   everything in hostcc-option.
>
>  Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d1119941261c..2e908969e0d8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -301,16 +301,12 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
>  HOSTCC       = gcc
>  HOSTCXX      = g++
>  HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
> +               $(call hostcc-option,-fno-delete-null-pointer-checks) \
>                 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)


You call hostcc-option
before Kbuild.include is included around line 341.

So, $(call hostcc-option, ...) returns always an empty string here
whether the compiler supports the option or not.



>  HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
>  HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
>  HOST_LOADLIBES := $(HOST_LFS_LIBS)
>
> -ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
> -HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
> -               -Wno-missing-field-initializers -fno-delete-null-pointer-checks
> -endif
> -


The logic is very strange in the first place.

Even very old GCC supports -fno-delete-null-pointer-checks,
but clang does not.

Here, -fno-delete-null-pointer-checks is added only when
we are using clang for HOSTCC.  This is opposite.

I guess we can remove all of them
unless somebody can explain the rationale.



>  # Decide whether to build built-in, modular, or both.
>  # Normally, just do built-in.
>




-- 
Best Regards
Masahiro Yamada
