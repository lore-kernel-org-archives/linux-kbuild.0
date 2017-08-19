Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49889 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751613AbdHSRic (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2017 13:38:32 -0400
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com [209.85.161.174]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id v7JHc7Xn009057
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Aug 2017 02:38:07 +0900
Received: by mail-yw0-f174.google.com with SMTP id s143so73945370ywg.1
        for <linux-kbuild@vger.kernel.org>; Sat, 19 Aug 2017 10:38:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1503105231.3688.33.camel@decadent.org.uk>
References: <20170418010011.GC4152@decadent.org.uk> <CAK7LNASG59wc7Ed24HFiGn0CFUxjDtMgKwy8dhz2PfvRDw1Y1w@mail.gmail.com>
 <1492932183.31767.64.camel@decadent.org.uk> <CAK7LNATV4vsczwkntLJPhvPew4NEL1JeckaBxeFk-6Q-Y_VfoQ@mail.gmail.com>
 <1493563778.2564.11.camel@decadent.org.uk> <1503105231.3688.33.camel@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 20 Aug 2017 02:37:26 +0900
Message-ID: <CAK7LNAQKFRLs9wvg7qdFM5245jqv-6qUhRgF-61qiO_PE-J6kQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not use hyphen in exported variable name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

Hi Ben,

Thanks for useful info.


2017-08-19 10:13 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> On Sun, 2017-04-30 at 15:49 +0100, Ben Hutchings wrote:
>> On Sun, 2017-04-30 at 23:14 +0900, Masahiro Yamada wrote:
>> > Hi Ben,
>> >
>> >
>> > > 2017-04-23 16:23 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
>> > > On Sun, 2017-04-23 at 15:47 +0900, Masahiro Yamada wrote:
>> > > [...]
>> > > > I tested dtbs_install once again by myself, but
>> > > > dtbinst-root is exported to the sub make
>> > > > and the vendor directories are created correctly.
>> > > >
>> > > >
>> > > > I checked the debian's forum you gave
>> > > > > References: https://bugs.debian.org/833561
>> > > >
>> > > > In there, you mentioned:
>> > > > "This looks like a bug in make, but we can at least work around it=
 by
>> > > > using a non-hyphenated variable name."
>> > > >
>> > > >
>> > > > Does this issue happen on a specific Make version?
>> > > >
>> > > > I tested GNU make 3.81, 3.82, 4.0, 4.1, 4.2,
>> > > > but I was not hit by the problem.
>> > >
>> > > I don't think this is make version dependent.  I can't reproduce the
>> > > issue today with make 4.1.  But I would have been using the same
>> > > version in August when I wrote that.
>> > >
>> > > What more can I say?  Clearly the hyphenated variable gets passed to
>> > > the sub-make in most cases.  But it's not totally reliable because l=
ast
>> > > year it wasn't working for us.
>> > >
>> > > > In the last post in the thread, you concluded:
>> > > > "We believe that the bug you reported is fixed in the latest versi=
on of
>> > > > linux, which is due to be installed in the Debian FTP archive."
>> > >
>> > > I didn't write that, it's a standard message generated for bugs mark=
ed
>> > > as closed in a package changelog. :-)
>> > >
>> > > > If so, why is this patch here?
>> > > > How is the dtbs_install procedure different in the Debian package?
>> > >
>> > > This is the patch I applied to the package.
>> > >
>> >
>> > Do you still need this patch for Debian?
>> [...]
>>
>> I don't think so.  I just don't know for sure.
>
> I've now seen a similar problem with the suffix-y variable exported
> from arch/sh/boot/Makefile to arch/sh/boot/compressed/Makefile:
> https://buildd.debian.org/status/fetch.php?pkg=3Dlinux&arch=3Dsh4&ver=3D4=
.13%7Erc5-1%7Eexp1&stamp=3D1502943967&raw=3D0
>
> Those Makefiles haven't changed recently, so there must be some
> difference in the build environment.  Here's a Makefile that
> demonstrates the difference in behaviour between bash and dash:
>
> --- BEGIN ---
> ifdef WANTED_SHELL
> SHELL :=3D $(WANTED_SHELL)
> endif
>
> test:
>         @WANTED_SHELL=3D/bin/bash $(MAKE) test2
>         @WANTED_SHELL=3D/bin/dash $(MAKE) test2
>         @WANTED_SHELL=3D $(MAKE) test2
>
> test2: export foo_bar :=3D foo_bar
> test2: export foo-bar :=3D foo-bar
> test2:
>         @echo SHELL=3D$(SHELL)
>         @$(MAKE) test3
>
> test3:
>         @echo foo_bar=3D$(foo_bar)
>         @echo foo-bar=3D$(foo-bar)
>
> .PHONY: test test2 test3
> --- END ---
>
> For me, this produces:
>
> $ make -s
> SHELL=3D/bin/bash
> foo_bar=3Dfoo_bar
> foo-bar=3Dfoo-bar
> SHELL=3D/bin/dash
> foo_bar=3Dfoo_bar
> foo-bar=3D
> SHELL=3D/bin/sh
> foo_bar=3Dfoo_bar
> foo-bar=3Dfoo-bar
>
> Note that the last two cases are different even though /bin/sh is dash
> here.  It turns out that make avoids using the shell for simple
> commands, unless it has been changed from the default:
> https://sources.debian.net/src/make-dfsg/4.1-9.1/job.c/#L2575


Yes.  This is also explained in O'Reilly GNU Make:

http://www.oreilly.com/openbook/make3/book/ch05.pdf

------------------->8------------------------------
Commands are essentially one-line shell scripts.
In effect, make grabs each line and passes it to a
subshell for execution. In fact, make can optimize this
(relatively) expensive fork/exec algorithm if it can
guarantee that omitting the shell will not change the
behavior of the program. It checks this by scanning each
command line for shell special characters, such as
wildcard characters and i/o redirection. If none are
found, make directly executes the command without
passing it to a subshell. By default, /bin/sh is used
for the shell. This shell is controlled by the make
variable SHELL but it is not inherited from the
environment. When make starts, it imports all the
variables from the user=E2=80=99s environment as make variables,
except SHELL. This is because the user=E2=80=99s choice of shell
should not cause a makefile (possibly included in some
downloaded software package) to fail. If a user really
wants to change the default shell used by make, he can
set the SHELL variable explicitly in the makefile.
We will discuss this issue in the section
=E2=80=9CWhich Shell to Use=E2=80=9D later in this chapter
------------------->8------------------------------



From your test case (the third one),
if SHELL is unset, it should work
whether /bin/sh is dash, bash, or whatever.
(I use Ubuntu, and /bin/sh is dash.  I see no problem
for installing dtbs.)


We see the problem only when SHELL is set to /bin/dash.


foo-bar becomes empty if SHELL is set to /bin/dash
in a Makefile that exports it.

SHELL in a Makefile that references $(foo-bar) is don't care.



The following is the test scripts.

---------------- Makefile ----------------
ifneq ($(WANTED_SHELL),)
SHELL :=3D $(WANTED_SHELL)
endif

export foo_bar :=3D foo_bar
export foo-bar :=3D foo-bar

test:
        @WANTED_SHELL=3D $(MAKE) test2
        @WANTED_SHELL=3D/bin/dash $(MAKE) test2

test2:
        @echo SHELL of parent-Makefile is $(SHELL)
        $(MAKE) -C sub CHILD_SHELL=3D/bin/sh
        $(MAKE) -C sub CHILD_SHELL=3D/bin/dash
-------------------------------------------


------------------ sub/Makefile -----------
SHELL :=3D $(CHILD_SHELL)

sub:
        @echo SHELL of sub-Makefile is $(SHELL)
        @echo foo_bar $(foo_bar)
        @echo foo-bar $(foo-bar)

.PHONY: sub
-------------------------------------------


My test result was as follows:

$ make --no-print-directory
SHELL of parent-Makefile is /bin/sh
make -C sub CHILD_SHELL=3D/bin/sh
SHELL of sub-Makefile is /bin/sh
foo_bar foo_bar
foo-bar foo-bar
make -C sub CHILD_SHELL=3D/bin/dash
SHELL of sub-Makefile is /bin/dash
foo_bar foo_bar
foo-bar foo-bar
SHELL of parent-Makefile is /bin/dash
make -C sub CHILD_SHELL=3D/bin/sh
SHELL of sub-Makefile is /bin/sh
foo_bar foo_bar
foo-bar
make -C sub CHILD_SHELL=3D/bin/dash
SHELL of sub-Makefile is /bin/dash
foo_bar foo_bar
foo-bar





I did "grep SHELL" in kernel sources, but I could not
find suspicious line.


Is there anyone that sets SHELL
in debian specific patches?


--=20
Best Regards
Masahiro Yamada
