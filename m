Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:39509 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754628Ab3KAIpc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Nov 2013 04:45:32 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: choice =y selection becomes lost after having multiple entries =m with depends on
In-Reply-To: <20131031214958.GA5260@free.fr> (Yann E. MORIN's message of "Thu,
	31 Oct 2013 22:49:58 +0100")
References: <5267AA3E.1040003@linutronix.de> <20131023112331.GA3869@free.fr>
	<5267B2D3.3000109@linutronix.de> <givc0mbs9b.fsf@karga.hank.lab>
	<52694894.8090201@linutronix.de> <gia9hr5b9m.fsf@karga.hank.lab>
	<giob664yy1.fsf@karga.hank.lab> <20131031214958.GA5260@free.fr>
Date: Fri, 01 Nov 2013 09:45:33 +0100
Message-ID: <gh4n7wzf0y.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Dirk, All,
>
> On 2013-10-30 15:26 +0100, Dirk Gouders spake thusly:
>> Dirk Gouders <dirk@gouders.net> writes:
> [--SNIP--]
>> below is a patch that prevents choice_values to appear in the list if
>> they depend on 'm' symbols and the choice symbol is set to 'y'.  I would
>> be glad if you could have a look at it.
>
> Next time, could you use 'git send-email' to send your patches, it makes
> reviewing and commenting much simpler.
>
> Also, it does not mangle the patch commit, and thus makes it easier to
> apply with 'git am'.
>
>> Yann, in this patch I wrote " if (choice_sym != NULL..." -- I guess that
>> is one point that you will probably remark in the previous patch.
>
> When we check that a pointer is valid, there's no reason to check it
> against NULL, just:
>     if (choice_sym && choice_sym->...)
>
>> Another point is that all the conditionals in both patches could be
>
> I am not sure I understand what issue this patch(es) are supposed to
> fix.
>
> What bothers me is that they touch two different places in the code, yet
> have the same subject, so it seems both are tryiong to fix the same
> issue.
>
> Do you intend that both patches should be applied, or that this second
> one supersedes the previous one?
>
>> limited to only those choice_values that are of type tristate but I
>> think that makes the code even harder to read...
>
> Yes, and it does not matter since non-trisates are necessarily booleans,
> and those are covered since they will never be '== mod', so their
> visibility was, and still is, properly handled.
>
>> From 677f5830588749cbb0bdb0568cbdaba271937c8d Mon Sep 17 00:00:00 2001
>> From: Dirk Gouders <dirk@gouders.net>
>> Date: Wed, 30 Oct 2013 15:06:05 +0100
>> Subject: [PATCH 2/2] kconfig/symbol.c: handle visibility of choice_values that
>>  depend on 'm' symbols
>> 
>> If choice_values depend on symbols that are set to 'm' then these
>> choice_values should not be visible in choice lists if the choice
>> symbol is set to 'y'.  See USB Gadget Drivers, for example.
>
> I liked your previous commit message better, because it had a test-case
> that did exhibit the problem.
>
> Can you please:
>   - confirm which patch/es is/are needed
>   - update the commit log/s back with the test-case/s
>   - resend needed patch/es

Thanks for the comments, Yann, and apologies for the confusion.
Patch v3 comes in a minute and hopefully in a satisfactory format.

You are right, both patches that I sent fix the same (reported) problem
but v2 seems to be more sensible to me, because it causes non-selectable
choices to not even appear in choice lists.  However, it uses the
side-effect or "natural consequence" that a tristate choice_value's
value is set to no in sym_calc_value() if it's visibility is no.  So,
this seems to be a bit subtle and I tried to address it in the new commit
message.

I probably noticed another problem with those tristate choices: if
a non-optional tristate choice is set to 'm', then the default value is
not selected if no other is and I think that is not correct, but I'd
prefer to hear if others also think that this is a problem that should
be fixed.

Dirk



