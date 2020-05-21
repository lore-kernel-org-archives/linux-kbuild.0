Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33507 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgEUD6o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 May 2020 23:58:44 -0400
MIME-Version: 1.0
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-10-masahiroy@kernel.org> <fe378a92bba24164a4f901902ab06820@AcuMS.aculab.com>
In-Reply-To: <fe378a92bba24164a4f901902ab06820@AcuMS.aculab.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 21 May 2020 12:57:31 +0900
Message-ID: <CAK7LNAQNyD-1-tHkjgc3_cG2XGbLN7rmPM4m371iO2eWAfX55Q@mail.gmail.com>
Subject: Re: [PATCH 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Laight <David.Laight@aculab.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>, Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, May 17, 2020 at 9:33 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Masahiro Yamada
> > Sent: 17 May 2020 10:49
> > $(firstword ...) in scripts/Makefile.modpost was added by commit
> > 3f3fd3c05585 ("[PATCH] kbuild: allow multi-word $M in Makefile.modpost")
> > to build multiple external module directories.
> >
> > This feature has been broken for a while. Remove the bitrotten code, and
> > stop parsing if M or KBUILD_EXTMOD contains multiple words.
>
> ISTR that one of the kernel documentation files says that it is possible
> to build multiple modules together in order to avoid 'faffing' with
> exported symbol lists.
>
> So the docs need updating to match.


Do you remember which doc mentions it?



>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>


-- 
Best Regards
Masahiro Yamada
