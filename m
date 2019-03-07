Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:42268 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfCGEEJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Mar 2019 23:04:09 -0500
MIME-Version: 1.0
References: <1551888035-13329-1-git-send-email-yamada.masahiro@socionext.com> <5760e0a210c7c39b486aa932ccbe7f3f2c210d62.camel@decadent.org.uk>
In-Reply-To: <5760e0a210c7c39b486aa932ccbe7f3f2c210d62.camel@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Mar 2019 13:03:14 +0900
Message-ID: <CAK7LNAQFWWzki-MvmhDpAn46XkDAu4_EGCQotbi5qAk5oJrgUQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add workaround for Debian make-kpkg
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manoj Srivastava <manoj.srivastava.1962@gmail.com>

On Thu, Mar 7, 2019 at 6:02 AM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> [Trying again with an alternate address for Manoj.]
>
> kernel-package is maintained by Manoj Srivastava (cc'd), not by the
> Debian kernel team.
>
> On Thu, 2019-03-07 at 01:00 +0900, Masahiro Yamada wrote:
> > Since commit 3812b8c5c5d5 ("kbuild: make -r/-R effective in top
> > Makefile for old Make versions"), make-kpkg is not working.
> >
> > make-kpkg directly includes the top Makefile of Linux kernel, and
> > appends some debian_* targets.
> >
> >   /usr/share/kernel-package/ruleset/kernel_version.mk:
> >
> >     # Include the kernel makefile
> >     override dot-config := 1
> >     include Makefile
> >     dot-config := 1
> >
> > I did not know the kernel Makefile was used in that way, and it is
> > hard to guarantee the behavior when the kernel Makefile is included
> > by another Makefile from a different project.
> >
> > Looks like Debian Stretch stopped providing make-kpkg (except
> > PowerPC).
>
> kernel-package is not included in stretch at all.  I'm not sure where
> you're seeing it as being present on powerpc - that architecture wasn't
> included in the stretch release.


Actually, I have not checked the powerpc part by myself.


I just read the following page:

https://unix.stackexchange.com/questions/238469/difference-between-make-kpkg-and-make-deb-pkg


"make-kpkg is included in wheezy and jessie but stretch (current
stable) only contains it for powerpc.

Powerpc is no longer supported in buster (testing)"



I will drop the PowerPC part.




> > Maybe it is obsolete and being replaced with 'make deb-pkg' etc.
> > but still widely used.
> [...]
>
> kernel-package is currently planned to be included in the next release,
> though I'm not sure whether it should be.

Hmm, OK.

I checked debian:buster in Docker,
and I see it.


root@3382de16960a:/home/foo# apt-file search  make-kpkg
kernel-package: /usr/bin/make-kpkg
kernel-package: /usr/share/man/man1/make-kpkg.1.gz
zsh-common: /usr/share/zsh/functions/Completion/Debian/_make-kpkg




If make-kpkg will still be included in the future Debian releases,
I'd like to change make-kpkg to make it work more reliably.


The git URL in the control file
"https://anonscm.debian.org/git/users/srivasta/debian/kernel-package.git"
seems stale.

Anyway, I found it in a new place:

$ git clone  https://salsa.debian.org/srivasta/kernel-package


Hmm, the last commit was three years ago.

So, it is almost unmaintained, I guess...


> There is another bug report about kernel-package with current kernel
> versions <https://bugs.debian.org/890817> but I don't know whether it
> has been worked around already.

Probably, not fixed.

It is not stalled actually.
I guess make-kpkg is hiding messages sent to stdout for some reasons.
If you continue pressing "Enter" key,
it will move on to the build stage.

I will take a look if it should be maintained.



Anyway, I want to hear from Manoj.


--
Best Regards
Masahiro Yamada
