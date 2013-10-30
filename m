Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:52991 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751778Ab3J3Kah (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Oct 2013 06:30:37 -0400
MIME-Version: 1.0
In-Reply-To: <gia9hr5b9m.fsf@karga.hank.lab>
References: <5267AA3E.1040003@linutronix.de>
	<20131023112331.GA3869@free.fr>
	<5267B2D3.3000109@linutronix.de>
	<givc0mbs9b.fsf@karga.hank.lab>
	<52694894.8090201@linutronix.de>
	<gia9hr5b9m.fsf@karga.hank.lab>
Date: Wed, 30 Oct 2013 11:30:35 +0100
Message-ID: <CAN_we7ME34yFJTCX-SjtYxLgd-riHz4+73meA2LEPNByzMnvmw@mail.gmail.com>
Subject: Re: choice =y selection becomes lost after having multiple entries =m
 with depends on
From: Daniele Forsi <dforsi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

2013/10/30 Dirk Gouders:

> Those values are also written to the config file causing modules when
> they should not.

this sentence of the commit message is missing something, I think you mean:
s/causing modules/causing modules to be built/

-- 
Daniele Forsi
