Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:37027 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751358Ab3J3Kko (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Oct 2013 06:40:44 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: choice =y selection becomes lost after having multiple entries =m with depends on
In-Reply-To: <CAN_we7ME34yFJTCX-SjtYxLgd-riHz4+73meA2LEPNByzMnvmw@mail.gmail.com>
	(Daniele Forsi's message of "Wed, 30 Oct 2013 11:30:35 +0100")
References: <5267AA3E.1040003@linutronix.de> <20131023112331.GA3869@free.fr>
	<5267B2D3.3000109@linutronix.de> <givc0mbs9b.fsf@karga.hank.lab>
	<52694894.8090201@linutronix.de> <gia9hr5b9m.fsf@karga.hank.lab>
	<CAN_we7ME34yFJTCX-SjtYxLgd-riHz4+73meA2LEPNByzMnvmw@mail.gmail.com>
Date: Wed, 30 Oct 2013 11:41:29 +0100
Message-ID: <gizjpr3usm.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniele Forsi <dforsi@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Daniele Forsi <dforsi@gmail.com> writes:

> 2013/10/30 Dirk Gouders:
>
>> Those values are also written to the config file causing modules when
>> they should not.
>
> this sentence of the commit message is missing something, I think you mean:
> s/causing modules/causing modules to be built/

Yes, thanks, that is correct.

I will fix that in a v2 or perhaps Yann will do if he does not notice
other problems with the patch.

Dirk
