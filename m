Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:40421 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730903AbgDQU3q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 16:29:46 -0400
MIME-Version: 1.0
References: <20200417200627.129849-1-saeedm@mellanox.com>
In-Reply-To: <20200417200627.129849-1-saeedm@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Apr 2020 22:29:26 +0200
Message-ID: <CAK8P3a0nhotshTR0Bm7abRT5GLbUVYzD0CGnwaOa=+u0n6zApw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] Kconfig: Introduce "uses" keyword
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolas Pitre <nico@fluxnic.net>, Jani Nikula <jani.nikula@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Leon Romanovsky <leon@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@siol.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>

On Fri, Apr 17, 2020 at 10:07 PM Saeed Mahameed <saeedm@mellanox.com> wrote:

> V2: - Fix double free due to single allocation of sym expr.
>     - Added a 3rd patch to convert to new keyword treewide.

I've applied on my randconfig test tree, I'll let you know if something
breaks over the weekend, the initial few builds went fine.

       Arnd
