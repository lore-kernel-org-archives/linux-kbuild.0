Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25257 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751279AbdGQLNc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jul 2017 07:13:32 -0400
MIME-Version: 1.0
In-Reply-To: <1500199925-5542-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1499938671-13376-1-git-send-email-caoj.fnst@cn.fujitsu.com> <1500199925-5542-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 17 Jul 2017 20:13:15 +0900
Message-ID: <CAK7LNAQiOSdMYqV+U_155iNaL-cBWn99kLu8uczW9pKR-Gwkww@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: trivial cleanups on the comments
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

Hi Cao,


2017-07-16 19:12 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> index 61f87a9..f0a4ada 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -85,8 +85,8 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
>
>  # try-run
>  # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> -# Exit code chooses option. "$$TMP" is can be used as temporary file and
> -# is automatically cleaned up.
> +# Exit code chooses option. "$$TMP" serves as temporary file and is
> +# automatically cleaned up.


I am not a native speaker, but I think "file" is countable.

Maybe, is "as a temporary file" even better?




> diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
> index ec10d93..edd983f 100644
> --- a/scripts/basic/Makefile
> +++ b/scripts/basic/Makefile
> @@ -1,5 +1,5 @@
>  ###
> -# Makefile.basic lists the most basic programs used during the build process.
> +# scripts/basic/Makefile lists the most basic programs used during the build process.

This change is correct, but this line will exceed 80 cols limit.

Wrap the lines, or reword like "This Makefile lists ..."

Either will do.



>  # The programs listed herein are what are needed to do the basic stuff,
>  # such as fix file dependencies.
>  # This initial step is needed to avoid files to be recompiled






-- 
Best Regards
Masahiro Yamada
