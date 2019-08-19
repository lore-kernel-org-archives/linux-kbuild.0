Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20255 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfHSDtq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Aug 2019 23:49:46 -0400
MIME-Version: 1.0
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
 <20190509143859.9050-7-joe.lawrence@redhat.com> <CAK7LNAQuS-YcXecfJ21BGzc0CimzWxQcYST5-1xRgnCQGtcL4A@mail.gmail.com>
 <20190812155626.GA19845@redhat.com> <CAK7LNATRLTBqA9c=b+Y38T-zWc9o5JMq18r9auA=enPC=p10pA@mail.gmail.com>
 <alpine.LSU.2.21.1908161016430.2020@pobox.suse.cz> <6c7e4d19-b993-1c14-d6cf-6aa1ee891361@redhat.com>
In-Reply-To: <6c7e4d19-b993-1c14-d6cf-6aa1ee891361@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Aug 2019 12:49:02 +0900
Message-ID: <CAK7LNAS0Z95VT2n1o3V09bKf-rkPBMNdRryF67gpLKtnjAVAiA@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] modpost: Add modinfo flag to livepatch modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Miroslav Benes <mbenes@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Aug 16, 2019 at 9:43 PM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> On 8/16/19 4:19 AM, Miroslav Benes wrote:
> > Hi,
> >
> >> I cleaned up the build system, and pushed it based on my
> >> kbuild tree.
> >>
> >> Please see:
> >>
> >> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> >> klp-cleanup
> >
> > This indeed looks much simpler and cleaner (as far as I can judge with my
> > limited kbuild knowledge). We just need to remove MODULE_INFO(livepatch,
> > "Y") from lib/livepatch/test_klp_convert_mod_a.c to make it compile and
> > work (test_klp_convert_mod_a is not a livepatch module, it is just a dummy
> > module which is then livepatched by lib/livepatch/test_klp_convert1.c).
> >
>
> Yeah, Masahiro this is great, thanks for reworking this!
>
> I did tweak one module like Miroslav mentioned and I think a few of the
> newly generated files need to be cleaned up as part of "make clean", but
> all said, this is a nice improvement.
>
> Are you targeting the next merge window for your kbuild branch?  (This
> appears to be what the klp-cleanup branch was based on.)


I can review this series from the build system point of view,
but I am not familiar enough with live-patching itself.

Some possibilities:

[1] Merge this series thru the live-patch tree after the
    kbuild base patches land.
    This requires one extra development cycle (targeting for 5.5-rc1)
    but I think this is the official way if you do not rush into it.

[2] Create an immutable branch in kbuild tree, and the live-patch
    tree will use it as the basis for queuing this series.
    We will have to coordinate the pull request order, but
    we can merge this feature for 5.4-rc1

[3] Apply this series to my kbuild tree, with proper Acked-by
    from the livepatch maintainers.
    I am a little bit uncomfortable with applying patches I
    do not understand, though...


-- 
Best Regards
Masahiro Yamada
