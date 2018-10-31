Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38290 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbeJaU0M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Oct 2018 16:26:12 -0400
MIME-Version: 1.0
References: <20181031111444.3472-1-malat@debian.org>
In-Reply-To: <20181031111444.3472-1-malat@debian.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 31 Oct 2018 12:28:19 +0100
Message-ID: <CANiq72mj_iHvxqAEqhGoLT61Tc04-zN6f7Gv1jyNeb6d0R2LGw@mail.gmail.com>
Subject: Re: [PATCH] remove old GCC version implementation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: malat@debian.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Oct 31, 2018 at 12:18 PM Mathieu Malaterre <malat@debian.org> wrote:
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
>

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

By the way, is it possible that scripts/ and similar stuff uses
directly include/linux/compiler_attributes.h (whenever it hits
mainline, see https://github.com/ojeda/linux/blob/compiler-attributes/include/linux/compiler_attributes.h
)? It is a header that does not depend on anything, so it could easily
be shared; and would avoid having to maintain two sets of attributes.
Let me know, I can take a look at it if you think it is a good idea.

Cheers,
Miguel
