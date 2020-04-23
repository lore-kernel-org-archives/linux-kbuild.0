Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp2.pobox.com ([64.147.108.71]:52188 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDWPBp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 11:01:45 -0400
Date: Thu, 23 Apr 2020 11:01:40 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
In-Reply-To: <940d3add-4d12-56ed-617a-8b3bf8ef3a0f@infradead.org>
Message-ID: <nycvar.YSQ.7.76.2004231059170.2671@knanqh.ubzr>
References: <20200417011146.83973-1-saeedm@mellanox.com> <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com> <nycvar.YSQ.7.76.2004181509030.2671@knanqh.ubzr> <CAK7LNATmPD1R+Ranis2u3yohx8b0+dGKAvFpjg8Eo9yEHRT6zQ@mail.gmail.com>
 <87v9lu1ra6.fsf@intel.com> <45b9efec57b2e250e8e39b3b203eb8cee10cb6e8.camel@mellanox.com> <nycvar.YSQ.7.76.2004210951160.2671@knanqh.ubzr> <62a51b2e5425a3cca4f7a66e2795b957f237b2da.camel@mellanox.com> <nycvar.YSQ.7.76.2004211411500.2671@knanqh.ubzr>
 <871rofdhtg.fsf@intel.com> <nycvar.YSQ.7.76.2004221649480.2671@knanqh.ubzr> <940d3add-4d12-56ed-617a-8b3bf8ef3a0f@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Saeed Mahameed <saeedm@mellanox.com>, "masahiroy@kernel.org" <masahiroy@kernel.org>, "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>, "airlied@linux.ie" <airlied@linux.ie>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>, "arnd@arndb.de" <arnd@arndb.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>, "kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "leon@kernel.org" <leon@kernel.org>

On Wed, 22 Apr 2020, Randy Dunlap wrote:

> On 4/22/20 2:13 PM, Nicolas Pitre wrote:
> > On Wed, 22 Apr 2020, Jani Nikula wrote:
> > 
> >> On Tue, 21 Apr 2020, Nicolas Pitre <nico@fluxnic.net> wrote:
> >>> This is really a conditional dependency. That's all this is about.
> >>> So why not simply making it so rather than fooling ourselves? All that 
> >>> is required is an extension that would allow:
> >>>
> >>> 	depends on (expression) if (expression)
> >>>
> >>> This construct should be obvious even without reading the doc, is 
> >>> already used extensively for other things already, and is flexible 
> >>> enough to cover all sort of cases in addition to this particular one.
> >>
> >> Okay, you convinced me. Now you only need to convince whoever is doing
> >> the actual work of implementing this stuff. ;)
> > 
> > What about this:
> > 
> > ----- >8
> > Subject: [PATCH] kconfig: allow for conditional dependencies
> > 
> > This might appear to be a strange concept, but sometimes we want
> > a dependency to be conditionally applied. One such case is currently
> > expressed with:
> > 
> > 	depends on FOO || !FOO
> > 
> > This pattern is strange enough to give one's pause. Given that it is
> > also frequent, let's make the intent more obvious with some syntaxic 
> > sugar by effectively making dependencies optionally conditional.
> > This also makes the kconfig language more uniform.
> > 
> > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> 
> Hi,
> 
> If we must do something here, I prefer this one.
> 
> Nicolas, would you do another example, specifically for
> CRAMFS_MTD in fs/cramfs/Kconfig, please?

I don't see how that one can be helped. The MTD dependency is not 
optional.


Nicolas
