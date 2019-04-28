Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61543 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfD1Bep (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Apr 2019 21:34:45 -0400
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x3S1YdXX027030
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Apr 2019 10:34:39 +0900
Received: by mail-vk1-f179.google.com with SMTP id q189so1578821vkq.11
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Apr 2019 18:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <497562b7-c07e-9067-5b7f-f96844bfc5bf@nvidia.com> <20190427152133.148944-1-ddadap@nvidia.com>
In-Reply-To: <20190427152133.148944-1-ddadap@nvidia.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Apr 2019 10:34:02 +0900
Message-ID: <CAK7LNARW7nEYtTWMSx0_RvzOt7FHjha9xPxa8mjuJX=oV5VVEw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: override locale from environment when running recordmcount.pl
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, Apr 28, 2019 at 12:23 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>
> recordmcount.pl uses a set of regular expressions to parse the output of
> objdump(1). However, if objdump(1) output is localized, it may not match
> the regular expressions, thereby preventing recordmcount.pl from parsing
> object files correctly.
>
> In order to allow recordmcount.pl to function correctly regardless of the
> current locale settings, set LANG=C when running objdump(1). LC_ALL is
> already unset in the top-level Makefile, so it is not necessary to also
> override that environment variable.
>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> Reviewed-by: Robert Morell <rmorell@nvidia.com>


Applied to linux-kbuild.
Thanks.

> ---
>  scripts/recordmcount.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
> index 68841d01162c..ffea46287f83 100755
> --- a/scripts/recordmcount.pl
> +++ b/scripts/recordmcount.pl
> @@ -493,7 +493,7 @@ sub update_funcs
>  #
>  # Step 2: find the sections and mcount call sites
>  #
> -open(IN, "$objdump -hdr $inputfile|") || die "error running $objdump";
> +open(IN, "LANG=C $objdump -hdr $inputfile|") || die "error running $objdump";
>
>  my $text;
>
> --
> 2.18.1
>


-- 
Best Regards
Masahiro Yamada
