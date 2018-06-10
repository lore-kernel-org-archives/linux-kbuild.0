Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:22119 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753665AbeFJNaY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Jun 2018 09:30:24 -0400
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com [209.85.217.174]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w5ADUAL9017625
        for <linux-kbuild@vger.kernel.org>; Sun, 10 Jun 2018 22:30:11 +0900
Received: by mail-ua0-f174.google.com with SMTP id x18-v6so11845198uaj.9
        for <linux-kbuild@vger.kernel.org>; Sun, 10 Jun 2018 06:30:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180608215338.GA28473@ravnborg.org>
References: <20180608215338.GA28473@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 10 Jun 2018 22:29:29 +0900
Message-ID: <CAK7LNATPWcrKHTnky0Ur6YwcFKg7CwSo25DUR2x6yd4OAE5_Cw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix localmodconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Kevin Locke <kevin@kevinlocke.name>, Andrei Vagin <avagin@virtuozzo.com>

2018-06-09 6:53 GMT+09:00 Sam Ravnborg <sam@ravnborg.org>:
> From 47857284fd19ef953e3beb7338154924a74b62d2 Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Fri, 8 Jun 2018 23:48:31 +0200
> Subject: [PATCH 1/1] kconfig: fix localmodconfig
>
> When kconfig syntax moved to use $(FOO) for environment variables
> localmodconfig was not updated.
> Fix so it now works with the new syntax $(FOO)
>
> Fixes: 104daea149c45cc84842ce77a9bd6436d19f3dd8 ("kconfig: reference environment variables directly and remove 'option env='")
> Reported-by: Kevin Locke <kevin@kevinlocke.name>
> Reported-by: Andrei Vagin <avagin@virtuozzo.com>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---


Applied to linux-kbuild.  Thanks!


>  scripts/kconfig/streamline_config.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index a2e83ab17de3..4686531e2f8c 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -165,10 +165,10 @@ sub read_kconfig {
>      my $last_source = "";
>
>      # Check for any environment variables used
> -    while ($source =~ /\$(\w+)/ && $last_source ne $source) {
> +    while ($source =~ /\$\((\w+)\)/ && $last_source ne $source) {
>         my $env = $1;
>         $last_source = $source;
> -       $source =~ s/\$$env/$ENV{$env}/;
> +       $source =~ s/\$\($env\)/$ENV{$env}/;
>      }
>
>      open(my $kinfile, '<', $source) || die "Can't open $kconfig";
> --
> 2.12.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
