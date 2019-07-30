Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61647 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727865AbfG3O3J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 10:29:09 -0400
MIME-Version: 1.0
References: <20190725154730.80169-1-swboyd@chromium.org> <CAK7LNAQZJgkx-yEwgHcTapKFayExgUCb3=zLBpJmVMJMeEA_WA@mail.gmail.com>
 <5d3f016c.1c69fb81.b4775.c7d0@mx.google.com>
In-Reply-To: <5d3f016c.1c69fb81.b4775.c7d0@mx.google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 30 Jul 2019 23:28:20 +0900
Message-ID: <CAK7LNASoNRsMHHBW=d_Lkjo7eLpq5=gkU_g+k8NwEB0BwV37ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Check for unknown options with cc-option usage
 in Kconfig and clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Peter Smith <peter.smith@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Douglas Anderson <dianders@chromium.org>

On Mon, Jul 29, 2019 at 11:23 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Masahiro Yamada (2019-07-29 03:02:40)
> >
> > Thanks for catching this.
> >
> > I wonder if we could fix this issue
> > by one-liner, like this:
> >
> >
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index 8a5c4d645eb1..4bbf4fc163a2 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -25,7 +25,7 @@ failure = $(if-success,$(1),n,y)
> >
> >  # $(cc-option,<flag>)
> >  # Return y if the compiler supports <flag>, n otherwise
> > -cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
> > +cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c
> > /dev/null -o /dev/null)
> >
> >  # $(ld-option,<flag>)
> >  # Return y if the linker supports <flag>, n otherwise
> >
> >
> >
> > This propagates not only -Werror=unknown-warning-option
> > but also other clang flags to Kconfig.
> >
> >
> > Currently, we do not pass the target triplet to Kconfig.
> > This means, cc-option in Kconfig evaluates the given flags
> > against host-arch instead of target-arch.
> > The compiler flags are mostly independent of the architecture,
> > and this is not a big deal, I think.
> > But, maybe, would it make more sense to pass the other
> > basic clang flags as well?
> >
>
> Yes that also works and I had that earlier. I wanted to mirror what was
> done in scripts/Kbuild.include where there's a CC_OPTION_CFLAGS
> variable. I'm happy either way, so it's up to you.
>

Can you post v3 with $(CLANG_FLAGS) ?

Thanks.

-- 
Best Regards
Masahiro Yamada
