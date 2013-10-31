Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:62426 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751940Ab3JaVuE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Oct 2013 17:50:04 -0400
Date: Thu, 31 Oct 2013 22:49:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: choice =y selection becomes lost after having multiple entries
 =m with depends on
Message-ID: <20131031214958.GA5260@free.fr>
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
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Dirk, All,

On 2013-10-30 15:26 +0100, Dirk Gouders spake thusly:
> Dirk Gouders <dirk@gouders.net> writes:
[--SNIP--]
> below is a patch that prevents choice_values to appear in the list if
> they depend on 'm' symbols and the choice symbol is set to 'y'.  I would
> be glad if you could have a look at it.

Next time, could you use 'git send-email' to send your patches, it makes
reviewing and commenting much simpler.

Also, it does not mangle the patch commit, and thus makes it easier to
apply with 'git am'.

> Yann, in this patch I wrote " if (choice_sym != NULL..." -- I guess that
> is one point that you will probably remark in the previous patch.

When we check that a pointer is valid, there's no reason to check it
against NULL, just:
    if (choice_sym && choice_sym->...)

> Another point is that all the conditionals in both patches could be

I am not sure I understand what issue this patch(es) are supposed to
fix.

What bothers me is that they touch two different places in the code, yet
have the same subject, so it seems both are tryiong to fix the same
issue.

Do you intend that both patches should be applied, or that this second
one supersedes the previous one?

> limited to only those choice_values that are of type tristate but I
> think that makes the code even harder to read...

Yes, and it does not matter since non-trisates are necessarily booleans,
and those are covered since they will never be '== mod', so their
visibility was, and still is, properly handled.

> From 677f5830588749cbb0bdb0568cbdaba271937c8d Mon Sep 17 00:00:00 2001
> From: Dirk Gouders <dirk@gouders.net>
> Date: Wed, 30 Oct 2013 15:06:05 +0100
> Subject: [PATCH 2/2] kconfig/symbol.c: handle visibility of choice_values that
>  depend on 'm' symbols
> 
> If choice_values depend on symbols that are set to 'm' then these
> choice_values should not be visible in choice lists if the choice
> symbol is set to 'y'.  See USB Gadget Drivers, for example.

I liked your previous commit message better, because it had a test-case
that did exhibit the problem.

Can you please:
  - confirm which patch/es is/are needed
  - update the commit log/s back with the test-case/s
  - resend needed patch/es

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
