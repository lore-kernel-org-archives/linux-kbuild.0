Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr30068.outbound.protection.outlook.com ([40.107.3.68]:47513
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726741AbgDUMOL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 08:14:11 -0400
Date: Tue, 21 Apr 2020 15:14:04 +0300
From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: [PATCH net-next v2 0/4] Remove vermagic header from global
 include folder
Message-ID: <20200421121404.GL121146@unreal>
References: <20200419141850.126507-1-leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200419141850.126507-1-leon@kernel.org>
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Andy Gospodarek <andy@greyhouse.net>, Borislav Petkov <bp@suse.de>, Ion Badulescu <ionut@badula.org>, Jay Vosburgh <j.vosburgh@gmail.com>, Jessica Yu <jeyu@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, netdev@vger.kernel.org, oss-drivers@netronome.com, Salil Mehta <salil.mehta@huawei.com>, Sebastian Reichel <sre@kernel.org>, Shannon Nelson <snelson@pensando.io>, Veaceslav Falico <vfalico@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>

On Sun, Apr 19, 2020 at 05:18:46PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@mellanox.com>
>
> Changelog:
> v2:
>  * Changed the implementation of patch #4 to be like Masahiro wants.
> I personally don't like this implementation and changing it just to move forward
> this this patchset.
> v1:
> https://lore.kernel.org/lkml/20200415133648.1306956-1-leon@kernel.org
>  * Added tags
>  * Updated patch #4 with test results
>  * Changed scripts/mod/modpost.c to create inclusion of vermagic.h
>    from kernel folder and not from general include/linux. This is
>    needed to generate *.mod.c files, while building modules.
> v0:
> https://lore.kernel.org/lkml/20200414155732.1236944-1-leon@kernel.org
> ----------------------------------------------------------------------------

Dave,

I see in the patchworks that this series is marked as "Needs Review/ACK".
Can you please help me to understand who is needed to be approached?

https://patchwork.ozlabs.org/project/netdev/list/?series=171189

Thanks
