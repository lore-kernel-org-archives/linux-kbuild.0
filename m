Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:46298 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753838Ab3DVSAw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 14:00:52 -0400
Received: by mail-we0-f173.google.com with SMTP id o7so1077585wea.32
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2013 11:00:51 -0700 (PDT)
Date: Mon, 22 Apr 2013 20:00:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: non-visible options vs menuconfigs
Message-ID: <20130422180046.GA24143@free.fr>
References: <201304221251.54695.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201304221251.54695.vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

Mike, All,

On Mon, Apr 22, 2013 at 12:51:53PM -0400, Mike Frysinger wrote:
> the current EXPERT menuconfig is broken by some new options that happen to be 
> sprinkled into the wrong place.  seems like if a node is unprintable, it 
> should get skipped for menuconfig purposes ?  otherwise, this is a constantly 
> losing battle where someone inserts new Kconfig options and forgets this 
> nuance, and then it stays broken for a while until someone notices.  this 
> particular bug wrt EXPERT has been linux-3.2.
> 
> for example, in the General setup section, you currently see:
> 	[ ] Configure standard kernel features (expert users)  --->
> 	[ ] Embedded system
> 
> if you enable EXPERT there, the options get dumped into the same level instead 
> of being under that menuconfig:
> 	[*] Configure standard kernel features (expert users)  --->
> 	[ ] Sysctl syscall support
> 	[*] Load all symbols for debugging/ksymoops
> 	...
> 	[ ] Embedded system

Yes, this is indeed disturbing.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> is this feasible in the kconfig code ?

From Documentation/kbuild/kconfig-language.txt:

    menuconfig:                                                                                                                                                    
        "menuconfig" <symbol>                                                                                                                                  
        <config options>                                                                                                                                       

    This is similar to the simple config entry above, but it also gives a                                                                                          
    hint to front ends, that all suboptions should be displayed as a                                                                                               
    separate list of options.

This text does not explicit what a "sub-options" is. In fact, it is an
option that depends on the menuconfig, and that is not separated from it
from a non-dependent option. Thus:

    menuconfig MENU_A
        bool "A"

    config OPT_B
        bool "B"
        depends on MENU_A

    config OPT_C
        bool "C"
        depends on MENU_A

    config OPT_D
        bool "D"

    config OPT_E
        bool "E"
        depends on MENU_A

OPT_B and OPT_C are sub-options of MENU_A, as they depend on it, and
directly follow it. OPT_D is not a sub-option of MENU_A, as it does not
depend on it. OPT_E, although it depends on MENU_A, is not a sub-option
as it does not directly follow it.

As far as I remember, this has always been the behaviour of menuconfig.

What do you suggest the frontends do in this case, short of re-ordering
the options (which I think is not correct) ?

On the other hand, we could consider dependent options as candidates for
being sub-options until we see the first non-dependent option with a
prompt. But I do not think this is sane behaviour, as as soon a new
option with a prompt is added in-between sub-options, we again break the
relation to the menuconfig.

What I always do to ensure consistency is I explicitly use a conditional
around the options I consider as sub-options, which forces me to
properly order the options in the Kconfig file, eg. (with the same
options as above):

    menuconfig MENU_A
        bool "A"

    if MENU_A

    config OPT_B
        bool "B"

    config OPT_C
        bool "C"

    config OPT_E
        bool "E"

    endif # MENU_A

    config OPT_D
        bool "D"

Maybe we could change the semantic of menuconfig so that, for an option
to be considered as a sub-option, it shall be enclosed in an 'if'
block.

Another option is to explicitly require and 'endmenu' statement to close
the menuconfig.

Either way, that would mean we'd have to audit and fix quite a bunch of
Kconfig files:

    $ grep --exclude-dir=.git --exclude-dir=Documentation \
           -r -E -e '^menuconfig' .                       \
      |wc -l
    215

So, 215 occurences of 'menuconfig' (in 189 Kconfig files).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
