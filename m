Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:40962 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgDRTBf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Apr 2020 15:01:35 -0400
MIME-Version: 1.0
References: <20200417011146.83973-1-saeedm@mellanox.com>
In-Reply-To: <20200417011146.83973-1-saeedm@mellanox.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 19 Apr 2020 04:00:43 +0900
Message-ID: <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolas Pitre <nico@fluxnic.net>, Jani Nikula <jani.nikula@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Leon Romanovsky <leon@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, jonas@kwiboo.se, David Airlie <airlied@linux.ie>, jernej.skrabec@siol.net, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, linux-rdma@vger.kernel.org

On Fri, Apr 17, 2020 at 10:12 AM Saeed Mahameed <saeedm@mellanox.com> wrote:
>
> Due to the changes to the semantics of imply keyword [1], which now
> doesn't force any config options to the implied configs any more.
>
> A module (FOO) that has a weak dependency on some other modules (BAR)
> is now broken if it was using imply to force dependency restrictions.
> e.g.: FOO needs BAR to be reachable, especially when FOO=y and BAR=m.
> Which might now introduce build/link errors.
>
> There are two options to solve this:
> 1. use IS_REACHABLE(BAR), everywhere BAR is referenced inside FOO.
> 2. in FOO's Kconfig add: depends on (BAR || !BAR)
>
> The first option is not desirable, and will leave the user confused when
> setting FOO=y and BAR=m, FOO will never reach BAR even though both are
> compiled.
>
> The 2nd one is the preferred approach, and will guarantee BAR is always
> reachable by FOO if both are compiled. But, (BAR || !BAR) is really
> confusing for those who don't really get how kconfig tristate arithmetics
> work.
>
> To solve this and hide this weird expression and to avoid repetition
> across the tree, we introduce new keyword "uses" to the Kconfig options
> family.
>
> uses BAR:
> Equivalent to: depends on symbol || !symbol
> Semantically it means, if FOO is enabled (y/m) and has the option:
> uses BAR, make sure it can reach/use BAR when possible.
>
> For example: if FOO=y and BAR=m, FOO will be forced to m.
>
> [1] https://lore.kernel.org/linux-doc/20200302062340.21453-1-masahiroy@kernel.org/
>
> Link: https://lkml.org/lkml/2020/4/8/839
> Signed-off-by: Saeed Mahameed <saeedm@mellanox.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---


I am not convinced with this patch.

This patch adds another way to do the same thing.
It is true that it _hides_ the problems, and
makes the _surface_  cleaner at best,
but the internal will be more complicated.

(FOO || !FOO) is difficult to understand, but
the behavior of "uses FOO" is as difficult to grasp.

People would wonder, "what 'uses FOO' means?",
then they would find the explanation in kconfig-language.rst:

  "Equivalent to: depends on symbol || !symbol
  Semantically it means, if FOO is enabled (y/m) and has the option:
  uses BAR, make sure it can reach/use BAR when possible."

To understand this correctly, people must study
the arithmetic of (symbol || !symbol) anyway.

I do not want to extend Kconfig for the iffy syntax sugar.


(symbol || !symbol) is horrible.
But, I am also scared to see people would think 'uses symbol'
is the right thing to do, and start using it liberally
all over the place.





--
Best Regards

Masahiro Yamada
