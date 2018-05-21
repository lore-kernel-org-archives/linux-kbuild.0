Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:38021 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751069AbeEUGQR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 May 2018 02:16:17 -0400
Date: Mon, 21 May 2018 08:16:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 07/31] kconfig: add built-in function support
Message-ID: <20180521061613.GA21232@ravnborg.org>
References: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com>
 <1526537830-22606-8-git-send-email-yamada.masahiro@socionext.com>
 <20180520145031.GB9826@ravnborg.org>
 <CAK7LNATM6s++TJ-VrbSwoMmP5FgVOmkUNGCwzZW=Re0WEr5EYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATM6s++TJ-VrbSwoMmP5FgVOmkUNGCwzZW=Re0WEr5EYQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>

Hi Masahiro

> >> +     char *(*func)(int argc, char *argv[], int old_argc, char *old_argv[]);
> >> +};
> > If a typedef was provided for the function then ...
> 
> 
> Yes, I can do this,
> but I may rather consider to simplify the code.

Simplify is better.

> > Will the following be equal:
> >
> >         $(foo,abc,$(x),$(y))
> >         $(foo, abc, $(x), $(y))
> >
> > make is rather annoying as space is significant, but there seems no good reason
> > for kconfig to inheritate this.
> > So unless there are good arguments consider alloing the spaces.
> > If the current implmentation already supports optional spaces then I just missed
> > it whie reviewing.
> 
> 
> I have been thinking of trimming the leading whitespaces.
> (https://patchwork.kernel.org/patch/10405549/)
> 
> This is trade-off vs "how to pass spaces as arguments?"

Maybe allow strings to be passed enclosed in ""?
Then it is simple to add whitespace.

But the use of "" should be optional in all other cases.
And the "" should be stripped.

	Sam
