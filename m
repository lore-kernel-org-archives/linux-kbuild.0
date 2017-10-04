Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46760 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751188AbdJDQWh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 12:22:37 -0400
Date: Wed, 4 Oct 2017 11:22:35 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH 1/2] kbuild: Pass HOSTCC and similar to tools
 Makefiles
Message-ID: <20171004162235.kjung56zx7povpe4@treble>
References: <20171003204839.27551-1-dianders@chromium.org>
 <20171003204839.27551-2-dianders@chromium.org>
 <CAK7LNARAVPOQh5SpLGRN5z-me-FhQerP5HVfxstaEaJuinsA7A@mail.gmail.com>
 <CABXOdTdJADZ5=sFYsoUdDa519e3SXhTGP-_ZsMhzaT8J_VOD+A@mail.gmail.com>
 <CAD=FV=Xr3Ah8BoNkzoHbYD8ovhrRJbf6+2e3ucOa93Q6w+rvbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xr3Ah8BoNkzoHbYD8ovhrRJbf6+2e3ucOa93Q6w+rvbA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Guenter Roeck <groeck@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Oct 04, 2017 at 09:09:51AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 3, 2017 at 9:07 PM, Guenter Roeck <groeck@google.com> wrote:
> > On Tue, Oct 3, 2017 at 8:20 PM, Masahiro Yamada
> >> CC:     for building tools that run on the target machine
> >> HOSTCC: for building tools that run on the build machine
> >>
> >>
> >> IMHO, this should be consistent to avoid confusion.
> >>
> >>
> >> Grepping CROSS_COMPILE under tools/ directory,
> >> I see many Makefile expect CC for the target system.
> >>
> >> For ex, tools/croup/Makefile
> >>
> >> CC = $(CROSS_COMPILE)gcc
> >>
> >>
> >>
> >> Why don't you fix tools/objtool/Makefile ?
> >>
> >>
> >
> > Interesting question. You are right, most tools are target tools, not
> > host tools. Maybe it _would_ make sense to use HOSTCC/HOSTCFLAGS to
> > build it. Copying Josh for input.

Yes, converting objtool to use HOSTCC/HOSTCFLAGS etc would be a good
improvement.  It has a dependency on libsubcmd, so
tools/lib/subcmd/Makefile will also need to be changed (and be careful
not to break perf in the process).

> Ah, good point.  I'm not terribly familiar with the things under
> tools, so when I saw "objtool" I assumed it was following a standard
> pattern for tools.
> 
> I can submit a patch for objtool's Makefile.  ...or, if it makes more
> sense, I can submit a patch to move "objtool" to the scripts
> directory.  ...or I can butt out of it.  :)  Which would folks prefer?

In some ways objtool would be a more natural fit in the scripts dir.
However, we decided to put it in tools because it might be useful
outside of the kernel and it's much easier to extract it from the kernel
that way.  Also, it has a shared dependency on libsubcmd with perf,
which is also in tools.

-- 
Josh
