Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:43064 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753346AbeBTTer (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 14:34:47 -0500
Date: Tue, 20 Feb 2018 20:25:08 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Message-ID: <20180220192508.GA12089@vmlxhi-102.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
 <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
 <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>, Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>

On Tue, Feb 20, 2018 at 05:24:01PM +0900, Masahiro Yamada wrote:
> 2018-02-20 17:13 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> > 2018-02-19 5:47 GMT+09:00 Eugeniu Rosca <roscaeugeniu@gmail.com>:
> >> From: Eugeniu Rosca <erosca@de.adit-jv.com>
> >>
> >> Hello Masahiro, Ulf, Petr and all,
> >>
> >> Here are a few words about the motivation behind this patch series.
> >>
> >> First, the reason I got in touch with Kconfig is to optimize the
> >> configuration of automotive kernels, as well as to align the kernel
> >> configuration across a number of platforms. In the context of kernel
> >> optimization, one of the primary goals is to filter out any features
> >> that are not mentioned in the platform requirements.
> >>
> >> Surprisingly or not, disabling a CONFIG option (which is assumed to
> >> be unneeded) may be not so trivial. Especially it is not trivial, when
> >> this CONFIG option is selected by a dozen of other configs. Before the
> >> moment commit 1ccb27143360 ("kconfig: make "Selected by:" and
> >> "Implied by:" readable") was submitted by Petr and eventually popped
> >> up in v4.16-rc1, it was an absolute pain to break down the "Selected by"
> >> reverse dependency expression in order to identify all those configs
> >> which select (IOW *do not allow disabling*) a certain feature (assumed
> >> to be not needed).
> >>
> >> This patch series tries to make one step further and puts at users'
> >> fingertips the revdep top level OR sub-expressions grouped/clustered by
> >> the tristate value they evaluate to. This should allow the users to
> >> directly concentrate on and tackle the active reverse dependencies,
> >> which imho are the only ones that matter for a given ARCH and for a
> >> given defconfig (nevertheless we still print all of them).
> >>
> >> Changes v3->v4 (fixed review findings from Ulf):
> >> - Remove redundant default cases in switch constructs.
> >> - Remove gettext _() tokens in str_append() calls.
> >> - Aggregate code repetitions in expr_print_revdep().
> >>
> >> Changes v2->v3:
> >> - Switch from reverse dependencies prefixed by their tristate value to
> >>   reverse dependencies grouped by the tristate value they evaluate to.
> >> - Skip printing "{Selected,Implied} by [y|m|n]:" if there are no top
> >>   level OR tokens/sub-expressions that evaluate to y|m|n (suggested
> >>   by Petr).
> >> - Use [1] as template for updating the interface/prototype of
> >>   __expr_print() (suggested by Ulf).
> >>
> >> Changes v1->v2:
> >> - Don't skip the =n reverse dependency OR tokens, since some users might
> >>   still need this information (suggested by Ulf).
> >> - Instead of using "Selected by" for active tokens only, use it for all
> >>   OR tokens, but specify the tristate value of each token as prefix
> >>   (suggested by Masahiro).
> >>
> >> [1] https://marc.info/?l=linux-kbuild&m=151777006005199&w=4
> >>
> >> Eugeniu Rosca (3):
> >>   kconfig: Print reverse dependencies on new line consistently
> >>   kconfig: Prepare for printing reverse dependencies in groups
> >>   kconfig: Print reverse dependencies in groups
> >>
> >>  scripts/kconfig/expr.c      | 102 +++++++++++++++++++++++++++++++++++++-------
> >>  scripts/kconfig/expr.h      |  11 ++++-
> >>  scripts/kconfig/lkc_proto.h |   1 +
> >>  scripts/kconfig/menu.c      |  37 +++++++++++-----
> >>  4 files changed, 124 insertions(+), 27 deletions(-)
> >>
> >
> >
> > I do not like this implementation.
> > The code is super ugly, the diff-stat is too much than needed.
> >
> > Please rewrite the code within 20 lines.
> >
> 
> For a hint, I cleaned up the code base.
> https://patchwork.kernel.org/patch/10229545/
> 
> which should be equivalent to yours:
> https://patchwork.kernel.org/patch/10226951/

Fwiw CP reports for https://patchwork.kernel.org/patch/10229545/

WARNING: unnecessary whitespace before a quoted newline
#113: FILE: scripts/kconfig/menu.c:830:
+		str_append(r, _("  Selected by: \n"));

WARNING: unnecessary whitespace before a quoted newline
#121: FILE: scripts/kconfig/menu.c:836:
+		str_append(r, _("  Implied by: \n"));

Both solutions behave the same for me.
I agree Masahiro's patch is much nicer.

Fwiw, both solutions display reverse dependencies of certain choices
like below:

Prompt: Compiler optimization level
   Location:
     -> General setup
  Defined at init/Kconfig:1021
  Selected by:
   - m

I can notice this output at least for:
  prompt "Cputime accounting"
  prompt "Compiler optimization level"
  prompt "Choose SLAB allocator"
  prompt "Processor family"
  prompt "Preemption Model"
  prompt "Timer frequency"
  prompt "IO delay type"
  prompt "Choose kernel unwinder"
  prompt "Default security module"

I'm not sure if `Selected by:\n  - m` is of any use/help. Omitting it,
if desired, is probably subject of a different patch?

> No 'enum print_type', please.

Ok. Feedback is appreciated.

> 
> 
> -- 
> Best Regards
> Masahiro Yamada

Best regards,
Eugeniu.
