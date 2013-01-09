Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vb0-f53.google.com ([209.85.212.53]:61632 "EHLO
	mail-vb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932123Ab3AIRED (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jan 2013 12:04:03 -0500
Received: by mail-vb0-f53.google.com with SMTP id b23so1786139vbz.12
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Jan 2013 09:04:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201301081949.05366.yann.morin.1998@free.fr>
References: <CALZVapkvKeSbDdQruumGM-8RyVOnoNGD2Lm=7gZ+tEMcbXvnjw@mail.gmail.com>
 <201301081949.05366.yann.morin.1998@free.fr>
From: Javier Domingo <javierdo1@gmail.com>
Date: Wed, 9 Jan 2013 18:03:41 +0100
Message-ID: <CALZVapmdYn8gKNbmdNa3QrqutwV7Eca=_HjxUeEso1qDZNFukg@mail.gmail.com>
Subject: Re: Readability of make menuconfig
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

2013/1/8 Yann E. MORIN <yann.morin.1998@free.fr>:
> I don't understand what you mean. Your first sentence hint at shortcuts,
> while the second deals with answers of searches.
>
> Did you mean: search for symbols, but only in the currently-displayed
> menu?

I meant that shortcuts are put there to increase the accessibility,
but in the current way they don't.

> linux-3.7 has seen the introduction of the 'jump-keys' in menuconfig.
> Shen you search for something by hitting '/' and entering a pattern,
> all the results are prefixed with a number (if it has a prompt).
> Pressing that number will jump you directly to that symbol.
> Then, when you exit, you get back to the serach results, so you can jump
> to another symbol.
>
> Jump-keys are nested, that is:
>     search for 'FOO'
>     jump to result '1', symbol FOO_ALPHA
>     search for 'BAR'
>     jump to result '3', symbol BAR_TOTO
>     exit, gets you back to results for 'BAR'
>     jump to result '5', symbol BAR_TITI
>     exit, gets you back to results for 'BAR'
>     exit, gets you back to symbol FOO_ALPHA
>     exit, gets you back to results for 'FOO'
>     exit, gets you back to initial position
>

Would it be possible to do this just with arrows? I mean, something
like lynx's interface

> Well, that's arguable. I'll take it you are speaking about the layout
> of the menus in the kernel. If you're speaking about your own Kconfig
> content, then that's a policy that belongs to your project, nad that
> your project maintainers have to enforce. So I'll cover the kernel,
> case below:

I mean actual kernel case

> First, symbols that depends on another are/should be placed after the
> dependent symbol, that's more logical, but it breaks the alpha-sorting,
> of course.

I understand that if something depends other thing, it will be
idented, not in the first level, so that first level can be ordered,
and the others, respecting dependencies, too
>
> Second, the menus do tend to be alpha-sorted, where it makes sense.
> On another hand, the menu do tend to be sorted in a logical layout, with
> most /important/ options first, and less /important/ ones next (with any
> meaning of /inportant/).

This is not a good way to find things. Many times, you want to enable
one parameter but you don't know how important is it considered

> The kconfig frontends (eg. menuconfig, nconf, et al.) are not responsible
> for the layout policy, only the Kconfig files content is. Again, if it's
> your own Kconfig files, then you are responisble for the layout policy.
> For example, Buildroot's coding style organises package alphabetically.

Then, all this discussion is just out of the topic of this mailing
list, because the responsible for the actual sorting are the
maintainers?

> I am not sure I understand what you mean. The options are already sorted
> by categories (eg.: net -> ipv6, filesystems -> ext2, ...)
>

I mean that when you go to net, you don't have ipv6, you have
networking options, and inside there, you have to be able to
understand which are ipv6 relative. They are all messed up.

> You may also want to have a look at the other frontends:
>     mconf   (aka menuconfig) ncurses-based

Actually using this one, and is the only one I use

Regards,

Javier Domingo

>     nconf   ncurses-based
>     gconf   GTK+-based
>     qconf   Qt-based
>
> Hope that helps answer/address a few of your question/remarks.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
