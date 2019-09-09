Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:56411 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfIIOfK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 10:35:10 -0400
MIME-Version: 1.0
References: <20190909105317.20473-1-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 9 Sep 2019 23:34:23 +0900
Message-ID: <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Nicolas,

On Mon, Sep 9, 2019 at 10:48 PM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Mon, 9 Sep 2019, Masahiro Yamada wrote:
>
> > This line was touched by commit f235541699bc ("export.h: allow for
> > per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> > not explain why.
> >
> > CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).
>
> I'm pretty sure it was needed back then so not to interfere with users
> of this file. My fault for not documenting it.

Hmm, I did not see a problem in my quick build test.

Do you remember which file was causing the problem?



-- 
Best Regards
Masahiro Yamada
