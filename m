Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44461 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfCKPPz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Mar 2019 11:15:55 -0400
Received: by mail-vs1-f66.google.com with SMTP id r201so2915983vsc.11
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Mar 2019 08:15:53 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id l193sm2722968vka.19.2019.03.11.08.15.50
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 08:15:51 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id b17so2910329vsr.13
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Mar 2019 08:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190308212524.121126-1-dianders@chromium.org>
 <CABXOdTe6hGWCsRpQcc_coB-whvJR2XfPfdLuc9QHMMvoXDNW=w@mail.gmail.com>
 <CAD=FV=VGL-Z93WtU8LTQXeJtdUU085T+Vd_MXNuuvWnJ6-eyDw@mail.gmail.com> <CAK7LNAQEYiowBS9tKC7ND5sjB2qrVy28=bzE=5Bt5R9rfR_LXg@mail.gmail.com>
In-Reply-To: <CAK7LNAQEYiowBS9tKC7ND5sjB2qrVy28=bzE=5Bt5R9rfR_LXg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Mar 2019 08:15:37 -0700
Message-ID: <CAD=FV=WrVoNNH0mttv9c5GeN981PUB8Ejx78p9Txa6WSV1zcuQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Speed up install, modules_install and kernelrelease
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Guenter Roeck <groeck@google.com>, Michal Marek <michal.lkml@markovi.net>, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, Stephen Boyd <swboyd@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi,

On Fri, Mar 8, 2019 at 4:56 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Sat, Mar 9, 2019 at 7:34 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Mar 8, 2019 at 2:29 PM Guenter Roeck <groeck@google.com> wrote:
> > >
> > > On Fri, Mar 8, 2019 at 1:25 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > As per the description of the old commit 3298b690b21c ("kbuild: Add a
> > > > cache for generated variables"), calling the C compiler lots of times
> > > > during the parsing stage of the Makefile can be a little slow.  If you
> > > > happen to have a C compiler whose fork/exec time isn't optimized
> > > > (perhaps it was linked dynamically, or perhaps it's called through
> > > > several wrappers, or ...) then this can be more than a little slow, it
> > > > can be very slow.
> > > >
> > > > The above slowness was addressed with the old Makefile cache, but the
> > > > cache was reverted in commit e08d6de4e532 ("kbuild: remove kbuild
> > > > cache").  That commit indicated that we expected to get the speed
> > > > gains back because "the result of compiler tests will be naturally
> > > > cached in the .config file", but as of the latest mainline there are
> > > > still lots of direct calls to the C compiler that happen in the
> > > > Makefile parsing stage.
> > > >
> > > > Perhaps we could try re-introducing the Makefile cache and fix the
> > > > problems it was causing, but this patch codes up another solution that
> > > > gets some of the speed gains back, perhaps with less complexity.
> > > >
> > > > Specifically I observed that by timing the parsing stage of the
> > > > Makefile by adding statements like this to the beginning and end of
> > > > the Makefile:
> > > >   ZZZ := $(shell echo "$$(date '+%T.%N'): ..." >> /tmp/timing.txt)
> > > >
> > > > ...that three targets were spending 3 seconds each parsing the
> > > > Makefile in my environment (building a Chrome OS kernel with clang)
> > > > when it felt like they ought to be quick.  These were: install,
> > > > modules_install and kernelrelease
> > > >
> > > > I saw timings that looked like:
> > > >   09:23:08.903204451: Parsing Makefile, goals: install
> > > >   09:23:11.960515772: Done parsing Makefile, goals: install
> > > >
> > > > Given that the kbuild system doesn't sync the config for any of these
> > > > options I believe it is safe to say that it can't compile any code.
> > > > Thus if we can avoid the C compiler invocation here we'll save time.
> > > >
> > > > The simplest way to accomplish this is to neuter all the calls to the
> > > > compiler by stubbing them out.  After doing so (AKA applying this
> > > > change) the same timing looks like:
> > > >   09:28:04.929252271: Parsing Makefile, goals: install
> > > >   09:28:05.107468449: Done parsing Makefile, goals: install
> > > >
> > > > During an incremental kernel build/install on Chrome OS we call
> > > > install once, modules_install twice (once to keep unstripped), and
> > > > kernelrelease once.  Thus this saves ~12 seconds on an incremental
> > > > kernel build/install.  With my current setup, this brings it from ~40
> > > > seconds to ~28 seconds.  Re-introducing the Makefile cache would
> > > > likely save us an extra ~3 seconds since we'd avoid the parsing in the
> > > > compile stage.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > >  Makefile | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > >
> > > > diff --git a/Makefile b/Makefile
> > > > index f070e0d65186..5f7532d9be65 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -304,6 +304,20 @@ else
> > > >  scripts/Kbuild.include: ;
> > > >  include scripts/Kbuild.include
> > > >
> > > > +# If we can't sync the config then we know we can't compile code.
> > > > +# Replace the slow option-testing commands with stubs to significantly
> > > > +# speed up the Makefile parsing stage of the build.
> > > > +ifeq ($(may-sync-config),0)
> > >
> > > I think that breaks KBUILD_EXTMOD, which sets the variable to 0.
> >
> > Yup, thanks for catching--I should have realized that from the code
> > but somehow skimmed over the KBUILD_EXTMOD bits.  I confirmed that
> > this is broken.
> >
> > I can certainly add an extra check to confirm that '$(KBUILD_EXTMOD)'
> > is unset and I'll do that in a v2 if I don't hear anything, but before
> > sending that I'll give folks a little bit of time to smack down my
> > general approach.  To be honest my approach is a bit of a hack so if
> > others can think of better ways to avoid all the unnecessary work
> > during install / modules_install / kernelrelease then I'm all ears!
> > :-)
>
>
> I think 3 sec is better than your previous report.

Well, it's 3 seconds for each of "all", "install", "modules_install
x2", and "kernelrelease".  Thus the full overhead in Chrome OS is
actually 15 seconds.  My patch saves 12 of that 15.  From reading my
old emails the original savings was 25 seconds (from 60 to 35).  Part
of the difference is that we've spent some time optimizing the
overhead of the compiler (more to come) and part of the difference is
that my computer is faster.


> I do not think the current situation is painful level
> for other general users.
> The parse stage takes less than 0.5 sec even on my
> old, cheap machine.

Presumably for most users they would at least do "all", "install", and
"modules_install" as part of their typical workflow of building and
testing a new kernel.  If your 0.5 second number is typical then these
users are spending 1.5 seconds.  IMO saving 1.5 seconds for all kernel
developers for something that they do dozens of times a day is worth a
little effort.


> Upstream code will continue to improve, but the progress
> will be slow.
>
> Given that this pain comes from wrapping CC with script,

This is only part of it.  Another big part is actually the overhead of
forking / execing clang.  ...but our compiler team is working on it.


> may I ask you to solve this on Chrome OS side meanwhile?
>
>
> For example, pass cc-option= from the command line etc.
>
>
>  make modules_install cc-option=

This is a good suggestion but slightly fragile, probably more fragile
than just picking a local hack to our kernel Makefiles.  I could sort
of imagine some future kernel version coming out where this would
break everything and it would take folks a while to figure out why.
Avoiding such fragility is why I always like to make my changes
upstream/  :-)  Then everyone gets the benefit but also it's likely
someone would notice if this change was conflicting with something
else.

In any case, if you do not agree that saving ~1.5 seconds per
build/install is worth it for upstream folks then I will solve it
locally one way or another.


-Doug
