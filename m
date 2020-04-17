Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:48637 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729176AbgDQIIq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 04:08:46 -0400
MIME-Version: 1.0
References: <20200417011146.83973-1-saeedm@mellanox.com> <20200417011146.83973-2-saeedm@mellanox.com>
In-Reply-To: <20200417011146.83973-2-saeedm@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Apr 2020 10:08:26 +0200
Message-ID: <CAK8P3a22OtR5x01iNaSpJ3kM0MBd+dJshKOe6Cp42zukme2A+A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] net/mlx5: Kconfig: Use "uses" instead of "imply"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolas Pitre <nico@fluxnic.net>, Jani Nikula <jani.nikula@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Leon Romanovsky <leon@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@siol.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>

On Fri, Apr 17, 2020 at 3:12 AM Saeed Mahameed <saeedm@mellanox.com> wrote:

> @@ -7,10 +7,10 @@ config MLX5_CORE
>         tristate "Mellanox 5th generation network adapters (ConnectX series) core driver"
>         depends on PCI
>         select NET_DEVLINK
> -       imply PTP_1588_CLOCK
> -       imply VXLAN
> -       imply MLXFW
> -       imply PCI_HYPERV_INTERFACE
> +       uses PTP_1588_CLOCK
> +       uses VXLAN
> +       uses MLXFW
> +       uses PCI_HYPERV_INTERFACE

I have confirmed in the meantime that changing the PCI_HYPERV_INTERFACE
dependency is indeed required, in addition to PTP_1588_CLOCK and VXLAN
that the randconfig tests found earlier:

x86_64-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/main.o: in
function `mlx5_unload':
main.c:(.text+0x325): undefined reference to `mlx5_hv_vhca_cleanup'

I also checked that there is no link failure with MLX5_CORE=y and MLXFW=m,
but only because of an IS_REACHABLE() check in mlxfw/mlxfw.h.
I suppose that should be changed back to IS_ENABLED() now along with
the Kconfig check.

      Arnd
