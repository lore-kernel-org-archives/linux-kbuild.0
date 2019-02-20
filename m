Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:23127 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbfBTDmA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 22:42:00 -0500
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x1K3fooj015212
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Feb 2019 12:41:51 +0900
Received: by mail-vk1-f179.google.com with SMTP id l136so5231458vke.2
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Feb 2019 19:41:51 -0800 (PST)
MIME-Version: 1.0
References: <20190102092304.27262-1-riku.voipio@linaro.org>
 <CAK7LNARFAth+L_b7i4aR4mPtVTSfDgq2zvvMJah4WR0s97Ny2A@mail.gmail.com>
 <CAK7LNASOqwrJqHLDKwT4xRU6jrFchavvWFjxqcPd_ZSmiEtsQQ@mail.gmail.com>
 <CAK7LNASiyMiCB2Ko0_aWOhB_3t6FEVhQ1xpnn-NQ=yV0X11SMg@mail.gmail.com>
 <ab49b0582ef12b14b1a68877263b81813e2492a2.camel@decadent.org.uk> <CAK7LNAQmOsGqLLjYho2=_3Bx+dAjhunSjcQbdTXmHMgX1dC+ww@mail.gmail.com>
In-Reply-To: <CAK7LNAQmOsGqLLjYho2=_3Bx+dAjhunSjcQbdTXmHMgX1dC+ww@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Feb 2019 12:41:14 +0900
Message-ID: <CAK7LNAQq4f_4YBDxGZxG36z+O1a0-UP=wY8qF4o2MuYWEX3oMg@mail.gmail.com>
Subject: Re: [PATCH v2] deb-pkg: generate correct build dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, debian-kernel <debian-kernel@lists.debian.org>, Ben Hutchings <ben@decadent.org.uk>

Hi Riku,


On Tue, Feb 19, 2019 at 11:15 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> > The way we dealt with this in Debian before flex was fixed was (c): use
> > "flex:native".  But for reasons I don't understand that *isn't*
> > compatible with (b), so to be compatible with both old and new versions
> > of flex you should build-depend on:
> >
> >    flex | flex:native
>
> Yes, it worked with this fix.
>


Could you please send v3?

Thanks.


-- 
Best Regards
Masahiro Yamada
