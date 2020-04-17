Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730091AbgDQLMK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 07:12:10 -0400
Date: Fri, 17 Apr 2020 13:12:05 +0200
From: Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH net-next v1 4/4] kernel/module: Hide vermagic header file
 from general use
Message-ID: <20200417111205.GB2582@linux-8ccs>
References: <20200415133648.1306956-1-leon@kernel.org>
 <20200415133648.1306956-5-leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200415133648.1306956-5-leon@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leonro@mellanox.com>, Borislav Petkov <bp@suse.de>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, netdev@vger.kernel.org

+++ Leon Romanovsky [15/04/20 16:36 +0300]:
>From: Leon Romanovsky <leonro@mellanox.com>
>
>VERMAGIC* definitions are not supposed to be used by the drivers,
>see this [1] bug report, so simply move this header file to be visible
>to kernel/* and scripts files only.
>
>In-tree module build:
>➜  kernel git:(vermagic) ✗ make clean
>➜  kernel git:(vermagic) ✗ make M=drivers/infiniband/hw/mlx5
>➜  kernel git:(vermagic) ✗ modinfo drivers/infiniband/hw/mlx5/mlx5_ib.ko
>filename:	/images/leonro/src/kernel/drivers/infiniband/hw/mlx5/mlx5_ib.ko
><...>
>vermagic:       5.6.0+ SMP mod_unload modversions
>
>Out-of-tree module build:
>➜  mlx5 make -C /images/leonro/src/kernel clean M=/tmp/mlx5
>➜  mlx5 make -C /images/leonro/src/kernel M=/tmp/mlx5
>➜  mlx5 modinfo /tmp/mlx5/mlx5_ib.ko
>filename:       /tmp/mlx5/mlx5_ib.ko
><...>
>vermagic:       5.6.0+ SMP mod_unload modversions
>
>[1] https://lore.kernel.org/lkml/20200411155623.GA22175@zn.tnic
>Reported-by: Borislav Petkov <bp@suse.de>
>Acked-by: Borislav Petkov <bp@suse.de>
>Signed-off-by: Leon Romanovsky <leonro@mellanox.com>

Acked-by: Jessica Yu <jeyu@kernel.org>
