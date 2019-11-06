Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:44274 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfKFPkE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 10:40:04 -0500
MIME-Version: 1.0
References: <20191029123809.29301-1-yamada.masahiro@socionext.com> <20191029123809.29301-5-yamada.masahiro@socionext.com>
In-Reply-To: <20191029123809.29301-5-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Nov 2019 00:39:08 +0900
Message-ID: <CAK7LNATq5vK36hs0W3Ywu7j1xy6FgJxB7E3serAv6B1LmVA-nA@mail.gmail.com>
Subject: Re: [PATCH 4/4] mospost: remove unneeded local variable in contains_namespace()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jessica Yu <jeyu@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Oct 29, 2019 at 9:38 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The local variable, ns_entry, is unneeded.
>
> While I was here, I also cleaned up the comparison with NULL or 0.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Fixed the typo in the subject ( mospost -> modpost )
and applied to linux-kbuild.


>
>  scripts/mod/modpost.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f7425f5d4ab0..f70b924f379f 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -239,10 +239,8 @@ static struct symbol *find_symbol(const char *name)
>  static bool contains_namespace(struct namespace_list *list,
>                                const char *namespace)
>  {
> -       struct namespace_list *ns_entry;
> -
> -       for (ns_entry = list; ns_entry != NULL; ns_entry = ns_entry->next)
> -               if (strcmp(ns_entry->namespace, namespace) == 0)
> +       for (; list; list = list->next)
> +               if (!strcmp(list->namespace, namespace))
>                         return true;
>
>         return false;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
