Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:45154 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964784AbbCLRav (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 13:30:51 -0400
Message-ID: <1426181444.11398.167.camel@edumazet-glaptop2.roam.corp.google.com>
Subject: Re: [PATCH] net:Kconfig: drop no sense dependence entry for BONDING
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Thu, 12 Mar 2015 10:30:44 -0700
In-Reply-To: <5969250.CkvXFhddBO@tacticalops>
References: <20150312135933.GA3502@udknight>
	 <5969250.CkvXFhddBO@tacticalops>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: Wang YanQing <udknight@gmail.com>, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, j.vosburgh@gmail.com, vfalico@gmail.com, gospo@cumulusnetworks.com, Erik Hugne <erik.hugne@ericsson.com>

On Thu, 2015-03-12 at 16:14 +0100, Martin Walch wrote:
> On Thursday 12 March 2015 21:59:33 Wang YanQing wrote:
> > "IPV6 || IPV6=n" means no dependence!
> 
> IPV6 and BONDING are both tristate symbols and therefore this is not the same
> as no dependency. When setting IPV6 to m, the expression evaluates to
> 
> "IPV6 || IPV6=n" 
> "m || m=n"
> "m || n"
> "m"
> 
> So, if IPV6=m, then BONDING can only be n or m, but not y.

Right.

But it looks like bonding driver no longer has IPV6 dependencies.

Patch should work, but the changelog should be changed to explain why
the patch is valid, and this should be tested.

Presumably we need to make sure the following builds and runs properly

CONFIG_BONDING=y
CONFIG_IPV6=m



