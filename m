Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:58298 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753262Ab3JWL2W (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Oct 2013 07:28:22 -0400
Message-ID: <5267B2D3.3000109@linutronix.de>
Date: Wed, 23 Oct 2013 13:28:19 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
Subject: Re: choice =y selection becomes lost after having multiple entries
 =m with depends on
References: <5267AA3E.1040003@linutronix.de> <20131023112331.GA3869@free.fr>
In-Reply-To: <20131023112331.GA3869@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

On 10/23/2013 01:23 PM, Yann E. MORIN wrote:
> Sebastian, All,

Hi Yann,

> So, I've tried your tests here, and indeed it does not behave as
> expected. Yet, I can observe a slight deviation from your observations:
> the third time I enter the "USB Gadget Support" sub-menu, the "USB
> Gadget Drivers" choice is back to 'M', not 'Y'. But that's still
> considered an issue.

Yes, that is what I meant. Everything goes back M.

>> So the problem exists only if the item itself has a "depends on" line.
>> Anyone aware of such kconfig limitation?
> 
> I'll try to come up with a smaller test-case to investigate, but since
> I'm at the LinuxCon Europe and ELCE this week (hey! Party tonight!), I
> won't have much time to look at it before the start of next week. Be
> sure to ping me later next week if you do not see any reply (and in case
> no one else solves the issue in the meantime, that is).

Okay, thanks.

> 
> Thanks for this bug report.
> 
> Regards,
> Yann E. MORIN.
> 

Sebastian
