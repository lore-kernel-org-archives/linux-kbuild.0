Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:32783 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgEUHVs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 03:21:48 -0400
MIME-Version: 1.0
References: <20200514131234.380097-1-efremov@linux.com> <CAK7LNASRv9E-pfYCRmD-RstKhW+WgfHKrn+7bP_dAAkyKaoPGg@mail.gmail.com>
 <e26a1565-e770-0e5e-c730-60cc6fa16a4f@linux.com>
In-Reply-To: <e26a1565-e770-0e5e-c730-60cc6fa16a4f@linux.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 21 May 2020 16:20:57 +0900
Message-ID: <CAK7LNASqja+eKcTeBA29LoWcMXucWv-L7Jntvzx9a5cam=UcWQ@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: add variables for compression tools
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Vyukov <dvyukov@google.com>

On Fri, May 15, 2020 at 6:40 PM Denis Efremov <efremov@linux.com> wrote:
>
> It seems that I missed a couple of tar commands in the patch:
> scripts/Makefile.package
> scripts/package/buildtar
>
> On 5/15/20 5:20 AM, Masahiro Yamada wrote:
> > On Thu, May 14, 2020 at 10:14 PM Denis Efremov <efremov@linux.com> wrote:
> >>
> >
> > commit 5054e88a7934d5ff5ec14231c8b8676161bb45fa
> > Author: Paul Eggert <eggert@cs.ucla.edu>
> > Date:   Mon Mar 16 14:25:17 2015 -0700
> >
> >     gzip: make the GZIP env var obsolescent
>
> Other implementations can depend on this.
> pigz still parses GZIP env var:
> https://github.com/madler/pigz/blob/master/pigz.c#L4346
>
> >
> > Some possible options I came up with:
> >
> >
> > [1] Use KGZIP for now, but BZIP2, XZ, etc. for the others.
> >
> >     (Then, rename KGZIP to GZIP when the time comes)
> >
> >
> > [2] Do not take this patch
> >
> >     The whole build process is parallelized
> >     by 'make -j $(nproc)'.
> >
> >     If you are still eager to use pigz instead gzip,
> >     use a symbolic link or a wrapper shell script.
> >
> >     $ ln -s /usr/bin/pigz  /$HOME/bin/gzip
> >     $ PATH="$HOME/bin:$PATH"
> >
>
> [3] GZIP at frontend, KGZIP or _GZIP internally? Something like:
>
> $ cat Makefile
> GZIP=gzip
> override KGZIP=$(GZIP) # optional overrdide. Used to force GZIP value
>                        # in case: make KGZIP=test
>
> unexport GZIP


The command line option is really strong,
so you cannot negate it by 'unexport GZIP'.

override GZIP :=

does not work either in sub-make.





> export KGZIP
>
> default:
>         @env | grep GZIP
>
> $ make GZIP=test
> KGZIP=test
>
> Thanks,
> Denis



-- 
Best Regards
Masahiro Yamada
