Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp21.pobox.com ([173.228.157.53]:60611 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728912AbgDUN6W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 09:58:22 -0400
Date: Tue, 21 Apr 2020 09:58:13 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
In-Reply-To: <45b9efec57b2e250e8e39b3b203eb8cee10cb6e8.camel@mellanox.com>
Message-ID: <nycvar.YSQ.7.76.2004210951160.2671@knanqh.ubzr>
References: <20200417011146.83973-1-saeedm@mellanox.com> <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com> <nycvar.YSQ.7.76.2004181509030.2671@knanqh.ubzr> <CAK7LNATmPD1R+Ranis2u3yohx8b0+dGKAvFpjg8Eo9yEHRT6zQ@mail.gmail.com>
 <87v9lu1ra6.fsf@intel.com> <45b9efec57b2e250e8e39b3b203eb8cee10cb6e8.camel@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: "masahiroy@kernel.org" <masahiroy@kernel.org>, "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "airlied@linux.ie" <airlied@linux.ie>, "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>, "leon@kernel.org" <leon@kernel.org>

On Tue, 21 Apr 2020, Saeed Mahameed wrote:

> I wonder how many of those 8889 cases wanted a weak dependency but
> couldn't figure out how to do it ? 
> 
> Users of depends on FOO || !FOO
> 
> $ git ls-files | grep Kconfig | xargs grep -E \
>   "depends\s+on\s+([A-Za-z0-9_]+)\s*\|\|\s*(\!\s*\1|\1\s*=\s*n)" \
>  | wc -l
> 
> 156
> 
> a new keyword is required :) .. 
> 
> 
> > In another mail I suggested
> > 
> > 	optionally depends on FOO
> > 
> > might be a better alternative than "uses".
> > 
> > 
> 
> how about just:
>       optional FOO
> 
> It is clear and easy to document .. 

I don't dispute your argument for having a new keyword. But the most 
difficult part as Arnd said is to find it. You cannot pretend that 
"optional FOO" is clear when it actually imposes a restriction when 
FOO=m. Try to justify to people why they cannot select y because of this 
"optional" thing.


Nicolas
