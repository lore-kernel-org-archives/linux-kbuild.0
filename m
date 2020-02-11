Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42840 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbgBKOrc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 09:47:32 -0500
MIME-Version: 1.0
References: <20200210161852.842-1-masahiroy@kernel.org> <CAMrEMU86jmds8LMmbdVk=54h+ziY=6MHwyzHxVRXy5dLGFTmGA@mail.gmail.com>
In-Reply-To: <CAMrEMU86jmds8LMmbdVk=54h+ziY=6MHwyzHxVRXy5dLGFTmGA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Feb 2020 23:46:38 +0900
Message-ID: <CAK7LNARV34onaXiZA-UAvKZdwnfX_D3g=k0a8EJkD4HzEWRo-Q@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix memory corruption caused by write over-run
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Justin Capella <justincapella@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, youling257 <youling257@gmail.com>, Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>

Hi.

On Tue, Feb 11, 2020 at 11:36 AM Justin Capella <justincapella@gmail.com> wrote:
>
> Looks like len is already +1, maybe it shouldn't be?

This increment is for storing one more character, 'type'.

        sym->sym[0] = type;



> >         len = strlen(name) + 1;
> >
> > -       sym = malloc(sizeof(*sym) + len);
> > +       sym = malloc(sizeof(*sym) + len + 1);


This increment is for the '\0' termination.



So, malloc() needs to allocate:
sizeof(*sym) + strlen(name) + 2.





>
>
> Maybe strlcpy or if len wasn't incremented?
>
> >
> > -       memcpy(sym_name(sym), name, len);
> > +       strcpy(sym_name(sym), name);
> >



-- 
Best Regards
Masahiro Yamada
