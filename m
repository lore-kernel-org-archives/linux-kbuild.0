Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:36155 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfCGGVU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Mar 2019 01:21:20 -0500
MIME-Version: 1.0
References: <20190207123022.7961-1-2pi@mok.nu> <CAK7LNAQZ7PDZ4+uZu-FT4V8yw9oUGz6e++9xSshWJvALj3gN0Q@mail.gmail.com>
 <20190219200837.d34cxg2d7gqxlvhs@mok.nu> <CAK7LNASU=Jf7aYnnn_7DWgxLz4sf4=x1HZaoGQW2rSXVbFO9Bg@mail.gmail.com>
 <20190223195749.7yswuedfv4qbiyik@mok.nu> <20190307060926.GE44339@wrath> <20190307061700.GF44339@wrath>
In-Reply-To: <20190307061700.GF44339@wrath>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Mar 2019 15:20:29 +0900
Message-ID: <CAK7LNAQWzKNPFDa8GEWHkGVc6zT+iJo2RCdzg5OysnqwwWJzog@mail.gmail.com>
Subject: Re: [PATCH] modpost: file2alias: define size of alias
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mattias Jacobsson <2pi@mok.nu>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Darren,


On Thu, Mar 7, 2019 at 3:17 PM Darren Hart <dvhart@infradead.org> wrote:
>
> On Wed, Mar 06, 2019 at 10:09:26PM -0800, Darren Hart wrote:
> > On Sat, Feb 23, 2019 at 08:57:50PM +0100, Mattias Jacobsson wrote:
> > > On 2019-02-20, Masahiro Yamada wrote:
> >
> > > > > > If you want all the patches to go through x86 platform-driver tree,
> > > > > > I am fine with that too.
> > > > >
> > > > > I don't mind either way, however I've asked the x86 platform-driver
> > > > > maintainers if they have a preference in this matter. You should have
> > > > > received that mail otherwise see [1].
> > > > >
> > > > > [1]: https://lkml.kernel.org/r/082d3d38b7dde6050b6b3e518ada439eade65b2c.1550603967.git.2pi@mok.nu
> > > >
> > > >
> > > > I saw it.  The 2/8 uses ALIAS_SIZE.
> > > >
> > > > So, I think it will be better to include this one in your series.
> > > > If necessary, please feel free to add
> > > >
> > > > Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > >
> > >
> > > Okey, will do. Thanks!
> >
> >
> > Agree, I'll pull it in.
>
> Masahiro, may I include your Acked-by on the 2/8 patch as well?


Sure.  Please go ahead.




> platform/x86: wmi: add WMI support to MODULE_DEVICE_TABLE()
>
> --
> Darren Hart
> VMware Open Source Technology Center



-- 
Best Regards
Masahiro Yamada
