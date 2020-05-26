Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgEZP67 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 11:58:59 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5465CC03E96D
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2020 08:58:59 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z64so5835225pfb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2020 08:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <10f4fb0b-1012-b0e6-af05-0aa5a906de21@redhat.com>
 <20200520193637.6015-1-ndesaulniers@google.com> <CAK7LNAS_PMz9r3e1UcuM+r18JC2KeM2RqGOms1u3kVzN_N1MmA@mail.gmail.com>
 <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
 <CAK7LNARofo7wawEF4EcA2-wxnQkKw+WFoJ36EOeYFTUrthRfrA@mail.gmail.com> <CA+icZUXwNLG3ojWMhTuNkvR0AYtc1+BG6neOLZo56CB7ij01JQ@mail.gmail.com>
In-Reply-To: <CA+icZUXwNLG3ojWMhTuNkvR0AYtc1+BG6neOLZo56CB7ij01JQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 26 May 2020 08:58:47 -0700
Message-ID: <CAKwvOdn-zRA88QWc2EtLB4M9+VN_yLpzXXa+AGHW668sF2_z+Q@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: support compressed debug info
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Fangrui Song <maskray@google.com>, Nick Clifton <nickc@redhat.com>, David Blaikie <blakie@google.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Sun, May 24, 2020 at 12:48 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> *** The opposite is the case. ***
>
> Here, I am on a Samsung SandyBridge CPU/GPU aka 2nd generation
> ultrabook series runing Debian/testing AMD64.
>
> A slightly modified Debian-kernel linux-config takes me approx. 5 (in
> words five) hours of compiling and generating Debian packages.
>
> Plus, testing.
> Plus, testing.
> Plus, testing.
>
> In Linux-next times I run the whole Linux-Test-Project tests plus some
> FIO tests.
>
> Finally, I decide depending from what is new and interesting to me to
> attend a full single Linux-kernel release cycle.
> The last was Linux v5.3 which was the first release to be
> compile/link-able - with no modifications - with LLVM/Clang/LLD v9.0.
> For upcoming Linux v5.7 I have built each single RC Linux-kernel and
> used it in my daily work!
> Since RC1 - for me running on bare metal counts - checking QEMU or
> other VM is nice - but showed me that says sometimes nothing.
>
> Plus, I am building llvm-toolchains (LLVM/Clang/LLD) and testing with
> them (and report if needed).

This is a lot of invaluable work.  It means the world to me Sedat!

>
> "...if we diligently credit our idea reporters, they will, hopefully,
> be inspired to help us again in the future."
>
> These are some motivating words...
>
> My Tested-by is like a certificate - like a "Made in Germany" seal :-).

I love this, it is.  Maybe if folks on this thread are bored, they
could help me with a personal project of mine?
https://github.com/nickdesaulniers/What-Open-Source-Means-To-Me
We could use more German, and Japanese.

>
> Virtual Greeting from North-West Germany,
> - Sedat -

-- 
Thanks,
~Nick Desaulniers
