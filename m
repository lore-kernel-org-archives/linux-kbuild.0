Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f176.google.com ([209.85.128.176]:39545 "EHLO
        mail-wr0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933360AbeBMGke (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Feb 2018 01:40:34 -0500
Received: by mail-wr0-f176.google.com with SMTP id w77so3009469wrc.6
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2018 22:40:34 -0800 (PST)
Date: Tue, 13 Feb 2018 07:40:30 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Print reverse dependencies on new line
 consistently
Message-ID: <20180213064029.GA1587@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
 <CAFkk2KSw2XXx69VDVSR-_7nMW71L6-a9SxG2-vUtyT7W3m2gbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkk2KSw2XXx69VDVSR-_7nMW71L6-a9SxG2-vUtyT7W3m2gbA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Eugeniu Rosca <erosca@de.adit-jv.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>

Hi Eugeniu,

> On Tue, Feb 13, 2018 at 1:56 AM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> > From: Eugeniu Rosca <erosca@de.adit-jv.com>

> > Commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
> > readable") made an incredible improvement in how reverse dependencies
> > are perceived by the user, by breaking down the single (often
> > interminable) expression string into small readable chunks, each of
> > them displayed on a separate line:

> > Selected by:
> > - A & B
> > - C & (D || E)

> > Unfortunately, what happens with the non-OR (either E_SYMBOL or E_AND)
> > expressions is that they don't get a dedicated line:

> > Selected by: F & G
I deliberately choose it :-). It didn't make much sense for me to add new line for just
one line. I thought someone wouldn't like it for the inconsistency :-).


Kind regards,
Petr
