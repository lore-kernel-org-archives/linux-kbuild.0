Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:43085 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgCKGbR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 02:31:17 -0400
MIME-Version: 1.0
References: <20200311054953.11956-1-masahiroy@kernel.org>
In-Reply-To: <20200311054953.11956-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Mar 2020 15:30:34 +0900
Message-ID: <CAK7LNAQsitL-j0Z5mBC=QWUCxG2uhv1b2oaNh1daFSRwC38A=w@mail.gmail.com>
Subject: Re: [PATCH] net: drop_monitor: make drop_monitor built-in
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Neil Horman <nhorman@tuxdriver.com>, Networking <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>
Cc: Ido Schimmel <idosch@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Pitre <nico@fluxnic.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Mar 11, 2020 at 2:50 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> In net/Kconfig, NET_DEVLINK implies NET_DROP_MONITOR.
>
> The original behavior of the 'imply' keyword prevents NET_DROP_MONITOR
> from being 'm' when NET_DEVLINK=y.
>
> With the planned Kconfig change that relaxes the 'imply', the
> combination of NET_DEVLINK=y and NET_DROP_MONITOR=m would be allowed,
> causing a link error of vmlinux.
>
> As far as I see the mainline code, NET_DROP_MONITOR=m does not provide
> any useful case.
>
> The call-site of net_dm_hw_report() only exists in net/core/devlink.c,
> which is always built-in since NET_DEVLINK is a bool type option.
>
> So, NET_DROP_MONITOR=m causes a build error, or creates an unused
> module at best.
>
> Make NET_DROP_MONITOR a bool option, and remove the module exit code.
> I also unexported net_dm_hw_report because I see no other call-site
> in upstream.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Sorry, I take this back.
This is probably not the right fix.



I just sent an alternative patch.
( Replace IS_ENABLE with IS_REACHABLE )


-- 
Best Regards
Masahiro Yamada
