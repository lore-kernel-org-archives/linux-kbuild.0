Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:38858 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755089Ab3DVU05 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 16:26:57 -0400
Received: by mail-we0-f179.google.com with SMTP id u3so3934005wey.38
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2013 13:26:56 -0700 (PDT)
Date: Mon, 22 Apr 2013 22:26:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: non-visible options vs menuconfigs
Message-ID: <20130422202649.GD24143@free.fr>
References: <201304221251.54695.vapier@gentoo.org>
 <20130422180046.GA24143@free.fr>
 <201304221419.51623.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201304221419.51623.vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

Mike, All,

On Mon, Apr 22, 2013 at 02:19:50PM -0400, Mike Frysinger wrote:
> On Monday 22 April 2013 14:00:46 Yann E. MORIN wrote:
> > As far as I remember, this has always been the behaviour of menuconfig.
> > 
> > What do you suggest the frontends do in this case, short of re-ordering
> > the options (which I think is not correct) ?
> 
> i think you missed a critical part of my proposal:
> 	seems like *if a node is unprintable*, it should get skipped for
> 	menuconfig purposes

Ah, yes, I missed it. And it is part of the solutions I exposed, too:

    On the other hand, we could consider dependent options as candidates for
    being sub-options until we see the first non-dependent option with a
    prompt.

> to modify your example, i'm proposing a change for:
> 	menuconfig MENU_A
> 		bool "A"
> 
> 	config OPT_B
> 		bool
> 
> 	config OPT_C
> 		bool "C"
> 		depends on MENU_A
> 
> OPT_B is not shown to the user (there is no option text), therefore it should 
> automatically get skipped when searching for options to collapse into the 
> menuconfig MENU_A.
> 
> i do agree that if OPT_B had text, then the existing behavior would be 
> unchanged.

And as I pointed out, this would break as soon as an option with a prompt
(which you call 'option text') is added in-between. For example, starting
with:
    menuconfig MENU_A
        bool "A"
 
    config OPT_B
        bool
 
    config OPT_C
        bool "C"
        depends on MENU_A

And then modifying into:
    menuconfig MENU_A
        bool "A"
 
    config OPT_D
        bool "D"
 
    config OPT_B
        bool

    config OPT_C
        bool "C"
        depends on MENU_A

(which would be trivivaly noticed here, but can be more complex in real
life, as you havee seen in the current init/Kconfig).

This would change the semantic of the language anyway, where currently
your example disrupts the dependendcy chain. Granted, it looks like a
good change, but I think we should not encourage people to be lazy, and
we better want them to be careful about what they intend to do, about
what they review and ack (myself largely included! :-] ).

I'll see if I can coerce the kconfig parser and frontends (yes,
frontends are probably impacted, too) to behave the way we discussed in
this thread, and see how good it works when confronted to real life.

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
