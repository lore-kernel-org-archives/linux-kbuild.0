Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:33399 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754425Ab1EYUox (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 16:44:53 -0400
Date: Wed, 25 May 2011 16:44:44 -0400 (EDT)
Message-Id: <20110525.164444.2193508932003281317.davem@davemloft.net>
Subject: Re: [PATCH 18/34] wan/pc300: Drop __TIME__ usage
From: David Miller <davem@davemloft.net>
In-Reply-To: <4DDD69DD.7030601@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
	<1302015561-21047-19-git-send-email-mmarek@suse.cz>
	<4DDD69DD.7030601@suse.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

From: Michal Marek <mmarek@suse.cz>
Date: Wed, 25 May 2011 22:43:09 +0200

> Dne 5.4.2011 16:59, Michal Marek napsal(a):
>> The kernel already prints its build timestamp during boot, no need to
>> repeat it in random drivers and produce different object files each
>> time.
>> 
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: netdev@vger.kernel.org
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
>> ---
>>  drivers/net/wan/pc300_drv.c |    3 +--
>>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> I don't see the patch in today's linux-next. Does anyone object against
> me applying it to kbuild-2.6.git?

Just do it :-)

Acked-by: David S. Miller <davem@davemloft.net>
