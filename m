Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40301 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752776Ab3GAJkM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Jul 2013 05:40:12 -0400
Message-ID: <51D14E78.7040309@ladisch.de>
Date: Mon, 01 Jul 2013 11:40:08 +0200
From: Clemens Ladisch <clemens@ladisch.de>
MIME-Version: 1.0
Subject: Re: 3.10.0-rc7: rtc_cmos.o: No linking because of missing CONFIG_HPET
References: <20130629204217.GA2589@rhi.hi.is> <51D14128.3040608@suse.cz>
In-Reply-To: <51D14128.3040608@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bjarni Ingi Gislason <bjarniig@rhi.hi.is>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>

> On 29.6.2013 22:42, Bjarni Ingi Gislason wrote:
>>   The file "drivers/rtc/rtc_cmos.c" needs CONFIG_HPET to get linked.
>>
>> rtc-cmos.c:(.text+0x16f214): undefined reference to `hpet_rtc_interrupt'

CONFIG_HPET enables drivers/char/hpet.c and nothing else; it does not
affect the HPET RTC emulation.

You are probably searching for CONFIG_HPET_EMULATE_RTC.


Regards,
Clemens
