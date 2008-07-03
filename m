Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail37.messagelabs.com ([216.82.244.163]:21780 "EHLO
	mail37.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759255AbYGCM3X (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Jul 2008 08:29:23 -0400
Date: Thu, 3 Jul 2008 14:29:19 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: selecting a tristate
Message-ID: <20080703122919.GA22543@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello,

I wrote a network driver that needs CONFIG_CRC32, so I have:

	config NS9XXX_ETH
		tristate "..."
		depends on PHYLIB
		select CRC32

Currently if I choose CONFIG_NS9XXX_ETH=m I get CONFIG_CRC32=y.  I would
prefer to only get CONFIG_CRC32>=CONFIG_NS9XXX_ETH.  I tried to
implement it, but I did't find a way to do so.

Is this idea sensible?  Do you know any breakage this would introduce?

AFAIK "depends on" works this way.  That is if CONFIG_PHYLIB=m above I
cannot select NS9XXX_ETH=y.

Best regards
Uwe

-- 
Uwe Kleine-König, Software Engineer
Digi International GmbH Branch Breisach, Küferstrasse 8, 79206 Breisach, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 13962
