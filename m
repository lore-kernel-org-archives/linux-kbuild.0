Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f169.google.com ([209.85.222.169]:42493 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfKSG0L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Nov 2019 01:26:11 -0500
Received: by mail-qk1-f169.google.com with SMTP id i3so4862827qkk.9
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2019 22:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20191114060236.GA13066@oxygen> <CAK7LNAQDczMHTx_T2bY4ujQ0NmbxVV2fdzHWckV-uSwk8ue9gg@mail.gmail.com>
In-Reply-To: <CAK7LNAQDczMHTx_T2bY4ujQ0NmbxVV2fdzHWckV-uSwk8ue9gg@mail.gmail.com>
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
Date: Tue, 19 Nov 2019 11:55:59 +0530
Message-ID: <CALLGG_KCr6N6iGyZNE+=x1dJiShbz-NH7J2fyb2GQL0ZfcN28g@mail.gmail.com>
Subject: Re: KBUILD_IMAGE-reg
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Nov 15, 2019 at 7:55 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Thu, Nov 14, 2019 at 3:02 PM Vijai Kumar K
> <vijaikumar.kanagarajan@gmail.com> wrote:
> >
> > Hi All,
> >
> > I see that we have moved from directly using KBUILD_IMAGE to "make image_name"
> > to decide the image to be included in the final deb package. Long ago when
> > I remember we could override KBUILD_IMAGE in the environment to include
> > the image of our choice in the deb pkg.
>
> I checked the old code, but I think it is unrelated to
> the image_name conversion.
>
> As far as I saw the code, it is not possible to
> override it from the environment variable,
> but possible from the command line.

I don't remember exactly but yeah something like that.

>
> >
> > Is this possible now by any other means? Because there are times when I
> > would like to include vmlinux instead of vmlinuz and just wondering how
> > one could go about accomplishing that.
>
>
> make bindeb-pkg KBUILD_IMAGE=vmlinux
>
> might work?
>

Let me give it a try.

Thanks,
Vijai Kumar K

>
>
> --
> Best Regards
> Masahiro Yamada
