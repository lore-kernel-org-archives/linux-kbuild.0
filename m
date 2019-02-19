Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:64632 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfBSXrs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 18:47:48 -0500
MIME-Version: 1.0
References: <20190207123022.7961-1-2pi@mok.nu> <CAK7LNAQZ7PDZ4+uZu-FT4V8yw9oUGz6e++9xSshWJvALj3gN0Q@mail.gmail.com>
 <20190219200837.d34cxg2d7gqxlvhs@mok.nu>
In-Reply-To: <20190219200837.d34cxg2d7gqxlvhs@mok.nu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Feb 2019 08:47:01 +0900
Message-ID: <CAK7LNASU=Jf7aYnnn_7DWgxLz4sf4=x1HZaoGQW2rSXVbFO9Bg@mail.gmail.com>
Subject: Re: [PATCH] modpost: file2alias: define size of alias
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mattias Jacobsson <2pi@mok.nu>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 20, 2019 at 5:09 AM Mattias Jacobsson <2pi@mok.nu> wrote:
>
> Hi Masahiro,
>
> On 2019-02-18, Masahiro Yamada wrote:
> > Hi Mattias,
> >
> > On Thu, Feb 7, 2019 at 9:31 PM Mattias Jacobsson <2pi@mok.nu> wrote:
> > >
> > > The size of the variable alias provided to do_entry functions are
> > > currently not readily available. Thus hindering do_entry functions to
> > > perform bounds checking.
> > >
> > > Define the macro ALIAS_SIZE containing the size of the variable alias.
> > >
> > > Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
> >
> >
> > Sorry for late reply.
> >
> > I can apply this to my kbuild tree shortly, but
> > it looks like a prerequisite for your
> > "platform/x86: wmi: use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS()"
> >
> >
> > If you want all the patches to go through x86 platform-driver tree,
> > I am fine with that too.
>
> I don't mind either way, however I've asked the x86 platform-driver
> maintainers if they have a preference in this matter. You should have
> received that mail otherwise see [1].
>
> [1]: https://lkml.kernel.org/r/082d3d38b7dde6050b6b3e518ada439eade65b2c.1550603967.git.2pi@mok.nu


I saw it.  The 2/8 uses ALIAS_SIZE.

So, I think it will be better to include this one in your series.
If necessary, please feel free to add

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


> >
> > Please let me know what you want.
> >
> > Thanks.
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
> Thanks,
> Mattias



-- 
Best Regards
Masahiro Yamada
