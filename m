Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:34671 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752267Ab3KSVj0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Nov 2013 16:39:26 -0500
Received: by mail-wg0-f43.google.com with SMTP id n12so8108147wgh.34
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Nov 2013 13:39:25 -0800 (PST)
Date: Tue, 19 Nov 2013 22:39:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: Segmentation Fault with 'm' Dependencies
Message-ID: <20131119213918.GA3422@free.fr>
References: <4647748.CU0TquGsxA@tacticalops>
 <20131105230619.GC3337@free.fr>
 <gheh6c155v.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gheh6c155v.fsf@lena.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Martin Walch <walch.martin@web.de>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Libo Chen <libo.chen@huawei.com>

Dirk, All,

On 2013-11-19 21:57 +0100, Dirk Gouders spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> > On 2013-10-28 03:16 +0100, Martin Walch spake thusly:
> >> this test case leads to a segmentation fault:
> >> 
> >> config A
> >> 	tristate "A" if m
> >> 
> >> config MODULES
> >> 	boolean "MODULES"
> >> 	option modules
> >> 
> >> As you can see, the MODULES symbol with the option modules is declared after
> >> the first occurrence of an 'm' dependency. (Actually you can drop the MODULES
> >> section or use a different symbol name. It does not matter.) Internally 'm' gets
> >> converted into (symbol_mod && modules_sym), which adds a dependency on a
> >> bad symbol, finally leading to dereferencing a null pointer.
> >
> > Indeed, reproduced here. I'll investigate further (although anyone is
> > free to hack it, too! :-p)
> 
> Hi Yann, all,
> 
> I had a look at the problem, Martin reported and found out that menu_check_dep()
> is causing the problem:
> 
> ...
> 	case E_SYMBOL:
> 		/* change 'm' into 'm' && MODULES */
> 		if (e->left.sym == &symbol_mod)
> 			return expr_alloc_and(e, expr_alloc_symbol(modules_sym));
> 		break;
> ...
> 
> It generates an expression that uses modules_sym which is NULL at that
> time.
> 
> The problem seems to be that since commit 6902dccfda005fa modules_sym is
> NULL until an "option modules" is found or the default is set but part
> of the code needs a valid pointer at any time.

Indeed. The idea behind that patch was that we would post-pone
allocating modules_sym until we either see the actual 'modules' option,
or until the end of the parsing, since checking the value of the symbol
is not needed until we actually display the menu.

But that's wrong, since we do need that symbol at the time of parsing,
to generate the dependency list, as Martin discovered.

I missed that since no architecture in the kernel has any option that
depends on 'MODULES' before it is defined in Kconfig.

> I played with other possible fixes but got the impression that these
> would add even more complicated code and I decided to propose the patch
> that I will send in a minute.  That patch basically reverts commit
> 6902dccfda005fa keeping the changes that (as far as I understood) are
> the important part of that commit.  The parser also needs to be
> regenerated but that should happen in a separate commit if I remember
> corretly.  So, for now and until a review, I left it out.

Yes, for a first review, it is OK not to regenerate it.
But on final submission, you should regenerate the parser in the same
patch. It is a single, self-contained and semantically-related change,
so it makes sense to group them in a single patch.

> I would be glad if you could have a look at the patch.

I've had a quick look, and it looks OK at first sight. I'll look into it
more in depth in a moment, and will comment directly as a reply to the
patch.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
