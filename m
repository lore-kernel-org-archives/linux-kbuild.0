Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:33431 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728865AbgDWP21 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 11:28:27 -0400
MIME-Version: 1.0
References: <45b9efec57b2e250e8e39b3b203eb8cee10cb6e8.camel@mellanox.com>
 <nycvar.YSQ.7.76.2004210951160.2671@knanqh.ubzr> <62a51b2e5425a3cca4f7a66e2795b957f237b2da.camel@mellanox.com>
 <nycvar.YSQ.7.76.2004211411500.2671@knanqh.ubzr> <871rofdhtg.fsf@intel.com>
 <nycvar.YSQ.7.76.2004221649480.2671@knanqh.ubzr> <940d3add-4d12-56ed-617a-8b3bf8ef3a0f@infradead.org>
 <nycvar.YSQ.7.76.2004231059170.2671@knanqh.ubzr> <20200423150556.GZ26002@ziepe.ca>
 <nycvar.YSQ.7.76.2004231109500.2671@knanqh.ubzr> <20200423151624.GA26002@ziepe.ca>
In-Reply-To: <20200423151624.GA26002@ziepe.ca>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Apr 2020 17:28:08 +0200
Message-ID: <CAK8P3a0ydfp79Us-WhwwHOB2MGgtj=ovfYa_g8qhazA4gmv8eg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolas Pitre <nico@fluxnic.net>, Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@linux.intel.com>, Saeed Mahameed <saeedm@mellanox.com>, "masahiroy@kernel.org" <masahiroy@kernel.org>, "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>, "airlied@linux.ie" <airlied@linux.ie>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>, "kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "leon@kernel.org" <leon@kernel.org>

On Thu, Apr 23, 2020 at 5:16 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Thu, Apr 23, 2020 at 11:11:46AM -0400, Nicolas Pitre wrote:

> > > > I don't see how that one can be helped. The MTD dependency is not
> > > > optional.
> > >
> > > Could it be done as
> > >
> > > config MTD
> > >    depends on CRAMFS if CRAMFS_MTD
> > >
> > > ?
> >
> > No. There is no logic in restricting MTD usage based on CRAMFS or
> > CRAMFS_MTD.
>
> Ah, I got it backwards, maybe this:
>
> config CRAMFS
>    depends on MTD if CRAMFS_MTD

I'm not sure this can work if you also have the requirement that 'CRAMFS_MTD
depends on CRAMFS': dependencies in Kconfig generally cannot have
loops in them.

       Arnd
