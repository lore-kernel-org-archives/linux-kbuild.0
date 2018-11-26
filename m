Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34451 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbeKZViU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Nov 2018 16:38:20 -0500
MIME-Version: 1.0
References: <20181031111444.3472-1-malat@debian.org>
In-Reply-To: <20181031111444.3472-1-malat@debian.org>
From: Mathieu Malaterre <malat@debian.org>
Date: Mon, 26 Nov 2018 11:44:25 +0100
Message-ID: <CA+7wUsxQEeFrPaSYymwrH31e0po0_5b7zCQG=6yKM064LikGiQ@mail.gmail.com>
Subject: Re: [PATCH] remove old GCC version implementation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Oct 31, 2018 at 12:15 PM Mathieu Malaterre <malat@debian.org> wrote:
>
> GCC 4.6 is the minimum supported now.
>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>  scripts/mod/file2alias.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 28a61665bb9c..4b59564d4706 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -83,11 +83,7 @@ extern struct devtable *__start___devtable[], *__stop___devtable[];
>  #endif /* __MACH__ */
>
>  #if !defined(__used)
> -# if __GNUC__ == 3 && __GNUC_MINOR__ < 3
> -#  define __used                       __attribute__((__unused__))
> -# else
> -#  define __used                       __attribute__((__used__))
> -# endif
> +#define __used                 __attribute__((__used__))
>  #endif

Superseded by:

https://patchwork.kernel.org/patch/10693483/

>  /* Define a variable f that holds the value of field f of struct devid
> --
> 2.11.0
>
