Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:62625
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728932AbgCKJbs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 05:31:48 -0400
Date: Wed, 11 Mar 2020 11:31:43 +0200
From: Ido Schimmel <idosch@mellanox.com>
Subject: Re: [PATCH] net: drop_monitor: use IS_REACHABLE() to guard
 net_dm_hw_report()
Message-ID: <20200311093143.GB279080@splinter>
References: <20200311062925.5163-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311062925.5163-1-masahiroy@kernel.org>
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, nhorman@tuxdriver.com, jiri@mellanox.com
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Pitre <nico@fluxnic.net>, linux-kbuild@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org

On Wed, Mar 11, 2020 at 03:29:25PM +0900, Masahiro Yamada wrote:
> In net/Kconfig, NET_DEVLINK implies NET_DROP_MONITOR.
> 
> The original behavior of the 'imply' keyword prevents NET_DROP_MONITOR
> from being 'm' when NET_DEVLINK=y.
> 
> With the planned Kconfig change that relaxes the 'imply', the
> combination of NET_DEVLINK=y and NET_DROP_MONITOR=m would be allowed.
> 
> Use IS_REACHABLE() to avoid the vmlinux link error for this case.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks, Masahiro.

Neil, Jiri, another option (long term) is to add a raw tracepoint (not
part of ABI) in devlink and have drop monitor register its probe on it
when monitoring.

Two advantages:
1. Consistent with what drop monitor is already doing with kfree_skb()
tracepoint
2. We can remove 'imply NET_DROP_MONITOR' altogether

What do you think?
