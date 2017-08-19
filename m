Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34752 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751561AbdHSRO0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2017 13:14:26 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com> <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Aug 2017 10:14:25 -0700
Message-ID: <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Markus Heiser <markus.heiser@darmarit.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, SeongJae Park <sj38.park@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

On Sat, Aug 19, 2017 at 10:03 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So one of the advantages of the pre-shipped files is that we can avoid
> that kind of crazy version issues with the tools.

Side note: the traditional way to handle this is autoconf etc. Since I
think autoconf is evil crap, I refuse to have anything what-so-ever to
do with it.

gperf is clearly written by clowns that don't understand about
compatibility issues - it would have been trivial for them to add some
kind of marker define so that you could test for this directly rather
than depend on some kind of autoconf "try to build and see if it
fails" crap.

So I think the best option would be to jhust get rid of gperf, and use
a normal hash function instead (even if it isn't "perfect" - it's not
like perfect hashes are so wonderful).

I wonder if those two ID lookups are even worth hashing at all - the
arrays aren't so big, and the uses aren't so timing-critical, so it's
entirely possible that we could just get rid of any hashing at all and
just use some stupid linear search thing.

I assume that flex/bison are stable enough that we don't have the same
kind of annoying stupid version issues with it.

Anybody want to look at just getting rid of the gperf use?

                  Linus
