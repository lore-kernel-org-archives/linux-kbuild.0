Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:52435 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbfLTQBR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Dec 2019 11:01:17 -0500
MIME-Version: 1.0
References: <20191219115100.958-1-masahiroy@kernel.org> <20191219195302.GG32169@bombadil.infradead.org>
In-Reply-To: <20191219195302.GG32169@bombadil.infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 21 Dec 2019 01:00:22 +0900
Message-ID: <CAK7LNAQsD5KMA-DrDS-9krNdQLfHJEnJ2NB6mq2aLemY2xs+-w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clarify the difference between obj-y and obj-m
 w.r.t. descending
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Johan Hovold <johan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Dec 20, 2019 at 4:53 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Dec 19, 2019 at 08:51:00PM +0900, Masahiro Yamada wrote:
> > Kbuild descends into a directory by either 'y' or 'm', but there is an
> > important difference.
> >
> > Kbuild combines the built-in objects into built-in.a in each directory.
> > The built-in.a in the directory visited by obj-y is merged into the
> > built-in.a in the parent directory. This merge happens recursively when
> > Kbuild is ascending back towards the top directory, so built-in objects
> > are linked into vmlinux eventually. This works properly only when the
> > Makefile that specifies obj-y is reachable by the chain of obj-y.
> >
> > On the other hand, Kbuild does not take built-in.a from the directory
> > visited by obj-m. This it, all the objects in that directory are supposed
> > to be modular. If Kbuild descends into a directory by obj-m, but the
> > Makefile in the sub-directory specifies obj-y, those objects are just
> > left orphan.
> >
> > The current statement "Kbuild only uses this information to decide that
> > it needs to visit the directory" is misleading. Clarify the difference.
>
> > +     Kbuild uses this information not only to decide that it needs to visit
> > +     the directory, but also to decide whether or not to link objects from
> > +     the directory into vmlinux.
> > +
> > +     When Kbuild descends into the directory with 'y', all built-in objects
> > +     from that directory are combined into the built-in.a, which will be
> > +     eventually linked into vmlinux.
> > +
> > +     When Kbuild descends into the directory with 'm', in contrast, nothing
> > +     from that directory will be linked into vmlinux. If the Makefile in
> > +     that directory specifies obj-y, those objects will be left orphan.
> > +     It is very likely a bug of the Makefile or of dependencies in Kconfig.
>
> Perhaps the implementation should be changed to match the documentation?
> This seems like a very subtle point for people to know.

I also considered this, but
I do not think the current behavior is too odd.
So, I am not changing it.

-- 
Best Regards
Masahiro Yamada
