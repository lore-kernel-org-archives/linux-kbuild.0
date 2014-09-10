Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:35641 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750844AbaIJDkV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Sep 2014 23:40:21 -0400
Date: Tue, 09 Sep 2014 20:40:20 -0700 (PDT)
Message-Id: <20140909.204020.352836914323089696.davem@davemloft.net>
Subject: Re: [PATCH 1/3] kbuild: remove unnecessary "obj- := dummy.o" trick
From: David Miller <davem@davemloft.net>
In-Reply-To: <1410258381-7088-2-git-send-email-yamada.m@jp.panasonic.com>
References: <1410258381-7088-1-git-send-email-yamada.m@jp.panasonic.com>
	<1410258381-7088-2-git-send-email-yamada.m@jp.panasonic.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.m@jp.panasonic.com
Cc: linux-kbuild@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, mturquette@linaro.org, laurent.pinchart+renesas@ideasonboard.com, horms+renesas@verge.net.au, geert@linux-m68k.org, wsa@sang-engineering.com, takasi-y@ops.dti.ne.jp, ulrich.hecht@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Date: Tue,  9 Sep 2014 19:26:19 +0900

> In these Makefiles, at least one of "obj-y" and "obj-" is non-empty,
> hence built-in.o is always created without such a trick.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

For networking:

Acked-by: David S. Miller <davem@davemloft.net>
