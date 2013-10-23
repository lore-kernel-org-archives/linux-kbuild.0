Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:50121 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752441Ab3JWLXl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Oct 2013 07:23:41 -0400
Date: Wed, 23 Oct 2013 12:23:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: choice =y selection becomes lost after having multiple entries
 =m with depends on
Message-ID: <20131023112331.GA3869@free.fr>
References: <5267AA3E.1040003@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5267AA3E.1040003@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Sebastian, All,

On 2013-10-23 12:51 +0200, Sebastian Andrzej Siewior spake thusly:
> Hi,
> 
> in USB gadget menu (that is Device Drivers ---> USB support ---> USB
> Gadget Support --->  USB Gadget Drivers) I can create a configuration
> which is "lost". Here is how to reproduce it:
> 
> - first config two gadgets as M:
>  <M>   USB Gadget Drivers
>  <M>     Audio Gadget
>  <M>     Ethernet Gadget
>  <M>     MIDI Gadget
> 
>  save config & leave
> 
> - now start menu config again and go to the same menu, now select
>   built-in:
>   <*>   USB Gadget Drivers (Ethernet Gadget
>   the ethernet gadget is chosen automatically because we can have only
>   one gadget selected.
>   save config & leave
> 
> - step three, go back to the menu and you will see that everything is
>   as it was (the <*> is ignored).
> 
> With only Audio & Ethernet =m and Midi =n then the switch to =y
> behaves differently: The menu looks correct (=y) but the .config keeps
> the Audio gadget as =M and it is built. Having multiple entries =m
> which have no "depends on" behaves correctly.

So, I've tried your tests here, and indeed it does not behave as
expected. Yet, I can observe a slight deviation from your observations:
the third time I enter the "USB Gadget Support" sub-menu, the "USB
Gadget Drivers" choice is back to 'M', not 'Y'. But that's still
considered an issue.

> So the problem exists only if the item itself has a "depends on" line.
> Anyone aware of such kconfig limitation?

I'll try to come up with a smaller test-case to investigate, but since
I'm at the LinuxCon Europe and ELCE this week (hey! Party tonight!), I
won't have much time to look at it before the start of next week. Be
sure to ping me later next week if you do not see any reply (and in case
no one else solves the issue in the meantime, that is).

Thanks for this bug report.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
