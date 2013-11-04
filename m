Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:58141 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526Ab3KDR1J (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Nov 2013 12:27:09 -0500
Date: Mon, 4 Nov 2013 18:27:02 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3] kconfig/symbol.c: handle choice_values that depend
 on 'm' symbols
Message-ID: <20131104172702.GA11719@linutronix.de>
References: <gh4n7wzf0y.fsf@lena.gouders.net>
 <ghvc0cy00x.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ghvc0cy00x.fsf@lena.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

* Dirk Gouders | 2013-11-01 00:39:46 [+0100]:

>This patch sets choice_values' visibility that depend on symbols set
>to 'm' to 'n' if the corresponding choice is set to 'y'.  This makes
>them disappear from the choice list and will also cause the
>choice_values' value set to 'n' in sym_calc_value() and as a result
>they are written as "not set" to the resulting .config file.
>
>Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Still solves the issue for me :)

>Signed-off-by: Dirk Gouders <dirk@gouders.net>

Sebastian
