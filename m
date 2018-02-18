Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38182 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751025AbeBRLek (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 06:34:40 -0500
Received: by mail-wm0-f49.google.com with SMTP id z9so5025011wmb.3
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Feb 2018 03:34:40 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Sun, 18 Feb 2018 12:34:30 +0100
Subject: Re: [PATCH 2/2] kconfig: Print the value of each reverse dependency
Message-ID: <20180218113430.GA28114@example.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
 <20180213005610.10575-2-rosca.eugeniu@gmail.com>
 <CAFkk2KQ80dKfQaT1sx_X72ZYVu+N8dBLhEpJEAeK7f52Bb5V1g@mail.gmail.com>
 <20180213235448.GA30690@example.com>
 <CAFkk2KTtvHPtSXWX83aVaXpixU7CukG==NvwXDGmHbg0=1sC8Q@mail.gmail.com>
 <20180217172059.GA16512@example.com>
 <CAFkk2KTmPEC-CxO2u0qXBKkRvpScGFD3C6LHdgL+LCBWKf7Dig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkk2KTmPEC-CxO2u0qXBKkRvpScGFD3C6LHdgL+LCBWKf7Dig@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>

On Sat, Feb 17, 2018 at 06:31:48PM +0100, Ulf Magnusson wrote:
> On Sat, Feb 17, 2018 at 6:20 PM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> > Hi Ulf,
> >
> > On Wed, Feb 14, 2018 at 05:09:50AM +0100, Ulf Magnusson wrote:
> >> IMO, we could take this as is (after addressing other people's
> >> comments), since it's already a big improvement, and then add sorting
> >> later if we feel like it.
> >>
> >> Don't have to do everything at once. :)
> >
> > I agree that it's not possible to do everything perfect right from the
> > start. But since we are changing the user experience, I just thought
> > that we would first like to see how both implementations (prefixed
> > vs grouped tokens) look like, then make a decision (I'm still open
> > minded about it), then affect the users.
> 
> Isn't the latest patchset doing both? That seems like the best of both worlds.

Well, I call "prefixed tokens" solution [1] and "grouped tokens"
solution [2]. Assuming we share the same view, [1] has definitely less
of an impact on Kconfig (see [3]). That's the main argument to prefer it
over [2]. My personal choice is still [2]. However if it happens
that other reviewers prefer [1], I won't object on it.

[1] Selected by:
    - [y] EXPR_Y
    - [m] EXPR_M
    - [ ] EXPR_N

[2] Selected by [y]:
    - EXPR_Y
    Selected by [m]:
    - EXPR_M
    Selected by [n]:
    - EXPR_N

[3] https://marc.info/?l=linux-kbuild&m=151848343313335&w=4

> And yeah, I just get some personal restlessness when good stuff floats
> around for a long time without getting in. :)
> 
> Cheers,
> Ulf

Thanks,
Eugeniu.
