Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:16417 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgAZOqW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Jan 2020 09:46:22 -0500
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 00QEk7qU023044
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jan 2020 23:46:08 +0900
Received: by mail-vs1-f53.google.com with SMTP id e188so3903123vse.3
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jan 2020 06:46:07 -0800 (PST)
MIME-Version: 1.0
References: <1579774839-19562-1-git-send-email-amit.kachhap@arm.com>
 <1579774839-19562-16-git-send-email-amit.kachhap@arm.com> <CAKv+Gu-r4d1bBNJK0BZAX=b2+SDqMztAHx+cpq1dxB2q8O1YJA@mail.gmail.com>
 <0640c3c6-8b5f-8c29-692c-a9acdda01a6c@arm.com>
In-Reply-To: <0640c3c6-8b5f-8c29-692c-a9acdda01a6c@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 26 Jan 2020 23:45:30 +0900
Message-ID: <CAK7LNAShhOCpdoVveQ1C1VupDEYOv2UJp4iSTnyyFQ=eTko+uw@mail.gmail.com>
Subject: Re: [PATCH v4 15/17] kconfig: Add support for 'as-option'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Amit Daniel Kachhap <amit.kachhap@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Jan 23, 2020 at 7:52 PM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:
>
> On 23/01/2020 10:30, Ard Biesheuvel wrote:
> > On Thu, 23 Jan 2020 at 11:22, Amit Daniel Kachhap <amit.kachhap@arm.com> wrote:
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
> >> Changes since v3:
> >> *) Changed the assembler option to -c instead of earlier -E.
> >> *) Added Masahiro Acked-by.
> >>
> >>  scripts/Kconfig.include | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> >> index d4adfbe..c4b4424 100644
> >> --- a/scripts/Kconfig.include
> >> +++ b/scripts/Kconfig.include
> >> @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
> >>  # Return y if the linker supports <flag>, n otherwise
> >>  ld-option = $(success,$(LD) -v $(1))
> >>
> >> +# $(as-option,<flag>)
> >> +# Return y if the assembler supports <flag>, n otherwise
> >> +as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
> >
> > Did you mean '-o /dev/null' here?
> >
>
> No /dev/zero because otherwise I get a warning that says that I am trying to
> compile an object into the same file.
>
> If I invert /dev/zero and /dev/null this trashes the compilation. It took me a
> while to get the right combination.


What compiler produces such a warning?
GCC? Clang?




--
Best Regards
Masahiro Yamada
