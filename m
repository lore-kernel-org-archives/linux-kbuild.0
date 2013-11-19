Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:40738 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752807Ab3KSU5j (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Nov 2013 15:57:39 -0500
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: Segmentation Fault with 'm' Dependencies
In-Reply-To: <20131105230619.GC3337@free.fr> (Yann E. MORIN's message of "Wed,
	6 Nov 2013 00:06:19 +0100")
References: <4647748.CU0TquGsxA@tacticalops> <20131105230619.GC3337@free.fr>
Date: Tue, 19 Nov 2013 21:57:00 +0100
Message-ID: <gheh6c155v.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Martin Walch <walch.martin@web.de>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Libo Chen <libo.chen@huawei.com>

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Martin, All,
>
> On 2013-10-28 03:16 +0100, Martin Walch spake thusly:
>> this test case leads to a segmentation fault:
>> 
>> config A
>> 	tristate "A" if m
>> 
>> config MODULES
>> 	boolean "MODULES"
>> 	option modules
>> 
>> As you can see, the MODULES symbol with the option modules is declared after
>> the first occurrence of an 'm' dependency. (Actually you can drop the MODULES
>> section or use a different symbol name. It does not matter.) Internally 'm' gets
>> converted into (symbol_mod && modules_sym), which adds a dependency on a
>> bad symbol, finally leading to dereferencing a null pointer.
>
> Indeed, reproduced here. I'll investigate further (although anyone is
> free to hack it, too! :-p)

Hi Yann, all,

I had a look at the problem, Martin reported and found out that menu_check_dep()
is causing the problem:

...
	case E_SYMBOL:
		/* change 'm' into 'm' && MODULES */
		if (e->left.sym == &symbol_mod)
			return expr_alloc_and(e, expr_alloc_symbol(modules_sym));
		break;
...

It generates an expression that uses modules_sym which is NULL at that
time.

The problem seems to be that since commit 6902dccfda005fa modules_sym is
NULL until an "option modules" is found or the default is set but part
of the code needs a valid pointer at any time.

I played with other possible fixes but got the impression that these
would add even more complicated code and I decided to propose the patch
that I will send in a minute.  That patch basically reverts commit
6902dccfda005fa keeping the changes that (as far as I understood) are
the important part of that commit.  The parser also needs to be
regenerated but that should happen in a separate commit if I remember
corretly.  So, for now and until a review, I left it out.

I would be glad if you could have a look at the patch.

Dirk


>> If you move the declaration of the MODULES symbol to the top, everything
>> works fine.
>> 
>> The crash has been introduced last month with
>> 
>> > 6902dccfda005fa4c42410fa064fdd331ab42479
>> > kconfig: do not special-case 'MODULES' symbol
>> 
>> However, things were probably broken before. The problem has only
>> become visible.
>> 
>> The reason that configuring a Linux kernel does not crash the
>> configuration system is that there is currently no architecture that has a
>> symbol with a dependency on 'm' anywhere before the MODULES symbol.
>
> Regards,
> Yann E. MORIN.
