Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39319 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfGPI7j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 04:59:39 -0400
MIME-Version: 1.0
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net> <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
 <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net> <20190715191245.GD3068@mit.edu>
In-Reply-To: <20190715191245.GD3068@mit.edu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 16 Jul 2019 17:58:49 +0900
Message-ID: <CAK7LNASps6JBAvtJshjMbqMk8QaSrMaH8pm-wHsEySTRJzu0Kw@mail.gmail.com>
Subject: Re: [PATCH 4/4] debian: add generic rule file
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>, "Enrico Weigelt, metux IT consult" <lkml@metux.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-riscv@lists.infradead.org, clang-built-linux <clang-built-linux@googlegroups.com>

On Tue, Jul 16, 2019 at 4:13 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Mon, Jul 15, 2019 at 08:56:25PM +0200, Enrico Weigelt, metux IT consult wrote:
> > On 15.07.19 14:28, Masahiro Yamada wrote:
> >
> > >> The rule file contains a rule for creating debian/control and
> > >> other metadata - this is done similar to the 'deb-pkg' make rule,
> > >> scripts/packaging/mkdebian.
> > >
> > > I saw a similar patch submission before, and negative feedback about it.
> >
> > Do you recall what negative feedback exactly ?

Sorry, my memory was broken.

I did not like this patch set from the beginning,
but missed to express my opinion strongly.

I want debian/ to be kept as a drop-in directory
for packagers, without replacing the upstream debian/rules.

If a check-in source file is modified in anyway,
scripts/setlocalversion would set -dirty flag,
which I want to avoid.



> It's possible I'm not remembering some of the feedback, but the only
> thing I recall was the comment I made that I'd really like this use
> case:
>
> make O=/build/linux-build bindeb-pkg
>
> to not break.  And as far as I can tell from the proposed patch series
> (I haven't had a chance to experimentally verify it yet), I don't
> think it should break anything --- I'm assuming that we will still
> have a way of creating the debian/rules file in
> /build/linux-build/debian/rules when doing a O= build, and that the
> intdeb-pkg rule remains the same.  At least, it appears to be the case
> from my doing a quick look at the patches.
>
> > > Debian maintains its own debian/rules, and it is fine.
> >
> > Not for me, I don't use it - given up trying to make anything useful
> > out of it. It's extremly complex, practically undebuggable and doesn't
> > even work w/o lots of external preparations.
>
> Yeah, the official Debian debian/rules is optimized for doing a
> distribution release, and in addition to the issues Enrico has raised,
> last time I tried it, it was S-L-O-W since it was building a fully
> generic kernel.  It's not at all useable for general developer use.

It is OK if the package is targeting normal users instead of
kernel developers.


> It sounds like what Enrico is trying to do is to enable running
> "dpkg-buildpackage -us -uc -b" from the the top-level kernel package
> as being easier than running "make bindeb-pkg".  I suspect this might
> be because his goal is to integrate individual kernel builds from
> using Debian's hermetic build / chroot systems (e.g., sbuild, pbuilder)?

I am OK with generating debian/rules with 'make bindeb-pkg', a shell scripts
or whatever, but I dislike to commit it in upstream git tree.

debian/rules is a hook for packagers to do their jobs in downstream.
"We kindly committed a generic one for you" sounds weird to me.

-- 
Best Regards
Masahiro Yamada
