Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:35203 "EHLO
        mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753332AbdEQSpb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2017 14:45:31 -0400
Received: by mail-pf0-f172.google.com with SMTP id n23so11548134pfb.2
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2017 11:45:31 -0700 (PDT)
Date: Wed, 17 May 2017 11:45:29 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] kbuild: clang: Disable the
 'duplicate-decl-specifier' warning
Message-ID: <20170517184529.GG141096@google.com>
References: <20170421213931.155210-1-mka@chromium.org>
 <20170421213931.155210-3-mka@chromium.org>
 <CAD=FV=XENNp3rcD5OK1d2WmccbqaT9=bjsayvbnA2Th8zmOAwg@mail.gmail.com>
 <CAK8P3a1y0MoxhMNr2v=R7-CANaATfFy58FM8heyOP78g-JZwHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1y0MoxhMNr2v=R7-CANaATfFy58FM8heyOP78g-JZwHA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Doug Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

El Wed, May 17, 2017 at 09:35:57AM +0200 Arnd Bergmann ha dit:

> On Tue, May 16, 2017 at 11:41 PM, Doug Anderson <dianders@chromium.org> wrote:
> > Hi
> >
> > On Fri, Apr 21, 2017 at 2:39 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
> >> clang generates plenty of these warnings in different parts of the code.
> >> They are mostly caused by container_of() and other macros which declare
> >> a "const <type> *" variable for their internal use which triggers a
> >> "duplicate 'const' specifier" warning if the <type> is already const
> >> qualified.
> >>
> >> Wording-mostly-from: Michael Davidson <md@google.com>
> >> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >> ---
> >>  Makefile | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Makefile b/Makefile
> >> index df5abf346354..6cd6d428db43 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -704,6 +704,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
> >>  KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
> >>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> >>  KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
> >> +KBUILD_CFLAGS += $(call cc-disable-warning, duplicate-decl-specifier)
> >>  # Quiet clang warning: comparison of unsigned expression < 0 is always false
> >>  KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
> >>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
> >
> > It seems like gcc 7 may have the same warning.  Specifically I saw a
> > patch fly by from Arnd, which you can find in Mark Brown's tree now:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=topic/rt5614&id=03ba791df98d15d07ea74075122af71e35c7611c
> >
> >
> > +Arnd since he may be trying to solve the same issues?
> 
> gcc-7 has a warning option with the same name, and I think I have
> fixed all the occurrences we got in mainline (some patches my still
> be in flight). However, it seems that only clang warns about
> 'const typeof(type)' with 'type' being already const.
> 
> I have not looked at clang warnings in a while, how many of these do
> we get overall (aside from container_of)? We might be able
> to turn off this particular warning by sprinkling in
> '_Pragma("clang diagnostic push") _Pragma("clang diagnostic
> ignored \"-Wduplicate-decl-specifier\"")' inside of the macro
> (not sure if clang allows it there, gcc-4.4 and earlier I think did
> not).
> 
> It might also be useful to open a bug against clang so they can
> change it in future releases, as the gcc behavior seems more
> sensible in this instance.

I asked our toolchain folks to follow up with the clang devs. They
asked me for a simple test case, to my suprise clang didn't raise a
warning when building this:

static const int x;
static const typeof(x) y;

It turns out that the warning is only raised when -std=gnu89 (and
potentially others) is set, which is the case of the
kernel. Definitely looks like this should be fixed in clang.
