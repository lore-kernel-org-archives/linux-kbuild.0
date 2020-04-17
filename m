Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:51859 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729278AbgDQKZQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 06:25:16 -0400
MIME-Version: 1.0
References: <20200417011146.83973-1-saeedm@mellanox.com>
In-Reply-To: <20200417011146.83973-1-saeedm@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Apr 2020 12:24:54 +0200
Message-ID: <CAK8P3a2LXR1pHoid7F69Q6VZp4E0g-Fcdt03PaGdebxWpguexw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolas Pitre <nico@fluxnic.net>, Jani Nikula <jani.nikula@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Leon Romanovsky <leon@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@siol.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>

On Fri, Apr 17, 2020 at 3:12 AM Saeed Mahameed <saeedm@mellanox.com> wrote:
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

Thanks a lot for getting this done. I've tried it out on my randconfig
build tree
and can confirm that this works together with your second patch to address the
specific MLX5 problem.

I also tried out replacing all other instances of 'depends on FOO ||
!FOO', using
this oneline script:

git ls-files | grep Kconfig |  xargs sed -i
's:depends.on.\([A-Z0-9_a-z]\+\) || \(\1 \?= \?n\|!\1\):uses \1:'

Unfortunately, this immediately crashes with:

$ make -skj30
how to free type 0?
double free or corruption (fasttop)
make[6]: *** [/git/arm-soc/scripts/kconfig/Makefile:71: olddefconfig]
Aborted (core dumped)
make[5]: *** [/git/arm-soc/Makefile:587: olddefconfig] Error 2
make[4]: *** [/git/arm-soc/scripts/kconfig/Makefile:95:
allrandom.config] Error 2
make[3]: *** [/git/arm-soc/Makefile:587: allrandom.config] Error 2
make[2]: *** [Makefile:180: sub-make] Error 2
make[2]: Target 'allrandom.config' not remade because of errors.
make[1]: *** [makefile:127: allrandom.config] Error 2

It's probably easy to fix, but I did not look any deeper into the bug.

       Arnd
