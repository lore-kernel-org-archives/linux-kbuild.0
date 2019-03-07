Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:52132 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfCGGJc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Mar 2019 01:09:32 -0500
Date: Wed, 6 Mar 2019 22:09:26 -0800
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] modpost: file2alias: define size of alias
Message-ID: <20190307060926.GE44339@wrath>
References: <20190207123022.7961-1-2pi@mok.nu>
 <CAK7LNAQZ7PDZ4+uZu-FT4V8yw9oUGz6e++9xSshWJvALj3gN0Q@mail.gmail.com>
 <20190219200837.d34cxg2d7gqxlvhs@mok.nu>
 <CAK7LNASU=Jf7aYnnn_7DWgxLz4sf4=x1HZaoGQW2rSXVbFO9Bg@mail.gmail.com>
 <20190223195749.7yswuedfv4qbiyik@mok.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190223195749.7yswuedfv4qbiyik@mok.nu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mattias Jacobsson <2pi@mok.nu>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Feb 23, 2019 at 08:57:50PM +0100, Mattias Jacobsson wrote:
> On 2019-02-20, Masahiro Yamada wrote:

> > > > If you want all the patches to go through x86 platform-driver tree,
> > > > I am fine with that too.
> > >
> > > I don't mind either way, however I've asked the x86 platform-driver
> > > maintainers if they have a preference in this matter. You should have
> > > received that mail otherwise see [1].
> > >
> > > [1]: https://lkml.kernel.org/r/082d3d38b7dde6050b6b3e518ada439eade65b2c.1550603967.git.2pi@mok.nu
> > 
> > 
> > I saw it.  The 2/8 uses ALIAS_SIZE.
> > 
> > So, I think it will be better to include this one in your series.
> > If necessary, please feel free to add
> > 
> > Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > 
> 
> Okey, will do. Thanks!


Agree, I'll pull it in.


-- 
Darren Hart
VMware Open Source Technology Center
