Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:37350 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751785Ab3JaKUi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Oct 2013 06:20:38 -0400
Date: Thu, 31 Oct 2013 11:20:30 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: choice =y selection becomes lost after having multiple entries
 =m with depends on
Message-ID: <20131031102030.GB20199@linutronix.de>
References: <5267AA3E.1040003@linutronix.de>
 <20131023112331.GA3869@free.fr>
 <5267B2D3.3000109@linutronix.de>
 <givc0mbs9b.fsf@karga.hank.lab>
 <52694894.8090201@linutronix.de>
 <gia9hr5b9m.fsf@karga.hank.lab>
 <giob664yy1.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <giob664yy1.fsf@karga.hank.lab>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

* Dirk Gouders | 2013-10-30 15:26:30 [+0100]:

>Hi Sebastian, Yann, all,
Hi Dirk,

>below is a patch that prevents choice_values to appear in the list if
>they depend on 'm' symbols and the choice symbol is set to 'y'.  I would
>be glad if you could have a look at it.

I applied this patch (and ignored the other one in this thread) and the
problem Tomi Valkeinen noticed and I reported here seems to be gone.
Thank you very much.

>Dirk

Sebastian
