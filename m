Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38225 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgEOJkK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 May 2020 05:40:10 -0400
References: <20200514131234.380097-1-efremov@linux.com>
 <CAK7LNASRv9E-pfYCRmD-RstKhW+WgfHKrn+7bP_dAAkyKaoPGg@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Subject: Re: [RFC PATCH] kbuild: add variables for compression tools
Message-ID: <e26a1565-e770-0e5e-c730-60cc6fa16a4f@linux.com>
Date: Fri, 15 May 2020 12:40:04 +0300
MIME-Version: 1.0
In-Reply-To: <CAK7LNASRv9E-pfYCRmD-RstKhW+WgfHKrn+7bP_dAAkyKaoPGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Vyukov <dvyukov@google.com>

It seems that I missed a couple of tar commands in the patch:
scripts/Makefile.package
scripts/package/buildtar

On 5/15/20 5:20 AM, Masahiro Yamada wrote:
> On Thu, May 14, 2020 at 10:14 PM Denis Efremov <efremov@linux.com> wrote:
>>
> 
> commit 5054e88a7934d5ff5ec14231c8b8676161bb45fa
> Author: Paul Eggert <eggert@cs.ucla.edu>
> Date:   Mon Mar 16 14:25:17 2015 -0700
> 
>     gzip: make the GZIP env var obsolescent

Other implementations can depend on this.
pigz still parses GZIP env var:
https://github.com/madler/pigz/blob/master/pigz.c#L4346

> 
> Some possible options I came up with:
> 
> 
> [1] Use KGZIP for now, but BZIP2, XZ, etc. for the others.
> 
>     (Then, rename KGZIP to GZIP when the time comes)
> 
> 
> [2] Do not take this patch
> 
>     The whole build process is parallelized
>     by 'make -j $(nproc)'.
> 
>     If you are still eager to use pigz instead gzip,
>     use a symbolic link or a wrapper shell script.
> 
>     $ ln -s /usr/bin/pigz  /$HOME/bin/gzip
>     $ PATH="$HOME/bin:$PATH"
> 

[3] GZIP at frontend, KGZIP or _GZIP internally? Something like:

$ cat Makefile
GZIP=gzip
override KGZIP=$(GZIP) # optional overrdide. Used to force GZIP value
                       # in case: make KGZIP=test

unexport GZIP
export KGZIP

default:
	@env | grep GZIP

$ make GZIP=test
KGZIP=test

Thanks,
Denis
