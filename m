Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:63099 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753396AbZC2NdW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Mar 2009 09:33:22 -0400
Received: by fxm2 with SMTP id 2so1608764fxm.37
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2009 06:33:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1238331707-23129-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1238331707-23129-1-git-send-email-u.kleine-koenig@pengutronix.de>
Date: Sun, 29 Mar 2009 14:33:19 +0100
Message-ID: <19f34abd0903290633r322eb3fbk1252779b50793b8b@mail.gmail.com>
Subject: Re: [PATCH] headerdep: fix option processing for -I
From: Vegard Nossum <vegard.nossum@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

2009/3/29 Uwe Kleine-König <u.kleine-koenig@pengutronix.de>:
> -I takes an argument.  Without this change only a 1 is added to
> @opt_include which is not helpful.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Cc: Vegard Nossum <vegard.nossum@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
>
> ---
>  scripts/headerdep.pl |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/headerdep.pl b/scripts/headerdep.pl
> index 97399da..536408e 100755
> --- a/scripts/headerdep.pl
> +++ b/scripts/headerdep.pl
> @@ -19,7 +19,7 @@ my $opt_graph;
>        version => \&version,
>
>        all     => \$opt_all,
> -       I       => \@opt_include,
> +       "I:s"   => \@opt_include,
>        graph   => \$opt_graph,
>  );

Thanks!

Acked-by: Vegard Nossum <vegard.nossum@gmail.com>


Vegard
