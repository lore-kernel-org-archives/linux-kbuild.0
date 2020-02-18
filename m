Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:21053 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbgBRAid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 19:38:33 -0500
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 01I0c88x022532
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 09:38:08 +0900
Received: by mail-ua1-f50.google.com with SMTP id o42so6816116uad.10
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 16:38:08 -0800 (PST)
MIME-Version: 1.0
References: <1581931668-11559-1-git-send-email-amit.kachhap@arm.com>
 <1581931668-11559-16-git-send-email-amit.kachhap@arm.com> <CAK7LNARTD88U1ZBxMU3fCDb1KxF=PavhgoUzqTt6ar9-+7eMQA@mail.gmail.com>
 <7b2b8e5a-c276-4dfe-3fac-afc03cda4e3d@arm.com>
In-Reply-To: <7b2b8e5a-c276-4dfe-3fac-afc03cda4e3d@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 18 Feb 2020 09:37:31 +0900
Message-ID: <CAK7LNASELe0+MhpU-huL-jCmxsCofs-OKz_1xYYLgJtuM5bomg@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] kconfig: Add support for 'as-option'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Amit Daniel Kachhap <amit.kachhap@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi,

On Mon, Feb 17, 2020 at 7:16 PM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:
>
> Hi,
>
> On 17/02/2020 09:39, Masahiro Yamada wrote:
> > Hi.
> >
> > On Mon, Feb 17, 2020 at 6:29 PM Amit Daniel Kachhap
> > <amit.kachhap@arm.com> wrote:
> >>
> >> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
> >>
> >> Currently kconfig does not have a feature that allows to detect if the
> >> used assembler supports a specific compilation option.
> >>
> >> Introduce 'as-option' to serve this purpose in the context of Kconfig:
> >>
> >>         config X
> >>                 def_bool $(as-option,...)
> >>
> >> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> Cc: linux-kbuild@vger.kernel.org
> >> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> >> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> >> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
> >> ---
> >>  scripts/Kconfig.include | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> >> index 85334dc..374e251 100644
> >> --- a/scripts/Kconfig.include
> >> +++ b/scripts/Kconfig.include
> >> @@ -35,6 +35,10 @@ ld-option = $(success,$(LD) -v $(1))
> >>  # Return y if the assembler supports <instr>, n otherwise
> >>  as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
> >>
> >> +# $(as-option,<flag>)
> >> +# Return y if the assembler supports <flag>, n otherwise
> >> +as-option =$(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
> >> +
> >
> >
> > I am still not convinced with using /dev/zero here.
> >
>
> Could you please elaborate a bit more?


I am just not familiar with this usage of /dev/zero.


The behavior of /dev/null is clear.
The read/write to /dev/null is described in the standard:
https://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap10.html

I just do not know whether the write to /dev/zero is
the defined-behavior or not.


Masahiro Yamada


>
> >
> > Does this work?
> >
> > as-option = $(success, cat /dev/null | $(CC) $(CLANG_FLAGS) $(1) -c -x
> > assembler -o /dev/null -)
> >
>
> I will try and get back to you.



Masahiro Yamada


>
> >
> > [1] Could you insert as-option between ld-option and as-instr ?
> >
>
> Sure, I will do it in the next version.
>
> > [2] Could you add some comments to explain why
> >      /dev/null -o /dev/null does not work?
> >
> >
>
> Comments are always a good think :) I will do in the next version.
>
> >
> >
> >
> >>  # check if $(CC) and $(LD) exist
> >>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> >>  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
> >> --
> >> 2.7.4
> >>
> >
> >
>
> --
> Regards,
> Vincenzo
--
Best Regards
Masahiro Yamada
