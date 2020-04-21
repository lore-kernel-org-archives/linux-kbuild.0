Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:54508 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgDUU2L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 16:28:11 -0400
Date: Tue, 21 Apr 2020 13:28:08 -0700 (PDT)
Message-Id: <20200421.132808.1673635156407152563.davem@davemloft.net>
Subject: Re: [PATCH net-next v2 0/4] Remove vermagic header from global
 include folder
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200419141850.126507-1-leon@kernel.org>
References: <20200419141850.126507-1-leon@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: leon@kernel.org
Cc: kuba@kernel.org, leonro@mellanox.com, andy@greyhouse.net, bp@suse.de, ionut@badula.org, j.vosburgh@gmail.com, jeyu@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, masahiroy@kernel.org, michal.lkml@markovi.net, netdev@vger.kernel.org, oss-drivers@netronome.com, salil.mehta@huawei.com, sre@kernel.org, snelson@pensando.io, vfalico@gmail.com, yisen.zhuang@huawei.com

From: Leon Romanovsky <leon@kernel.org>
Date: Sun, 19 Apr 2020 17:18:46 +0300

> This is followup to the failure reported by Borislav [1] and suggested
> fix later on [2].
> 
> The series removes all includes of linux/vermagic.h, updates hns and
> nfp to use same kernel versioning scheme (exactly like we did for
> other drivers in previous cycle) and removes vermagic.h from global
> include folder.
> 
> [1] https://lore.kernel.org/lkml/20200411155623.GA22175@zn.tnic
> [2] https://lore.kernel.org/lkml/20200413080452.GA3772@zn.tnic

Series applied to net-next, thanks.
