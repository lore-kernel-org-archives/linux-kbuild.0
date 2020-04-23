Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730102AbgDWSa5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 14:30:57 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AD9C09B042
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Apr 2020 11:30:57 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id x8so5692593qtp.13
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Apr 2020 11:30:57 -0700 (PDT)
Date: Thu, 23 Apr 2020 15:30:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Message-ID: <20200423183055.GB26002@ziepe.ca>
References: <62a51b2e5425a3cca4f7a66e2795b957f237b2da.camel@mellanox.com>
 <nycvar.YSQ.7.76.2004211411500.2671@knanqh.ubzr>
 <871rofdhtg.fsf@intel.com>
 <nycvar.YSQ.7.76.2004221649480.2671@knanqh.ubzr>
 <940d3add-4d12-56ed-617a-8b3bf8ef3a0f@infradead.org>
 <nycvar.YSQ.7.76.2004231059170.2671@knanqh.ubzr>
 <20200423150556.GZ26002@ziepe.ca>
 <nycvar.YSQ.7.76.2004231109500.2671@knanqh.ubzr>
 <20200423151624.GA26002@ziepe.ca>
 <nycvar.YSQ.7.76.2004231128210.2671@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.2004231128210.2671@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@linux.intel.com>, Saeed Mahameed <saeedm@mellanox.com>, "masahiroy@kernel.org" <masahiroy@kernel.org>, "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>, "airlied@linux.ie" <airlied@linux.ie>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>, "arnd@arndb.de" <arnd@arndb.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>, "kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "leon@kernel.org" <leon@kernel.org>

On Thu, Apr 23, 2020 at 11:33:33AM -0400, Nicolas Pitre wrote:
> > > No. There is no logic in restricting MTD usage based on CRAMFS or 
> > > CRAMFS_MTD.
> > 
> > Ah, I got it backwards, maybe this:
> > 
> > config CRAMFS
> >    depends on MTD if CRAMFS_MTD
> > 
> > ?
> 
> Still half-backward. CRAMFS should not depend on either MTD nor
> CRAMFS_MTD.

Well, I would view this the same as all the other cases.. the CRAMFS
module has an optional ability consume symbols from MTD.  Here that is
controlled by another 'CRAMFS_MTD' selection, but it should still
settle it out the same way as other cases like this - ie CRAMFS is
restricted to m if MTD is m

Arnd's point that kconfig is acyclic does kill it though :(

> It is CRAMFS_MTD that needs both CRAMFS and MTD.
> Furthermore CRAMFS_MTD can't be built-in if MTD is modular.

CRAMFS_MTD is a bool feature flag for the CRAMFS tristate - it is
CRAMFS that can't be built in if MTD is modular.

Jason
