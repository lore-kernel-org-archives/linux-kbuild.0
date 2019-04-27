Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:63594 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfD0G4I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Apr 2019 02:56:08 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x3R6ttAD016728
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Apr 2019 15:55:56 +0900
Received: by mail-ua1-f44.google.com with SMTP id f9so832442ual.1
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Apr 2019 23:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190424175550.142553-1-ddadap@nvidia.com>
In-Reply-To: <20190424175550.142553-1-ddadap@nvidia.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 27 Apr 2019 15:55:18 +0900
Message-ID: <CAK7LNATXeak-PyUFQXq-DhUpC2zmKpCQovqwLFoY9JwkE5xxtQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: override locale from environment when running recordmcount.pl
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Apr 25, 2019 at 2:56 AM Daniel Dadap <ddadap@nvidia.com> wrote:
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
> ---
>  scripts/recordmcount.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
> index 68841d01162c..b7bcdc71e6e8 100755
> --- a/scripts/recordmcount.pl
> +++ b/scripts/recordmcount.pl
> @@ -493,7 +493,7 @@ sub update_funcs
>  #
>  # Step 2: find the sections and mcount call sites
>  #
> -open(IN, "$objdump -hdr $inputfile|") || die "error running $objdump";
> +open(IN, "env LANG=C $objdump -hdr $inputfile|") || die "error running $objdump";


Just to be consistent with the other places,
is 'env' necessary?

arch/powerpc/boot/wrapper:LANG=C elfformat="`${CROSS}objdump -p
"$kernel" | grep 'file format' | awk '{print $4}'`"
scripts/tags.sh:    LANG=C sed -i -e
'/^\([a-zA-Z_][a-zA-Z0-9_]*\)\t.*\t\/\^struct \1;.*\$\/;"\tx$/d' $1
tools/testing/selftests/rcutorture/bin/config2frag.sh:LANG=C sed -e
's/^# CONFIG_\([a-zA-Z0-9_]*\) is not set$/CONFIG_\1=n/'


>  my $text;
>
> --
> 2.18.1
>


-- 
Best Regards
Masahiro Yamada
