Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:21184 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfERFaS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 May 2019 01:30:18 -0400
MIME-Version: 1.0
References: <20190516194818.29230-1-jani.nikula@intel.com> <155808211071.12244.10320883277188429270@skylake-alporthouse-com>
In-Reply-To: <155808211071.12244.10320883277188429270@skylake-alporthouse-com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 May 2019 14:29:30 +0900
Message-ID: <CAK7LNARMb4Wza09Kq2it=NUkbd3asS9Me7uhUOSwPbu+j0OmeQ@mail.gmail.com>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are self-contained
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, intel-gfx@lists.freedesktop.org, Michal Marek <michal.lkml@markovi.net>

On Fri, May 17, 2019 at 5:35 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Jani Nikula (2019-05-16 20:48:16)
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 8a1f64f17740..c2839de06485 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -66,6 +66,9 @@ extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
> >  extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> >  endif
> >
> > +# Test self-contained headers
> > +extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.o,$(header-test-y))
>
> This didn't get pulled into clean-files.
>
> clean-files-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.c,$(header-test-y))
> ?
>
> Not enough. Nor is clean-files-y +=...


The correct syntax is 'clean-files +='
instead of 'clean-files-y +='


If Kbuild supports this in the core Makefiles,
we can add "-o -name '*.header_test.c'"
to the top Makefile.



> And it should also be put into the global gitignore I think.


Documentation/dontdiff too.



> -Chris



-- 
Best Regards
Masahiro Yamada
