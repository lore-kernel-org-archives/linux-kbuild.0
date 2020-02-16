Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30329 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBPE2H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Feb 2020 23:28:07 -0500
MIME-Version: 1.0
References: <20200210131925.145463-1-samitolvanen@google.com>
 <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com> <CABCJKuemBAeySJQY6yxhzbxK=XGBtVSt+6J6WXpO=RoiVXH7GQ@mail.gmail.com>
In-Reply-To: <CABCJKuemBAeySJQY6yxhzbxK=XGBtVSt+6J6WXpO=RoiVXH7GQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 16 Feb 2020 13:27:20 +0900
Message-ID: <CAK7LNARyYqmSByD3jQr+TPe1RHEj9CxqRE880AqxA5SU3yUk5A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove duplicate dependencies from .mod files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Sami,

On Thu, Feb 13, 2020 at 2:13 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Wed, Feb 12, 2020 at 5:23 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > In which case are undefined symbols duplicated?
>
> When a module consists of multiple compilation units, which depend on
> the same external symbols. In Android, we ran into this when adding
> hardening features that all depend on an external error handler
> function with a rather long name. When CONFIG_TRIM_UNUSED_SYMS was
> later enabled, we ran into this:
>
> $ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
> xargs echo | wc
>       2    9136  168660
>
> xargs defaults to 128kiB limit for command line size, so the output
> was split into two lines, which means some of the dependencies were
> dropped and we ran into modpost errors. One method of fixing this is
> to increase the limit:
>
> $ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
> xargs -s 262144 echo | wc
>       1    9136  168660
>
> But it seems removing duplicates is a better solution as the length of
> the dependency list is reduced significantly:
>
> $ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
> sort -u | xargs echo | wc
>       1    2716   50461


At least, I am unable to reproduce this in upstream.

This is my result for x86 allmodconfig builds.

masahiro@grover:~/workspace/linux-kbuild$ nm
drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | wc
    572     572   11478
masahiro@grover:~/workspace/linux-kbuild$ nm
drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | sort -u |
wc
    572     572   11478


I see no difference with/without 'sort -u'.


I also tried llvm-nm instead of GNU nm,
but the result is the same.


masahiro@grover:~/workspace/linux-kbuild$ llvm-nm
drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | wc
    572     572   11478
masahiro@grover:~/workspace/linux-kbuild$ llvm-nm
drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | sort -u |
wc
    572     572   11478




> > Do you have a .config to reproduce it?
>
> I can currently reproduce this on an Android kernel that has
> Control-Flow Integrity (CFI) enabled. While this feature is not
> upstreamed yet, there's nothing that would prevent us from hitting the
> command line limit with sufficiently large modules otherwise as well.


Does ACK do this differently?

I think it would be strange
if $(NM) duplicated undefined symbols.



-- 
Best Regards
Masahiro Yamada
