Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:65507 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748Ab3KDUrC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Nov 2013 15:47:02 -0500
Date: Mon, 4 Nov 2013 21:46:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v3] kconfig/symbol.c: handle choice_values that depend on
 'm' symbols
Message-ID: <20131104204655.GC32603@free.fr>
References: <gh4n7wzf0y.fsf@lena.gouders.net>
 <ghvc0cy00x.fsf@lena.gouders.net>
 <20131104172702.GA11719@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20131104172702.GA11719@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Dirk Gouders <dirk@gouders.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Sebastian, All,

On 2013-11-04 18:27 +0100, Sebastian Andrzej Siewior spake thusly:
> * Dirk Gouders | 2013-11-01 00:39:46 [+0100]:
> 
> >This patch sets choice_values' visibility that depend on symbols set
> >to 'm' to 'n' if the corresponding choice is set to 'y'.  This makes
> >them disappear from the choice list and will also cause the
> >choice_values' value set to 'n' in sym_calc_value() and as a result
> >they are written as "not set" to the resulting .config file.
> >
> >Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Still solves the issue for me :)

Should I consider this as:
    Tested-by: <you>
?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
