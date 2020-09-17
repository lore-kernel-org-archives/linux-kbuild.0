Return-Path: <SRS0=M24I=C2=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBB1C43461
	for <linux-kbuild@archiver.kernel.org>; Thu, 17 Sep 2020 18:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE22D21973
	for <linux-kbuild@archiver.kernel.org>; Thu, 17 Sep 2020 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600368758;
	bh=f8dTVqhPW2uYdaKLRRN5GJqclfajkgeXCx9n3ETENTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ya4nhs9Z6Zd4HxoAE8B/TODlHyS/AxCfmsXzPhY13BIs9AFhrZtaG625svN1P5GvQ
	 e+1et0YU8AicNLCntRnZgJoqooll5H7Q3jl5b6Na3eoLuUTFD7wuPF038iYBfTiXpS
	 JYqx/kFficQ4px4h5/s3EzeKw20/K9V3Ek7A2HZI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgIQSwf (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 17 Sep 2020 14:52:35 -0400
Received: from condef-02.nifty.com ([202.248.20.67]:51590 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbgIQQZF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Sep 2020 12:25:05 -0400
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-02.nifty.com with ESMTP id 08HGC9XN015740;
        Fri, 18 Sep 2020 01:12:09 +0900
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 08HG9kWP019016;
        Fri, 18 Sep 2020 01:09:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 08HG9kWP019016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600358987;
        bh=VqnELTIg8lzluBpqzuDjjzSg85xMTYC/12Xix5s3ZA8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pziwVT9CWjypw4CdEkvWlV5OVir84Oe6/p2nB+mhIjCbbdhUQGv8i8/B7d4w+/u92
         dJ/Vdcb4VHOihU/pjpWlzFH4q1tCIyKwOQTF7Nvs820I7m2fAaxTqob20Y3eDuBYRT
         4o4C6CPzfG/zpFvrrbfErHAumWNW7UVuvCvpHz/cJCkwT84V1U9FcHNzg1aTH2wdzM
         76cjTPVACfv7nXqK3MkzbszKuWZ0Bh4f9fvrgk0a5/UlnrapDoZg9KsMOi+MKI10G5
         zJlCLCachSltYRswM8BImJUUbHtzhyNNwxU/Sv03SffAx0/KdqrSwodVgt4ywL+PNG
         4wzlW9Mi5TQ/A==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id kk9so1462545pjb.2;
        Thu, 17 Sep 2020 09:09:46 -0700 (PDT)
X-Gm-Message-State: AOAM5324UMpzZpWWKDX77qi21WZsH68fzUs5fgXFKMJ82adbXwt/RU7Q
        kr3r4yiMuLPA7sBAukm16CxY/jaNxyKmTFMX4JA=
X-Google-Smtp-Source: ABdhPJxC2PNqKY/sV02vqxZ+NaQ4rjJs7WBmuVsVHAbRvxdIu4U3xj/Dm7sbzi8fQCkJwmHy9a8Q6ftz97GKrFtH++s=
X-Received: by 2002:a17:902:760b:b029:d1:9be4:856b with SMTP id
 k11-20020a170902760bb02900d19be4856bmr28063178pll.1.1600358985339; Thu, 17
 Sep 2020 09:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200914145948.515677-1-masahiroy@kernel.org>
In-Reply-To: <20200914145948.515677-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 18 Sep 2020 01:09:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT6HgW54j4Po7RNcD8-q2TbZEPr+SBOhpaVwyOMv5KT6w@mail.gmail.com>
Message-ID: <CAK7LNAT6HgW54j4Po7RNcD8-q2TbZEPr+SBOhpaVwyOMv5KT6w@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: revive help message in the info view
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 15, 2020 at 12:00 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 68fd110b3e7e ("kconfig: qconf: remove redundant help in
> the info view"), the help message is no longer displayed.
>
> I intended to drop duplicated "Symbol:", "Type:", but precious info
> about help and reverse dependencies was lost too.
>
> Revive it now.
>
> "defined at" is contained in menu_get_ext_help(), so I made sure
> to not display it twice.
>
> Fixes: 68fd110b3e7e ("kconfig: qconf: remove redundant help in the info view")
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild/fixes.

>
>  scripts/kconfig/qconf.cc | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 8638785328a7..9f306e780c2f 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1108,6 +1108,11 @@ void ConfigInfoView::menuInfo(void)
>                 if (showDebug())
>                         stream << debug_info(sym);
>
> +               struct gstr help_gstr = str_new();
> +
> +               menu_get_ext_help(_menu, &help_gstr);
> +               stream << print_filter(str_get(&help_gstr));
> +               str_free(&help_gstr);
>         } else if (_menu->prompt) {
>                 stream << "<big><b>";
>                 stream << print_filter(_menu->prompt->text);
> @@ -1119,11 +1124,11 @@ void ConfigInfoView::menuInfo(void)
>                                            expr_print_help, &stream, E_NONE);
>                                 stream << "<br><br>";
>                         }
> +
> +                       stream << "defined at " << _menu->file->name << ":"
> +                              << _menu->lineno << "<br><br>";
>                 }
>         }
> -       if (showDebug())
> -               stream << "defined at " << _menu->file->name << ":"
> -                      << _menu->lineno << "<br><br>";
>
>         setText(info);
>  }
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
