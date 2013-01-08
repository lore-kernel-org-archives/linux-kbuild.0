Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f194.google.com ([209.85.212.194]:56531 "EHLO
	mail-wi0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756962Ab3AHTEF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Jan 2013 14:04:05 -0500
Received: by mail-wi0-f194.google.com with SMTP id hn17so14144wib.5
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Jan 2013 11:04:03 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: Readability of make menuconfig
Date: Tue, 8 Jan 2013 19:49:04 +0100
References: <CALZVapkvKeSbDdQruumGM-8RyVOnoNGD2Lm=7gZ+tEMcbXvnjw@mail.gmail.com>
In-Reply-To: <CALZVapkvKeSbDdQruumGM-8RyVOnoNGD2Lm=7gZ+tEMcbXvnjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201301081949.05366.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Javier Domingo <javierdo1@gmail.com>

Javier, All,

On Tuesday 08 January 2013 Javier Domingo wrote:
> 1.- Many times, althought you have the option to use sortcuts, they
> are really not usable, just because there are lots of them that are
> the same.
> 
> So if there was any way to search for patterns within the same page,
> will be great.

I don't understand what you mean. Your first sentence hint at shortcuts,
while the second deals with answers of searches.

Did you mean: search for symbols, but only in the currently-displayed
menu?

> 2.- When you are looking for something, you search, and it tell you
> where it is, but you will have to repeat the search if you didn't note
> it down (if not too obvious) several times, the most of the times this
> is the first thing a newbie suffers.
> 
> It would be great if appart from searching, you would put hiperlinks
> or something to go to the entries.

linux-3.7 has seen the introduction of the 'jump-keys' in menuconfig.
Shen you search for something by hitting '/' and entering a pattern,
all the results are prefixed with a number (if it has a prompt).
Pressing that number will jump you directly to that symbol.
Then, when you exit, you get back to the serach results, so you can jump
to another symbol.

Jump-keys are nested, that is:
    search for 'FOO'
    jump to result '1', symbol FOO_ALPHA
    search for 'BAR'
    jump to result '3', symbol BAR_TOTO
    exit, gets you back to results for 'BAR'
    jump to result '5', symbol BAR_TITI
    exit, gets you back to results for 'BAR'
    exit, gets you back to symbol FOO_ALPHA
    exit, gets you back to results for 'FOO'
    exit, gets you back to initial position

> 3.- When you finally get to the page where you have to change the
> macro, apart from the disadvantages in points 1 and 2, you have to
> search all around the page because they are not ordered in any way
> (but the programmer's have specified).
> 
> I can understand that some are parts of different Kconfigs, and others
> are there because a dev dropped it there, but it is horrible to find
> something in there.
> 
> That is why I would please ask for, althought respecting the tree
> levels, sort the menus alphabetically.

Well, that's arguable. I'll take it you are speaking about the layout
of the menus in the kernel. If you're speaking about your own Kconfig
content, then that's a policy that belongs to your project, nad that
your project maintainers have to enforce. So I'll cover the kernel,
case below:

First, symbols that depends on another are/should be placed after the
dependent symbol, that's more logical, but it breaks the alpha-sorting,
of course.

Second, the menus do tend to be alpha-sorted, where it makes sense.
On another hand, the menu do tend to be sorted in a logical layout, with
most /important/ options first, and less /important/ ones next (with any
meaning of /inportant/).

The kconfig frontends (eg. menuconfig, nconf, et al.) are not responsible
for the layout policy, only the Kconfig files content is. Again, if it's
your own Kconfig files, then you are responisble for the layout policy.
For example, Buildroot's coding style organises package alphabetically.

> 4.- And last but not least, I would love to have menus in some sort of
> sections/parts so that If I want to disable lapb protocol, I have a
> section of link protocols, and if I want to enable debugging features,
> I can go to a section inside the Kernel hacking menu (for example
> debugging)
> 
> So a solution to this would be either do sections, or make maintainers
> use a logical menu tree for clasifying the entries. The "section" I
> propose is a little title on the head, like the one in Networking
> support (1st line)
> 
> Hope you like this ideas and that some of them are really easier to do
> than I think they are to,

I am not sure I understand what you mean. The options are already sorted
by categories (eg.: net -> ipv6, filesystems -> ext2, ...)

You may also want to have a look at the other frontends:
    mconf   (aka menuconfig) ncurses-based
    nconf   ncurses-based
    gconf   GTK+-based
    qconf   Qt-based

Hope that helps answer/address a few of your question/remarks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

