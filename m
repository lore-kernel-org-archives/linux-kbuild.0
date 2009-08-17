Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40967
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751714AbZHQBVz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 16 Aug 2009 21:21:55 -0400
Date: Sun, 16 Aug 2009 18:22:06 -0700 (PDT)
Message-Id: <20090816.182206.12029168.davem@davemloft.net>
Subject: Re: [PATCH] sparc64: list zImage build target in 'make help' output
From: David Miller <davem@davemloft.net>
In-Reply-To: <200907232055.19176.elendil@planet.nl>
References: <200907162041.53181.elendil@planet.nl>
	<200907232055.19176.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: elendil@planet.nl
Cc: sparclinux@vger.kernel.org, linux-kbuild@vger.kernel.org, jurij@wooyd.org

From: Frans Pop <elendil@planet.nl>
Date: Thu, 23 Jul 2009 20:55:18 +0200

> The zImage target was added and gets built by default.
> 
> Signed-off-by: Frans Pop <elendil@planet.nl>
> Cc: Jurij Smakov <jurij@wooyd.org>
> ---
> 
> While looking at Sam Ravnborg's comments I noticed that the following
> should be added on top of Jurij's patch.
> 
> David: if you prefer to merge this into the previous patch, that'd be
> fine by me.

I merged it into the sparc64 zImage patch, thanks!
