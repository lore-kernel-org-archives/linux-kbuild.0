Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:47317 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083Ab3KGOBs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Nov 2013 09:01:48 -0500
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH v3] kconfig/symbol.c: handle choice_values that depend on 'm' symbols
In-Reply-To: <20131106185900.GA3482@free.fr> (Yann E. MORIN's message of "Wed,
	6 Nov 2013 19:59:00 +0100")
References: <gh4n7wzf0y.fsf@lena.gouders.net>
	<ghvc0cy00x.fsf@lena.gouders.net> <20131105230414.GB3337@free.fr>
	<giob5xioal.fsf@karga.hank.lab> <20131106185900.GA3482@free.fr>
Date: Thu, 07 Nov 2013 15:02:01 +0100
Message-ID: <ghr4asl38m.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Dirk, All,
>
> On 2013-11-06 15:43 +0100, Dirk Gouders spake thusly:
>> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> [--SNIP--]
>> > It seems I'm missing something here.
> [--SNIP--]
>> Yes, but obviously, I did not describe it very clearly.  The steps to
>> reproduce the problem are:
>> 
>>      $ ./scripts/kconfig/mconf test.in
>>        --> change c0 and c1 to 'm'        # This is the missing part!
>
> Aha! Gotcha. Thanks.
>
>> I spontaneously planned to answer with a modified config file with
>> default values 'm' specified for 'c0' and 'c1' (complete file below) but
>> I noticed that my latest patch does not help in that case.  The first
>> patch that modifies sym_calc_value() would handle it nicely but the
>> latter one that modifies sym_calc_visibility() does not.  The
>> combination also does not work, because sym_calc_visibility() influences
>> sym_calc_value().
>> 
>> So, I have to say that I am no longer really satisfied with the patch.
>> It fixes the reported problem but I think it should fix related
>> obvious problems as well (see config below).  I'd prefer I take some
>> more time and try to find a more sensible fix.
>
> Please, one patch to fix one bug.
>
> It does not matter if you need to touch the same part of the code, but
> please keep fixes for different bugs, separate (unless of course, the
> bugs are just different manifestations of the same deficiency in the
> code).

I understand.  I will send a v4 with a clearer description of the steps
needed to trigger the problem and also the added Tested-by: line, in
case you see a need for it.

The other two problems I mentioned are concerning default values of
tristate choices and I am quite confident that those fixes will touch
other parts of the code.

Dirk
