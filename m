Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53979 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753126AbdIHGTP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Sep 2017 02:19:15 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com> <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Sep 2017 15:18:31 +0900
Message-ID: <CAK7LNATaisd3tPNbujTWLUq-2sMQ3pyTkPRSgjw00zUzv=GvSQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Markus Heiser <markus.heiser@darmarit.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, SeongJae Park <sj38.park@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Hi Linus,


Very sorry that I had not responded quickly.

When I was digging into tool version dependency,
as you pointed out, gperf is a problem (but seemed one time breakage
for gperf 3.1)
flex seemed very stable for a long time.
bison seemed a bit problem if old version is used.


But, I did not have enough time to take a closer look.
I thought I should respond after I tested more, but I has been pressed
by my daily tasks, then time passed...
Very sorry.



Today, I just noticed gperf usage got dropped from the kernel.

If CONFIG_MODVERSIONS is enabled,
I notice lots of error messages.
WARNING: EXPORT symbol "finish_open" [vmlinux] version generation
failed, symbol will not be


So, I think something was broken in scripts/genksyms/.

Of course, it was a trivial conversion, so it should not be hard to fix...



> gperf is clearly written by clowns that don't understand about
> compatibility issues - it would have been trivial for them to add some
> kind of marker define so that you could test for this directly rather
> than depend on some kind of autoconf "try to build and see if it
> fails" crap.


One idea may be to process the output of "gperf -v"
and embed GPERF_VERSION into the output .c files.

But, if you are unhappy with gperf breakage this time,
we can live without gperf.




> It's likely not even any slower, but who the hell knows.. Do we even
> care? It's almost certainly faster if you compare to generating that
> gperf code.
>

For scripts/kconfig/, I think we do not care at all
because we usually invoke it just once when we configure the build setting.


If we enable CONFIG_MODVERSIONS, scripts/genksyms/ is invoked
over and over again.

Sorry, I have not evaluated if
the perfect hash gives us noticeable advantage or not..



-- 
Best Regards
Masahiro Yamada
