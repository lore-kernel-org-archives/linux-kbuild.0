Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:29280 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbeHQE54 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Aug 2018 00:57:56 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w7H1uR7X014880
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Aug 2018 10:56:28 +0900
Received: by mail-ua1-f47.google.com with SMTP id g18-v6so4847274uam.6
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Aug 2018 18:56:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180816001350.7516-1-mforney@mforney.org>
References: <20180816001350.7516-1-mforney@mforney.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 17 Aug 2018 10:55:46 +0900
Message-ID: <CAK7LNATTO2y+4bx7+wXEFrTm6iDB-cLGMKLC2C2UAE+oyTShoQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add a space after `!` to prevent parsing as file pattern
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Forney <mforney@mforney.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-08-16 9:13 GMT+09:00 Michael Forney <mforney@mforney.org>:
> Some shells use !(pattern|...|pattern) to match file names not
> containing the specified patterns. This may result in output like
>
>   $ ./scripts/clang-version.sh gcc
>   ./scripts/clang-version.sh[18]: COPYING: not found
>   printf: %d __clang_major__: conversion error
>   printf: %d __clang_minor__: conversion error
>   printf: %d __clang_patchlevel__: conversion error
>   00000
>   $
>
> and set CONFIG_CLANG_VERSION to the invalid value '00000'.
>
> POSIX says[0]
>
>   If the pipeline begins with the reserved word ! and command1 is a
>   subshell command, the application shall ensure that the ( operator at
>   the beginning of command1 is separated from the ! by one or more
>   <blank> characters. The behavior of the reserved word ! immediately
>   followed by the ( operator is unspecified.
>
> So, just add a <blank> to prevent this.
>
> [0] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_09_02
>
> Signed-off-by: Michael Forney <mforney@mforney.org>

Applied to linux-kbuild. Thanks!


> ---
>  scripts/clang-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
> index dbf0a31eb111..e65fbc3079d4 100755
> --- a/scripts/clang-version.sh
> +++ b/scripts/clang-version.sh
> @@ -12,7 +12,7 @@
>
>  compiler="$*"
>
> -if !( $compiler --version | grep -q clang) ; then
> +if ! ( $compiler --version | grep -q clang) ; then
>         echo 0
>         exit 1
>  fi
> --
> 2.17.1
>



-- 
Best Regards
Masahiro Yamada
