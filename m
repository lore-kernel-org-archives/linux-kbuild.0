Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:58041 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756536Ab1EYVjP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 17:39:15 -0400
Date: Wed, 25 May 2011 17:39:07 -0400 (EDT)
Message-Id: <20110525.173907.991720348148063903.davem@davemloft.net>
Subject: Re: [PATCH 28/34] atm: Drop __TIME__ usage
From: David Miller <davem@davemloft.net>
In-Reply-To: <4DDD6B59.9000108@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
	<1302015561-21047-29-git-send-email-mmarek@suse.cz>
	<4DDD6B59.9000108@suse.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

From: Michal Marek <mmarek@suse.cz>
Date: Wed, 25 May 2011 22:49:29 +0200

> Dne 5.4.2011 16:59, Michal Marek napsal(a):
>> The kernel already prints its build timestamp during boot, no need to
>> repeat it in random drivers and produce different object files each
>> time.
>> 
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: netdev@vger.kernel.org
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
>> ---
>>  net/atm/lec.c |    2 +-
>>  net/atm/mpc.c |    2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Hi,
> 
> I don't see this patch in today's linux-next. Any objection against me
> applying it to the kbuild-2.6.git repository?

Please apply it:

Acked-by: David S. Miller <davem@davemloft.net>
