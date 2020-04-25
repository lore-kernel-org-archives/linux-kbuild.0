Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:26282 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgDYRA1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 13:00:27 -0400
MIME-Version: 1.0
References: <20200413153320.93316-1-masahiroy@kernel.org>
In-Reply-To: <20200413153320.93316-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 26 Apr 2020 01:59:14 +0900
Message-ID: <CAK7LNAS0vPy0nY8YqzsWWoSB5rgxqSe9_KLCsJoUAu_F5=57iQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: do not use OR-assignment for zero-cleared structure
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Apr 14, 2020 at 12:33 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The simple assignment is enough because memset() three lines above
> has zero-cleared the structure.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/kconfig/symbol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 3dc81397d003..9363e37b8870 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -831,7 +831,7 @@ struct symbol *sym_lookup(const char *name, int flags)
>         memset(symbol, 0, sizeof(*symbol));
>         symbol->name = new_name;
>         symbol->type = S_UNKNOWN;
> -       symbol->flags |= flags;
> +       symbol->flags = flags;
>
>         symbol->next = symbol_hash[hash];
>         symbol_hash[hash] = symbol;
> --
> 2.25.1
>

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
