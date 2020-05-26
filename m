Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727862AbgEZPxY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 11:53:24 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B30C03E96D
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2020 08:53:23 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id n15so7338pjt.4
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2020 08:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
 <20200521220041.87368-1-ndesaulniers@google.com> <CAK7LNARtO5Pr2nxpoORSHDFWHbjP0waOmrn_TZ+rXhmYm+TORw@mail.gmail.com>
In-Reply-To: <CAK7LNARtO5Pr2nxpoORSHDFWHbjP0waOmrn_TZ+rXhmYm+TORw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 26 May 2020 08:53:12 -0700
Message-ID: <CAKwvOd=qNa4fLY7ymVwvC3TwCH4DNLyEfygoTfBJ2y19xffQUg@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile: support compressed debug info
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Fangrui Song <maskray@google.com>, Nick Clifton <nickc@redhat.com>, David Blaikie <blaikie@google.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Changbin Du <changbin.du@intel.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Anshuman Khandual <anshuman.khandual@arm.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Tue, May 26, 2020 at 3:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > Suggested-by: David Blaikie <blaikie@google.com>
> > Suggested-by: Nick Clifton <nickc@redhat.com>
> > Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Reviewed-by: Fangrui Song <maskray@google.com>
> > Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
>
>
> Suggested-by seems strange to me, but
> I decided to not be worried too much.

Ah, sorry, Monday was a holiday.  I unplugged for the long weekend.
https://en.wikipedia.org/wiki/Memorial_Day

I like the suggestion to simply say "thanks to ..." in the commit
message and will use that next time.  I was ok to send a v4 with it.

>
> Applied to linux-kbuild.

Appreciated.  I will have a dwarf-5 patch set, too.  I'm not thrilled
with how I wired up Kconfig; maybe posting it for feedback is better
than me worrying about it too much.  Hopefully will send this week,
assuming there's not too many bugs that require my immediate attention
(there never is...).

-- 
Thanks,
~Nick Desaulniers
