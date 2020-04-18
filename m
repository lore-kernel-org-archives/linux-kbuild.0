Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp20.pobox.com ([173.228.157.52]:58167 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgDRTLW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Apr 2020 15:11:22 -0400
Date: Sat, 18 Apr 2020 15:11:15 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
In-Reply-To: <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.2004181509030.2671@knanqh.ubzr>
References: <20200417011146.83973-1-saeedm@mellanox.com> <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>, Jani Nikula <jani.nikula@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Leon Romanovsky <leon@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, jonas@kwiboo.se, David Airlie <airlied@linux.ie>, jernej.skrabec@siol.net, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, linux-rdma@vger.kernel.org

On Sun, 19 Apr 2020, Masahiro Yamada wrote:

> (FOO || !FOO) is difficult to understand, but
> the behavior of "uses FOO" is as difficult to grasp.

Can't this be expressed as the following instead:

	depends on FOO if FOO

That would be a little clearer.


Nicolas
