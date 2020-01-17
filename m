Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:51303 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQRwZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 12:52:25 -0500
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 00HHq8Bx003701
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Jan 2020 02:52:08 +0900
Received: by mail-vs1-f44.google.com with SMTP id t12so15326943vso.13
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jan 2020 09:52:08 -0800 (PST)
MIME-Version: 1.0
References: <1576486038-9899-1-git-send-email-amit.kachhap@arm.com>
 <1576486038-9899-15-git-send-email-amit.kachhap@arm.com> <20200117113351.GF26090@arrakis.emea.arm.com>
In-Reply-To: <20200117113351.GF26090@arrakis.emea.arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 18 Jan 2020 02:51:31 +0900
Message-ID: <CAK7LNASyrra9Xxvk+aG5OspbxmenDvohBVfusokD0RHy4CvqFg@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] kconfig: Add support for 'as-option'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Amit Daniel Kachhap <amit.kachhap@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Vincenzo Frascino <Vincenzo.Frascino@arm.com>, Mark Brown <Mark.Brown@arm.com>, Richard Henderson <richard.henderson@linaro.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Jan 17, 2020 at 8:33 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Dec 16, 2019 at 02:17:16PM +0530, Amit Daniel Kachhap wrote:
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index d4adfbe..cc465dd 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
> >  # Return y if the linker supports <flag>, n otherwise
> >  ld-option = $(success,$(LD) -v $(1))
> >
> > +# $(as-option,<flag>)
> > +# Return y if the assembler supports <flag>, n otherwise
> > +as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -E -x assembler /dev/null -o /dev/null)
>
> I had different experiments with this for MTE and noticed that clang
> does not honour the -Wa, option (which you use in a subsequent patch).
> So not sure how useful as-option is.


I think this is because it uses '-E' option.

To invoke the assembler, -c is needed.


I replaced -E with -c, and tested it.
It seems working for both gcc and clang.



I noticed a similar case for cc-option:
https://patchwork.kernel.org/patch/11339567/


-- 
Best Regards
Masahiro Yamada
