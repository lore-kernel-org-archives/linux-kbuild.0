Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:33910 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756316Ab3D1U3A (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 28 Apr 2013 16:29:00 -0400
Received: by mail-wi0-f174.google.com with SMTP id m6so2144695wiv.1
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Apr 2013 13:28:58 -0700 (PDT)
Date: Sun, 28 Apr 2013 22:28:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
Message-ID: <20130428202854.GC4571@free.fr>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
 <20130427153833.GC3355@free.fr>
 <alpine.DEB.2.02.1304271325240.12586@oneiric>
 <20130427174226.GA25088@free.fr>
 <alpine.DEB.2.02.1304271412250.27554@oneiric>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1304271412250.27554@oneiric>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Steven Rostedt <srostedt@redhat.com>

Robert, All,

On Sat, Apr 27, 2013 at 02:19:05PM -0400, Robert P. J. Day wrote:
>   i'm going to take a wild, uneducated stab at this, but it matches
> what i was starting to suspect, anyway. this has nothing to do with
> config processing, it has to do specifically with how the Kconfig
> entries related to atheros cards were changed.
> 
>   here's the important part:
> 
> $ git show 23c1d7f
> ... snip ...
>     So, this patch introduce new Kconfig variable ATH_CARDS for belonging
>     to the "Atheros Wireless Cards" family; while ATH_COMMON becomes hidden
>     variable to express dependency on common Atheros code in ath.ko. Modules
>     that depend on this common code now express it by setting ATH_COMMON.
> ... snip ...
> -menuconfig ATH_COMMON
> +config ATH_COMMON
> +       tristate
> +
> +menuconfig ATH_CARDS
> 
>   in short, a new variable, ATH_CARDS, was introduced that doesn't
> appear in the earlier .config so, unsurprisingly, when you run "make
> oldconfig", in the midst of all of the other manual answers, you have
> to specify what you want done, and look at the default:
> 
> $ make oldconfig
> ... many manual choices ...
> Atheros Wireless Cards (ATH_CARDS) [N/m/?] (NEW)   <-- there's the culprit
> ... snip ...
> 
>   so running the standard "yes '' | make oldconfig" is going to
> deselect what looks like almost all ath9k-related stuff, simply
> because a new, low-level dependency variable was introduced.
> 
>   am i making sense here?

Not sure how streamline_config,pl should behave. Cc-ing Steven as the
original author, maybe he has a better understanding on this situation.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
