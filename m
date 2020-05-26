Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:41747 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgEZQQo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 12:16:44 -0400
MIME-Version: 1.0
References: <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
 <20200521220041.87368-1-ndesaulniers@google.com> <CAK7LNARtO5Pr2nxpoORSHDFWHbjP0waOmrn_TZ+rXhmYm+TORw@mail.gmail.com>
 <CAKwvOd=qNa4fLY7ymVwvC3TwCH4DNLyEfygoTfBJ2y19xffQUg@mail.gmail.com>
In-Reply-To: <CAKwvOd=qNa4fLY7ymVwvC3TwCH4DNLyEfygoTfBJ2y19xffQUg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 27 May 2020 01:15:51 +0900
Message-ID: <CAK7LNASkcLx-K+W1va9WxfxZ=7H-w65QbyBt=88dzK1NrrM_PQ@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile: support compressed debug info
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Fangrui Song <maskray@google.com>, Nick Clifton <nickc@redhat.com>, David Blaikie <blaikie@google.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Changbin Du <changbin.du@intel.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Anshuman Khandual <anshuman.khandual@arm.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Wed, May 27, 2020 at 12:53 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Tue, May 26, 2020 at 3:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > > Suggested-by: David Blaikie <blaikie@google.com>
> > > Suggested-by: Nick Clifton <nickc@redhat.com>
> > > Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > Reviewed-by: Fangrui Song <maskray@google.com>
> > > Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> >
> >
> > Suggested-by seems strange to me, but
> > I decided to not be worried too much.
>
> Ah, sorry, Monday was a holiday.  I unplugged for the long weekend.
> https://en.wikipedia.org/wiki/Memorial_Day
>
> I like the suggestion to simply say "thanks to ..." in the commit
> message and will use that next time.  I was ok to send a v4 with it.


If you send v4, I will replace.

Thanks.





-- 
Best Regards
Masahiro Yamada
