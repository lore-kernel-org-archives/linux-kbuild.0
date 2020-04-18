Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:50151 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbgDRUI5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Apr 2020 16:08:57 -0400
MIME-Version: 1.0
References: <20200417011146.83973-1-saeedm@mellanox.com> <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com>
 <nycvar.YSQ.7.76.2004181509030.2671@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.2004181509030.2671@knanqh.ubzr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 19 Apr 2020 05:07:43 +0900
Message-ID: <CAK7LNATmPD1R+Ranis2u3yohx8b0+dGKAvFpjg8Eo9yEHRT6zQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>, Jani Nikula <jani.nikula@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Leon Romanovsky <leon@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, jonas@kwiboo.se, David Airlie <airlied@linux.ie>, jernej.skrabec@siol.net, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, linux-rdma@vger.kernel.org

On Sun, Apr 19, 2020 at 4:11 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Sun, 19 Apr 2020, Masahiro Yamada wrote:
>
> > (FOO || !FOO) is difficult to understand, but
> > the behavior of "uses FOO" is as difficult to grasp.
>
> Can't this be expressed as the following instead:
>
>         depends on FOO if FOO
>
> That would be a little clearer.
>
>
> Nicolas



'depends on' does not take the 'if <expr>'

'depends on A if B' is the syntax sugar of
'depends on (A || !B), right ?

I do not know how clearer it would make things.

depends on (m || FOO != m)
is another equivalent, but we are always
talking about a matter of expression.


How important is it to stick to
depends on (FOO || !FOO)
or its equivalents?


If a driver wants to use the feature FOO
in most usecases, 'depends on FOO' is sensible.

If FOO is just optional, you can get rid of the dependency,
and IS_REACHABLE() will do logically correct things.


I do not think IS_REACHABLE() is too bad,
but if it is confusing, we can add one more
option to make it explicit.



config DRIVER_X
       tristate "driver x"

config DRIVER_X_USES_FOO
       bool "use FOO from driver X"
       depends on DRIVER_X
       depends on DRIVER_X <= FOO
       help
         DRIVER_X works without FOO, but
         Using FOO will provide better usability.
         Say Y if you want to make driver X use FOO.



Of course,

      if (IS_ENABLED(CONFIG_DRIVER_X_USES_FOO))
               foo_init();

works like

      if (IS_REACHABLE(CONFIG_FOO))
                foo_init();


At lease, it will eliminate a question like
"I loaded the module FOO, I swear.
But my built-in driver X still would not use FOO, why?"





-- 
Best Regards
Masahiro Yamada
