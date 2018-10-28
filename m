Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:48540 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbeJ2BWI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Oct 2018 21:22:08 -0400
MIME-Version: 1.0
References: <20181024040354.24879-1-leobras.c@gmail.com> <20181024040354.24879-3-leobras.c@gmail.com>
In-Reply-To: <20181024040354.24879-3-leobras.c@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Oct 2018 01:36:20 +0900
Message-ID: <CAK7LNASfo=hw6r6GtdcLdkKCGVFpXUASvSst6WO5tcFbaZ-X0Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] kbuild: Removes unnecessary shadowed local variable.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>
Cc: lkcamp@lists.libreplanetbr.org, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Oct 24, 2018 at 1:04 PM Leonardo Bras <leobras.c@gmail.com> wrote:
>
> Removes an unnecessary shadowed local variable (start).
> It was used only once, with the same value it was started before
> the if block.
>
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>



Applied to linux-kbuild
with some fixups in the subject.

Please do not add a period to the end of the subject.






> ---
>  scripts/asn1_compiler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
> index c146020fc783..1b28787028d3 100644
> --- a/scripts/asn1_compiler.c
> +++ b/scripts/asn1_compiler.c
> @@ -413,7 +413,7 @@ static void tokenise(char *buffer, char *end)
>
>                         /* Handle string tokens */
>                         if (isalpha(*p)) {
> -                               const char **dir, *start = p;
> +                               const char **dir;
>
>                                 /* Can be a directive, type name or element
>                                  * name.  Find the end of the name.
> --
> 2.19.1
>


-- 
Best Regards
Masahiro Yamada
