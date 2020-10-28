Return-Path: <SRS0=meOy=EE=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D138C388F7
	for <linux-kbuild@archiver.kernel.org>; Thu, 29 Oct 2020 02:13:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A984A2076B
	for <linux-kbuild@archiver.kernel.org>; Thu, 29 Oct 2020 02:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603937636;
	bh=a0QquZoHR7ngiB60vMaFc7Nmw+c49kE5EYaH2MRs7oU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=a9PXtP1atGVePaxi8TEBH92VYFn9LOtTf37RjTbnnun+0XvpMElUrVZVWcfzOJJYf
	 MwLvqBfXp6aX1fCsP+GFgR+o+/gD2BQkP6Nol6PmXwUgdmOWtxaNsb4chOmp5ijk+t
	 0loGwKLEDj53s0csV4H+K9bjVTxC0A/gxekzHDgw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729082AbgJ2CNd (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:13:33 -0400
Received: from condef-04.nifty.com ([202.248.20.69]:18145 "EHLO
        condef-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgJ1Vf7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Oct 2020 17:35:59 -0400
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-04.nifty.com with ESMTP id 09S6rF5w005243;
        Wed, 28 Oct 2020 15:53:15 +0900
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 09S6qjja010426;
        Wed, 28 Oct 2020 15:52:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 09S6qjja010426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603867965;
        bh=V942qKpMUO7DvF5BzcB686P1EgBaXdJ00WeWzVnIkbk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xbTxWkKxaQIELI8IMov70NFPoRNAm4udHDYLxo2tABPtAhjKvbL3yz+hlSl0jdK0D
         0n79pK/KQtFIkMNR7v/1PnUgs8N0oiIqn8vawvVaJcrAnmVe84SRH5stV7kh6FIqO0
         rokLmippBZ/H/ni5N64ATI6oRvNRe4gnsVINtCk3BfCa6RgIs/Yu++QuRfnY7jVbw+
         SEoi6kmA+FDgm6eOqyzIWrZNVRtMaQrFSlvwMHXialYCV+foa5pni8937+FnwEulWV
         GyQoCCkdK5aGp2/9KAWwqGS0BdnY6qBQ5PG0WBzwEnVLmmeEpaOmos1E7ugHr2PszX
         OK9Vz1lhtirtQ==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id t6so1488143plq.11;
        Tue, 27 Oct 2020 23:52:45 -0700 (PDT)
X-Gm-Message-State: AOAM531moL9IVjGEse7dJEfFjjCTrZ2GPMgZSVLlLxtZY1luA7Ne6JlC
        NmbztWhYYHCKtofvuf5gTJVJeHwXkRTWd1OOk58=
X-Google-Smtp-Source: ABdhPJziBkbf7PTF6i3dTgZuQKKfGo7UOR4koM70+tf8L+eWu1yOmAKVrXv3lXpqtatZziJBxN8HICEImjcaNUj7QmM=
X-Received: by 2002:a17:902:be0c:b029:d2:8ceb:f39c with SMTP id
 r12-20020a170902be0cb02900d28cebf39cmr5866527pls.71.1603867964784; Tue, 27
 Oct 2020 23:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201026193217.402412-1-svenjoac@gmx.de> <20201026193217.402412-2-svenjoac@gmx.de>
In-Reply-To: <20201026193217.402412-2-svenjoac@gmx.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 28 Oct 2020 15:52:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARFVy_2y883jig2_QrwTyGe=Xmu91z8LWuZuCeruWXa6A@mail.gmail.com>
Message-ID: <CAK7LNARFVy_2y883jig2_QrwTyGe=Xmu91z8LWuZuCeruWXa6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] builddeb: Consolidate consecutive chmod calls into one
To:     Sven Joachim <svenjoac@gmx.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 27, 2020 at 4:32 AM Sven Joachim <svenjoac@gmx.de> wrote:
>
> No need to call chmod three times when it can do everything at once.
>
> Signed-off-by: Sven Joachim <svenjoac@gmx.de>
> ---
>  scripts/package/builddeb | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 91a502bb97e8..81ec6414726c 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -42,11 +42,7 @@ create_package() {
>         else
>                 chown -R root:root "$pdir"
>         fi
> -       chmod -R go-w "$pdir"
> -       # in case we are in a restrictive umask environment like 0077
> -       chmod -R a+rX "$pdir"
> -       # in case we build in a setuid/setgid directory
> -       chmod -R ug-s "$pdir"
> +       chmod -R go-w,a+rX,ug-s "$pdir"


You added the comment in 1/2, then
you are deleting it in this patch.

Could you keep the comments for clarification?


# a+rX in case we are in a restrictive umask environment like 0077
# ug-s in case we build in a setuid/setgid directory
chmod -R go-w,a+rX,ug-s "$pdir"






>         # Create the package
>         dpkg-gencontrol -p$pname -P"$pdir"
> --
> 2.28.0
>


--
Best Regards
Masahiro Yamada
