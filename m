Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37624 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754908AbdCKNfE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Mar 2017 08:35:04 -0500
MIME-Version: 1.0
In-Reply-To: <20170222150833.83149-1-richard.weiyang@gmail.com>
References: <20170222150833.83149-1-richard.weiyang@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 11 Mar 2017 22:34:50 +0900
Message-ID: <CAK7LNATuG=RqghbmGrx99E95fFAbx9U8DUPp0XQtEO+fbBr-mA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: strip the last slash in KBUILD_EXTMOD
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Wei,


2017-02-23 0:08 GMT+09:00 Wei Yang <richard.weiyang@gmail.com>:
> Current kbuild will build the target again if we run "make M=dir" and "make
> M=dir/" by turns, since if_changed will see the prerequisite is changed.
> The behavior may confuse the user a little, since actually we are building
> the same target and no difference.
>
> According to current implementation in scripts/Makefile.build, the obj
> passed to next level is a directory name with last slash stripped. This
> patch strips the last slash in KBUILD_EXTMOD which is assigned from "M=".
>
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> ---
>  Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index b1037774e8e8..db6ed60928ab 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -184,13 +184,15 @@ endif
>  # Old syntax make ... SUBDIRS=$PWD is still supported
>  # Setting the environment variable KBUILD_EXTMOD take precedence
>  ifdef SUBDIRS
> -  KBUILD_EXTMOD ?= $(SUBDIRS)
> +  __KBUILD_EXTMOD ?= $(SUBDIRS)
>  endif
>
>  ifeq ("$(origin M)", "command line")
> -  KBUILD_EXTMOD := $(M)
> +  __KBUILD_EXTMOD := $(M)
>  endif
>
> +KBUILD_EXTMOD = $(patsubst %/,%,$(__KBUILD_EXTMOD))
> +
>  # If building an external module we do not care about the all: rule
>  # but instead _all depend on modules
>  PHONY += all

This patch would break a use-case
where KBUILD_EXTMOD is given as an environment.



Maybe adding the following should be enough?

KBUILD_EXTMOD := $(patsubst %/,%,$(KBUILD_EXTMOD))


-- 
Best Regards
Masahiro Yamada
