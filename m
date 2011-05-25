Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:58263 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754489Ab1EYPXY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 11:23:24 -0400
Message-ID: <4DDD1EEA.6060907@suse.cz>
Date: Wed, 25 May 2011 17:23:22 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 15/34] baycom: Drop __TIME__ usage
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>	 <1302015561-21047-16-git-send-email-mmarek@suse.cz> <1302015780.4124.53.camel@xbox360.hq.axsem.com>
In-Reply-To: <1302015780.4124.53.camel@xbox360.hq.axsem.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Sailer <t.sailer@alumni.ethz.ch>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, linux-hams@vger.kernel.org, Linux Kernel Network Developers <netdev@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On 5.4.2011 17:03, Thomas Sailer wrote:
> On Tue, 2011-04-05 at 16:59 +0200, Michal Marek wrote:
>> The kernel already prints its build timestamp during boot, no need to
>> repeat it in random drivers and produce different object files each
>> time.
>>
>> Cc: Thomas Sailer<t.sailer@alumni.ethz.ch>
>> Cc: linux-hams@vger.kernel.org
>> Cc: netdev@vger.kernel.org
>> Signed-off-by: Michal Marek<mmarek@suse.cz>
> Acked-By: Thomas Sailer<t.sailer@alumni.ethz.ch>

I didn't found the commit in today's linux-next, so I applied this to 
kbuild-2.6.git#trivial.

Michal
