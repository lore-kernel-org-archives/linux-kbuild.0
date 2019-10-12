Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49627 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbfJLE0V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Oct 2019 00:26:21 -0400
MIME-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com> <20191010151443.7399-5-maennich@google.com>
 <20191011153127.GA1283883@kroah.com> <20191011154311.GA192647@google.com>
In-Reply-To: <20191011154311.GA192647@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 12 Oct 2019 13:25:32 +0900
Message-ID: <CAK7LNASvQd8C4UE3Zm9tsSH48w3QKwskyTKn2P8tegBMrV0_ww@mail.gmail.com>
Subject: Re: [PATCH 4/4] export: avoid code duplication in include/linux/export.h
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Maennich <maennich@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Cc: Android Kernel" <kernel-team@android.com>, Jessica Yu <jeyu@kernel.org>, Martijn Coenen <maco@android.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Shaun Ruffell <sruffell@sruffell.net>, Will Deacon <will@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-modules <linux-modules@vger.kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>

On Sat, Oct 12, 2019 at 12:43 AM Matthias Maennich <maennich@google.com> wrote:
>
> On Fri, Oct 11, 2019 at 05:31:27PM +0200, Greg Kroah-Hartman wrote:
> >On Thu, Oct 10, 2019 at 04:14:43PM +0100, Matthias Maennich wrote:
> >> Now that the namespace value is not part of the __ksymtab entry name
> >> anymore, we can simplify the implementation of EXPORT_SYMBOL*. By
> >> allowing the empty string "" to represent 'no namespace', we can unify
> >> the implementation and drop a lot redundant code.  That increases
> >> readability and maintainability.
> >>
> >> As Masahiro pointed out earlier,
> >> "The drawback of this change is, it grows the code size. When the symbol
> >> has no namespace, sym->namespace was previously NULL, but it is now am
> >> empty string "". So, it increases 1 byte for every no namespace
> >> EXPORT_SYMBOL. A typical kernel configuration has 10K exported symbols,
> >> so it increases 10KB in rough estimation."
> >
> >10Kb of non-swapable memory isn't good.  But if you care about that, you
> >can get it back with the option to compile away any non-used symbols,
> >and that shouldn't be affected by this change, right?
>
> Rasmus suggested to put the 'aMS' flags on the __ksymtab_strings section
> to mitigate this:
> https://lore.kernel.org/lkml/f2e28d6b-77c5-5fe2-0bc4-b24955de9954@rasmusvillemoes.dk/
>
> I was not yet able to properly test this, so I did not include it in
> this series. As I said in the cover letter, this 4th patch might be
> optional for 5.4. So, we could defer it to a later time when we have
> addressed that properly.


This looks the same as my patch, though.

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada
