Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:32558 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfJXRUm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 13:20:42 -0400
MIME-Version: 1.0
References: <20191016051215.10909-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191016051215.10909-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Oct 2019 02:20:00 +0900
Message-ID: <CAK7LNAQE=rewN+ei8C=9jq-79ki=foPtXwxbXTAOSRYhw6kJAA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unneeded variable, single-all
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Oct 16, 2019 at 2:12 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> When single-build is set, everything in $(MAKECMDGOALS) is a single
> target. You can use $(MAKECMDGOALS) to list out the single targets.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild.

>  Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ffd7a912fc46..710199f60c30 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1764,11 +1764,9 @@ tools/%: FORCE
>
>  ifdef single-build
>
> -single-all := $(filter $(single-targets), $(MAKECMDGOALS))
> -
>  # .ko is special because modpost is needed
> -single-ko := $(sort $(filter %.ko, $(single-all)))
> -single-no-ko := $(sort $(patsubst %.ko,%.mod, $(single-all)))
> +single-ko := $(sort $(filter %.ko, $(MAKECMDGOALS)))
> +single-no-ko := $(sort $(patsubst %.ko,%.mod, $(MAKECMDGOALS)))
>
>  $(single-ko): single_modpost
>         @:
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
