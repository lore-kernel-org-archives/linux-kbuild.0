Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:34184 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbeKUQs0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Nov 2018 11:48:26 -0500
MIME-Version: 1.0
References: <20181115005602.30746-1-paul.walmsley@sifive.com> <20181115005602.30746-2-paul.walmsley@sifive.com>
In-Reply-To: <20181115005602.30746-2-paul.walmsley@sifive.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Nov 2018 15:14:25 +0900
Message-ID: <CAK7LNATQL78X2aLsAM9YQb3oCZOb+kQkB2NkoX8r=rBsH7e7mQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] modpost: drop unused command line switches
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: paul.walmsley@sifive.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>

On Thu, Nov 15, 2018 at 9:56 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Drop modpost command line switches that are no longer used by
> makefile.modpost, upon request from Sam Ravnborg <sam@ravnborg.org>,
> who wrote:
>
>     modpost is not supposed to be used outside the kernel build. [...]
>     I checked if there were any options supported by modpost that
>     was not configurable in makefile.modpost.
>     And I could see that the -M and -K options in getopt() was leftovers.
>     The code that used these option was was dropped in:
>     commit a8773769d1a1 ("Kbuild: clear marker out of modpost")
>
>     Could you add a patch that delete these on top of what you already have.
>
> https://lore.kernel.org/lkml/20181020140835.GA3351@ravnborg.org/
>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---

Applied to linux-kbuild.
Thanks!



>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0d998c54564d..85bd93c63180 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2416,7 +2416,7 @@ int main(int argc, char **argv)
>         struct ext_sym_list *extsym_iter;
>         struct ext_sym_list *extsym_start = NULL;
>
> -       while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awM:K:E")) != -1) {
> +       while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awE")) != -1) {
>                 switch (opt) {
>                 case 'i':
>                         kernel_read = optarg;
> --
> 2.19.1
>


-- 
Best Regards
Masahiro Yamada
