Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:52566 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966209AbeBNAcy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Feb 2018 19:32:54 -0500
Received: by mail-wm0-f44.google.com with SMTP id j199so7098082wmj.2
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2018 16:32:53 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Wed, 14 Feb 2018 01:32:48 +0100
Subject: Re: [PATCH 1/2] kconfig: Print reverse dependencies on new line
 consistently
Message-ID: <20180214003248.GA2256@example.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
 <CAFkk2KSw2XXx69VDVSR-_7nMW71L6-a9SxG2-vUtyT7W3m2gbA@mail.gmail.com>
 <20180213064029.GA1587@x230>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180213064029.GA1587@x230>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>

Hi Petr,

On Tue, Feb 13, 2018 at 07:40:30AM +0100, Petr Vorel wrote:
> Hi Eugeniu,
> 
> > On Tue, Feb 13, 2018 at 1:56 AM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> > > From: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> > > Commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
> > > readable") made an incredible improvement in how reverse dependencies
> > > are perceived by the user, by breaking down the single (often
> > > interminable) expression string into small readable chunks, each of
> > > them displayed on a separate line:
> 
> > > Selected by:
> > > - A & B
> > > - C & (D || E)
> 
> > > Unfortunately, what happens with the non-OR (either E_SYMBOL or E_AND)
> > > expressions is that they don't get a dedicated line:
> 
> > > Selected by: F & G
> I deliberately choose it :-). It didn't make much sense for me to add new line for just
> one line. I thought someone wouldn't like it for the inconsistency :-).

I have to say I do like how `Selected by: F && G` looks on a single row.
However, when the expression is prefixed by its value (i.e. 
`Selected by: [m] F && G`), imho it doesn't look as crisp and clear
as we would like it to (feel free to disagree here). Fwiw, this patch
doesn't see itself as a fix, but rather prepares the ground for the next
commit implementing prefixing reverse dependencies by their expression
value.

> 
> Kind regards,
> Petr

Thanks!
Eugeniu.
