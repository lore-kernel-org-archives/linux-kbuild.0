Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:64942 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbfKOCZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 21:25:22 -0500
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xAF2PJqW002262
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Nov 2019 11:25:19 +0900
Received: by mail-vs1-f42.google.com with SMTP id b16so5346791vso.10
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Nov 2019 18:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20191114060236.GA13066@oxygen>
In-Reply-To: <20191114060236.GA13066@oxygen>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Nov 2019 11:24:42 +0900
Message-ID: <CAK7LNAQDczMHTx_T2bY4ujQ0NmbxVV2fdzHWckV-uSwk8ue9gg@mail.gmail.com>
Subject: Re: KBUILD_IMAGE-reg
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Thu, Nov 14, 2019 at 3:02 PM Vijai Kumar K
<vijaikumar.kanagarajan@gmail.com> wrote:
>
> Hi All,
>
> I see that we have moved from directly using KBUILD_IMAGE to "make image_name"
> to decide the image to be included in the final deb package. Long ago when
> I remember we could override KBUILD_IMAGE in the environment to include
> the image of our choice in the deb pkg.

I checked the old code, but I think it is unrelated to
the image_name conversion.

As far as I saw the code, it is not possible to
override it from the environment variable,
but possible from the command line.

>
> Is this possible now by any other means? Because there are times when I
> would like to include vmlinux instead of vmlinuz and just wondering how
> one could go about accomplishing that.


make bindeb-pkg KBUILD_IMAGE=vmlinux

might work?



-- 
Best Regards
Masahiro Yamada
