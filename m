Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:48469 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755298Ab3KHJqH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Nov 2013 04:46:07 -0500
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH v3] kconfig/symbol.c: handle choice_values that depend on 'm' symbols
In-Reply-To: <giob5xioal.fsf@karga.hank.lab> (Dirk Gouders's message of "Wed,
	06 Nov 2013 15:43:14 +0100")
References: <gh4n7wzf0y.fsf@lena.gouders.net>
	<ghvc0cy00x.fsf@lena.gouders.net> <20131105230414.GB3337@free.fr>
	<giob5xioal.fsf@karga.hank.lab>
Date: Fri, 08 Nov 2013 10:46:58 +0100
Message-ID: <gibo1vusx9.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Dirk Gouders <dirk@gouders.net> writes:

[SNIP]

>> Are you sure this test-case exhibits the problem for you?
>
> Yes, but obviously, I did not describe it very clearly.  The steps to
> reproduce the problem are:
>
>      $ ./scripts/kconfig/mconf test.in
>        --> change c0 and c1 to 'm'        # This is the missing part!
>        --> change the choice to 'y'
>        --> do not change anything else
>        --> exit and save
>
> I spontaneously planned to answer with a modified config file with
> default values 'm' specified for 'c0' and 'c1' (complete file below) but
> I noticed that my latest patch does not help in that case.  The first
> patch that modifies sym_calc_value() would handle it nicely but the
> latter one that modifies sym_calc_visibility() does not.  The
> combination also does not work, because sym_calc_visibility() influences
> sym_calc_value().

[SNIP]

Hi Yann, all,

seems that I was a bit misleaded, here.  While looking at how to
possibly fix what I described, I realized that default values for
choice values are not supported and therfore there is no issue:

choices_kconfig:17:warning: defaults for choice values not supported
choices_kconfig:22:warning: defaults for choice values not supported

I noticed these warnings only accidently, when I was using an assert()
that caused an abort and prevented the output to stderr being hidden by
the ncurses output.  Perhaps I should redirect stderr to a file and
inspect it, in the future...

So, my concerns with my own patch were unsubstantiated.

Dirk


> - Sample Kconfig -------------------------------------------------------
>
> config modules
>        boolean modules
>        default y
>        option modules
>
> config dependency
>        tristate "Dependency"
>        default m
>
> choice
> 	tristate "Tristate Choice"
> 	default choice0
>
> config choice0
>        	tristate "Choice 0"
> 	default m
>
> config choice1
> 	tristate "Choice 1"
> 	depends on dependency
> 	default m
>
> endchoice
>
> ------------------------------------------------------------------------
