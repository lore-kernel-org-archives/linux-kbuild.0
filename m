Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:23597 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfHSDvk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Aug 2019 23:51:40 -0400
MIME-Version: 1.0
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
 <20190509143859.9050-7-joe.lawrence@redhat.com> <CAK7LNAQuS-YcXecfJ21BGzc0CimzWxQcYST5-1xRgnCQGtcL4A@mail.gmail.com>
 <20190812155626.GA19845@redhat.com> <CAK7LNATRLTBqA9c=b+Y38T-zWc9o5JMq18r9auA=enPC=p10pA@mail.gmail.com>
 <alpine.LSU.2.21.1908161016430.2020@pobox.suse.cz> <6c7e4d19-b993-1c14-d6cf-6aa1ee891361@redhat.com>
 <163ad1fb-ccbf-0a3e-d795-2bb748a0e88f@redhat.com>
In-Reply-To: <163ad1fb-ccbf-0a3e-d795-2bb748a0e88f@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Aug 2019 12:50:47 +0900
Message-ID: <CAK7LNAR-1qXUhZ=cKUK2WEg5WeinXgFf1B2rq-=Oke4CUucp_g@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] modpost: Add modinfo flag to livepatch modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Miroslav Benes <mbenes@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Joe,

On Sat, Aug 17, 2019 at 4:01 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> On 8/16/19 8:43 AM, Joe Lawrence wrote:
> > On 8/16/19 4:19 AM, Miroslav Benes wrote:
> >> Hi,
> >>
> >>> I cleaned up the build system, and pushed it based on my
> >>> kbuild tree.
> >>>
> >>> Please see:
> >>>
> >>> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> >>> klp-cleanup
> >>
> >> This indeed looks much simpler and cleaner (as far as I can judge with my
> >> limited kbuild knowledge). We just need to remove MODULE_INFO(livepatch,
> >> "Y") from lib/livepatch/test_klp_convert_mod_a.c to make it compile and
> >> work (test_klp_convert_mod_a is not a livepatch module, it is just a dummy
> >> module which is then livepatched by lib/livepatch/test_klp_convert1.c).
> >>
> >
> > Yeah, Masahiro this is great, thanks for reworking this!
> >
> > I did tweak one module like Miroslav mentioned and I think a few of the
> > newly generated files need to be cleaned up as part of "make clean", but
> > all said, this is a nice improvement.
> >
>
> Well actually, now I see this comment in the top-level Makefile:
>
> # Cleaning is done on three levels.
>
> # make clean     Delete most generated files
>
> #                Leave enough to build external modules
>
> # make mrproper  Delete the current configuration, and all generated
> files
> # make distclean Remove editor backup files, patch leftover files and
> the like
>
> I didn't realize that we're supposed to be able to still build external
> modules after "make clean".  If that's the case, then one might want to
> build an external klp-module after doing that.

Yes. 'make clean' must keep all the build artifacts
needed for building external modules.


> With that in mind, shouldn't Symbols.list to persist until mrproper?
> And I think modules-livepatch could go away during clean, what do you think?
>
> -- Joe


Symbols.list should be kept by the time mrproper is run.
So, please add it to MRROPER_FILES instead of CLEAN_FILES.

modules.livepatch is a temporary file, so you can add it to
CLEAN_FILES.

How is this feature supposed to work for external modules?

klp-convert receives:
"symbols from vmlinux" + "symbols from no-klp in-tree modules"
+ "symbols from no-klp external modules" ??



BTW, 'Symbols.list' sounds like a file to list out symbols
for generic purposes, but in fact, the
file format is very specific for the klp-convert tool.
Perhaps, is it better to rename it so it infers
this is for livepatching? What do you think?


-- 
Best Regards
Masahiro Yamada
