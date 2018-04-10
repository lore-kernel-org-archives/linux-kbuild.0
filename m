Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:36102 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753128AbeDJNzU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Apr 2018 09:55:20 -0400
Date: Tue, 10 Apr 2018 06:55:16 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [BUG] Fix drivers/memory O= build
Message-ID: <20180410135516.GT5700@atomide.com>
References: <20180406102519.GN16141@n2100.armlinux.org.uk>
 <20180406164615.GL5700@atomide.com>
 <06568f5b-3e4a-f761-7242-85dcc8aeb6a5@oracle.com>
 <20180406185505.GD10990@n2100.armlinux.org.uk>
 <CAK7LNARbST+-oy-J9B2Q2vSp0nhnn9gqOnT7urZdjQZhSpYB-Q@mail.gmail.com>
 <20180407133817.GE10990@n2100.armlinux.org.uk>
 <ba6087c5-c69e-1adc-9d9d-0ef5b19fb30e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba6087c5-c69e-1adc-9d9d-0ef5b19fb30e@ti.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dave Gerlach <d-gerlach@ti.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux-OMAP <linux-omap@vger.kernel.org>, arm-soc@armlinux.org.uk

* Dave Gerlach <d-gerlach@ti.com> [180409 16:07]:
> I've inlined the changes below. I will send a proper split up series if it's
> considered acceptable.

Seems fine from my point of view. No need to split the patch, best to
do the fix as a single patch.

We should test build it also with make randconfigs though.

So assuming others are OK with this and it does not introduce
new randconfig build errors:

Acked-by: Tony Lindgren <tony@atomide.com>
