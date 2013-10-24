Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:56759 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753800Ab3JXPaQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Oct 2013 11:30:16 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: choice =y selection becomes lost after having multiple entries =m with depends on
In-Reply-To: <5267B2D3.3000109@linutronix.de> (Sebastian Andrzej Siewior's
	message of "Wed, 23 Oct 2013 13:28:19 +0200")
References: <5267AA3E.1040003@linutronix.de> <20131023112331.GA3869@free.fr>
	<5267B2D3.3000109@linutronix.de>
Date: Thu, 24 Oct 2013 17:30:56 +0200
Message-ID: <givc0mbs9b.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:

> On 10/23/2013 01:23 PM, Yann E. MORIN wrote:
>> Sebastian, All,
>
> Hi Yann,
>
>> So, I've tried your tests here, and indeed it does not behave as
>> expected. Yet, I can observe a slight deviation from your observations:
>> the third time I enter the "USB Gadget Support" sub-menu, the "USB
>> Gadget Drivers" choice is back to 'M', not 'Y'. But that's still
>> considered an issue.
>
> Yes, that is what I meant. Everything goes back M.

Hi Sebastian,

I was looking at what you described and initially had a hard time to
reproduce the problem, probably because I tried it after `make
mrproper'.  I am only able to reproduce the problem with an existing
.config of my running kernel, for example.

Just to make sure that I am correctly trying to reproduce the problem:
did you already try to do what you described after a `make mrproper' and
do you then also notice the described problems?  If not, could you
please try that?

Thanks,

Dirk

>>> So the problem exists only if the item itself has a "depends on" line.
>>> Anyone aware of such kconfig limitation?
>> 
>> I'll try to come up with a smaller test-case to investigate, but since
>> I'm at the LinuxCon Europe and ELCE this week (hey! Party tonight!), I
>> won't have much time to look at it before the start of next week. Be
>> sure to ping me later next week if you do not see any reply (and in case
>> no one else solves the issue in the meantime, that is).
>
> Okay, thanks.
>
>> 
>> Thanks for this bug report.
>> 
>> Regards,
>> Yann E. MORIN.
>> 
>
> Sebastian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
