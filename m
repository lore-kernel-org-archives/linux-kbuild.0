Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:34403 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfCIA4d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 19:56:33 -0500
MIME-Version: 1.0
References: <20190308212524.121126-1-dianders@chromium.org>
 <CABXOdTe6hGWCsRpQcc_coB-whvJR2XfPfdLuc9QHMMvoXDNW=w@mail.gmail.com> <CAD=FV=VGL-Z93WtU8LTQXeJtdUU085T+Vd_MXNuuvWnJ6-eyDw@mail.gmail.com>
In-Reply-To: <CAD=FV=VGL-Z93WtU8LTQXeJtdUU085T+Vd_MXNuuvWnJ6-eyDw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 9 Mar 2019 09:55:46 +0900
Message-ID: <CAK7LNAQEYiowBS9tKC7ND5sjB2qrVy28=bzE=5Bt5R9rfR_LXg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Speed up install, modules_install and kernelrelease
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Guenter Roeck <groeck@google.com>, Michal Marek <michal.lkml@markovi.net>, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, Stephen Boyd <swboyd@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Mar 9, 2019 at 7:34 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Mar 8, 2019 at 2:29 PM Guenter Roeck <groeck@google.com> wrote:
> >
> > On Fri, Mar 8, 2019 at 1:25 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > As per the description of the old commit 3298b690b21c ("kbuild: Add a
> > > cache for generated variables"), calling the C compiler lots of times
> > > during the parsing stage of the Makefile can be a little slow.  If you
> > > happen to have a C compiler whose fork/exec time isn't optimized
> > > (perhaps it was linked dynamically, or perhaps it's called through
> > > several wrappers, or ...) then this can be more than a little slow, it
> > > can be very slow.
> > >
> > > The above slowness was addressed with the old Makefile cache, but the
> > > cache was reverted in commit e08d6de4e532 ("kbuild: remove kbuild
> > > cache").  That commit indicated that we expected to get the speed
> > > gains back because "the result of compiler tests will be naturally
> > > cached in the .config file", but as of the latest mainline there are
> > > still lots of direct calls to the C compiler that happen in the
> > > Makefile parsing stage.
> > >
> > > Perhaps we could try re-introducing the Makefile cache and fix the
> > > problems it was causing, but this patch codes up another solution that
> > > gets some of the speed gains back, perhaps with less complexity.
> > >
> > > Specifically I observed that by timing the parsing stage of the
> > > Makefile by adding statements like this to the beginning and end of
> > > the Makefile:
> > >   ZZZ := $(shell echo "$$(date '+%T.%N'): ..." >> /tmp/timing.txt)
> > >
> > > ...that three targets were spending 3 seconds each parsing the
> > > Makefile in my environment (building a Chrome OS kernel with clang)
> > > when it felt like they ought to be quick.  These were: install,
> > > modules_install and kernelrelease
> > >
> > > I saw timings that looked like:
> > >   09:23:08.903204451: Parsing Makefile, goals: install
> > >   09:23:11.960515772: Done parsing Makefile, goals: install
> > >
> > > Given that the kbuild system doesn't sync the config for any of these
> > > options I believe it is safe to say that it can't compile any code.
> > > Thus if we can avoid the C compiler invocation here we'll save time.
> > >
> > > The simplest way to accomplish this is to neuter all the calls to the
> > > compiler by stubbing them out.  After doing so (AKA applying this
> > > change) the same timing looks like:
> > >   09:28:04.929252271: Parsing Makefile, goals: install
> > >   09:28:05.107468449: Done parsing Makefile, goals: install
> > >
> > > During an incremental kernel build/install on Chrome OS we call
> > > install once, modules_install twice (once to keep unstripped), and
> > > kernelrelease once.  Thus this saves ~12 seconds on an incremental
> > > kernel build/install.  With my current setup, this brings it from ~40
> > > seconds to ~28 seconds.  Re-introducing the Makefile cache would
> > > likely save us an extra ~3 seconds since we'd avoid the parsing in the
> > > compile stage.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  Makefile | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index f070e0d65186..5f7532d9be65 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -304,6 +304,20 @@ else
> > >  scripts/Kbuild.include: ;
> > >  include scripts/Kbuild.include
> > >
> > > +# If we can't sync the config then we know we can't compile code.
> > > +# Replace the slow option-testing commands with stubs to significantly
> > > +# speed up the Makefile parsing stage of the build.
> > > +ifeq ($(may-sync-config),0)
> >
> > I think that breaks KBUILD_EXTMOD, which sets the variable to 0.
>
> Yup, thanks for catching--I should have realized that from the code
> but somehow skimmed over the KBUILD_EXTMOD bits.  I confirmed that
> this is broken.
>
> I can certainly add an extra check to confirm that '$(KBUILD_EXTMOD)'
> is unset and I'll do that in a v2 if I don't hear anything, but before
> sending that I'll give folks a little bit of time to smack down my
> general approach.  To be honest my approach is a bit of a hack so if
> others can think of better ways to avoid all the unnecessary work
> during install / modules_install / kernelrelease then I'm all ears!
> :-)


I think 3 sec is better than your previous report.

I do not think the current situation is painful level
for other general users.
The parse stage takes less than 0.5 sec even on my
old, cheap machine.

Upstream code will continue to improve, but the progress
will be slow.

Given that this pain comes from wrapping CC with script,
may I ask you to solve this on Chrome OS side meanwhile?


For example, pass cc-option= from the command line etc.


 make modules_install cc-option=


will give you better result.



--
Best Regards
Masahiro Yamada
