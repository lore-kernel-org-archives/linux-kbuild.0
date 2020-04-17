Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730852AbgDQOHx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 10:07:53 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6EAC061A0F
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2020 07:07:53 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id q73so921464qvq.2
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2020 07:07:53 -0700 (PDT)
Date: Fri, 17 Apr 2020 11:07:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Message-ID: <20200417140750.GF26002@ziepe.ca>
References: <20200417011146.83973-1-saeedm@mellanox.com>
 <87v9ly3a0w.fsf@intel.com>
 <20200417122827.GD5100@ziepe.ca>
 <87h7xi2oup.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7xi2oup.fsf@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, leon@kernel.org, kieran.bingham+renesas@ideasonboard.com, jonas@kwiboo.se, airlied@linux.ie, jernej.skrabec@siol.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>

On Fri, Apr 17, 2020 at 05:01:18PM +0300, Jani Nikula wrote:
> On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Fri, Apr 17, 2020 at 09:23:59AM +0300, Jani Nikula wrote:
> >
> >> Which means that would have to split up to two. Not ideal, but
> >> doable.
> >
> > Why is this not ideal?
> >
> > I think the one per line is easier to maintain (eg for merge
> > conflicts) and easier to read than a giant && expression.
> >
> > I would not complicate things further by extending the boolean
> > language..
> 
> Fair enough. I only found one instance where the patch at hand does not
> cut it:
> 
> drivers/hwmon/Kconfig:  depends on !OF || IIO=n || IIO

Ideally this constraint would be expressed as:

   optionally depends on OF && IIO

And if the expression is n then IIO is not prevented from being y.

Ie the code is just doing:

#if defined(CONFIG_OF) && IS_ENABLED(CONFIG_IIO)

Jason
