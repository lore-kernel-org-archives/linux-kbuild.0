Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:25270 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgCKV1a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 17:27:30 -0400
MIME-Version: 1.0
References: <20200311062925.5163-1-masahiroy@kernel.org> <20200311093143.GB279080@splinter>
 <20200311104756.GA1972672@hmswarspite.think-freely.org> <20200311112833.GA284417@splinter>
 <20200311173053.GB1972672@hmswarspite.think-freely.org>
In-Reply-To: <20200311173053.GB1972672@hmswarspite.think-freely.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 Mar 2020 06:26:34 +0900
Message-ID: <CAK7LNARSbP-DY5wdXtB0cxHfwgmFYE0QvxYACk8GuMQhTvj_WQ@mail.gmail.com>
Subject: Re: [PATCH] net: drop_monitor: use IS_REACHABLE() to guard net_dm_hw_report()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Neil Horman <nhorman@tuxdriver.com>
Cc: Ido Schimmel <idosch@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Networking <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Pitre <nico@fluxnic.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Mar 12, 2020 at 2:31 AM Neil Horman <nhorman@tuxdriver.com> wrote:
>
> On Wed, Mar 11, 2020 at 01:28:33PM +0200, Ido Schimmel wrote:
> > On Wed, Mar 11, 2020 at 06:47:56AM -0400, Neil Horman wrote:
> > > On Wed, Mar 11, 2020 at 11:31:43AM +0200, Ido Schimmel wrote:
> > > > On Wed, Mar 11, 2020 at 03:29:25PM +0900, Masahiro Yamada wrote:
> > > > > In net/Kconfig, NET_DEVLINK implies NET_DROP_MONITOR.
> > > > >
> > > > > The original behavior of the 'imply' keyword prevents NET_DROP_MONITOR
> > > > > from being 'm' when NET_DEVLINK=y.
> > > > >
> > > > > With the planned Kconfig change that relaxes the 'imply', the
> > > > > combination of NET_DEVLINK=y and NET_DROP_MONITOR=m would be allowed.
> > > > >
> > > > > Use IS_REACHABLE() to avoid the vmlinux link error for this case.
> > > > >
> > > > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > >
> > > > Thanks, Masahiro.
> > > >
> > > > Neil, Jiri, another option (long term) is to add a raw tracepoint (not
> > > > part of ABI) in devlink and have drop monitor register its probe on it
> > > > when monitoring.
> > > >
> > > > Two advantages:
> > > > 1. Consistent with what drop monitor is already doing with kfree_skb()
> > > > tracepoint
> > > > 2. We can remove 'imply NET_DROP_MONITOR' altogether
> > > >
> > > > What do you think?
> > > >
> > > Agreed, I think I like this implementation better.
> >
> > OK, but I don't want to block Masahiro. I think we can go with his patch
> > and then I'll add the raw tracepoint in the next release.
> >
> Yeah, ok, I can agree with that
> Acked-by: Neil Horman <nhorman@tuxdriver.com>


Thanks, I will insert this patch before the kconfig change
with your Ack.


-- 
Best Regards
Masahiro Yamada
