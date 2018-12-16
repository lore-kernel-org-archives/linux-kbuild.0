Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53861 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729822AbeLPPcN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Dec 2018 10:32:13 -0500
MIME-Version: 1.0
References: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com>
 <1544774739-13471-2-git-send-email-yamada.masahiro@socionext.com> <CAKwvOdkSSb-EECgCmYnW40Mbd4ibSf22wqUBqaT_X7g7Sn_9UQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkSSb-EECgCmYnW40Mbd4ibSf22wqUBqaT_X7g7Sn_9UQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 17 Dec 2018 00:31:30 +0900
Message-ID: <CAK7LNATMRvsyiQH3+S==r8xObv5uedQmqnj6zZyv8uwFrt0p+Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: add -Werror=strict-prototype flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Sat, Dec 15, 2018 at 3:34 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Dec 14, 2018 at 12:06 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > -Wstrict-prototype is added to KBUILD_CFLAGS first, then overridden
>
> -Wstrict-prototypes (plural)
>
> > by -Werror=strict-prototype later.
>
> -Werror=strict-prototypes (plural)
>
> LGTM: https://godbolt.org/z/DyEpmU
>
> If you would mind updating the commit message (and subject), then:
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>


Thanks for checking this.

I will locally fix those typos (including the one in the subject).



-- 
Best Regards
Masahiro Yamada
