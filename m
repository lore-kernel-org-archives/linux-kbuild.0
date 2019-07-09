Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:26826 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfGIBH4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jul 2019 21:07:56 -0400
MIME-Version: 1.0
References: <20190706162508.8529-1-yamada.masahiro@socionext.com> <20190708140223.39d15d56@lwn.net>
In-Reply-To: <20190708140223.39d15d56@lwn.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Jul 2019 10:06:59 +0900
Message-ID: <CAK7LNAR50AdaOUZ9taD9rcD_mhKYR47YqWnxN0T9SbD9+j9vBA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: get rid of misleading $(AS) from documents
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Jul 9, 2019 at 5:02 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Sun,  7 Jul 2019 01:25:08 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
> > The assembler files in the kernel are *.S instead of *.s, so they must
> > be preprocessed. Since 'as' of GNU binutils is not able to preprocess,
> > we always use $(CC) as an assembler driver.
> >
> > $(AS) is almost unused in Kbuild. As of writing, there is just one place
> > that directly invokes $(AS).
> >
> >   $ git grep -e '$(AS)' -e '${AS}' -e '$AS' -e '$(AS:' -e '${AS:' -- :^Documentation
> >   drivers/net/wan/Makefile:  AS68K = $(AS)
> >
> > The documentation about *_AFLAGS* sounds like the flags were passed
> > to $(AS). This is somewhat misleading.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Would you like me to send this up through the docs tree?

No, I will apply it to linux-kbuild shortly.

Thanks.


-- 
Best Regards
Masahiro Yamada
