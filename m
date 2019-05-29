Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:62786 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfE2BNZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 May 2019 21:13:25 -0400
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x4T1DEj4010106
        for <linux-kbuild@vger.kernel.org>; Wed, 29 May 2019 10:13:14 +0900
Received: by mail-ua1-f51.google.com with SMTP id 7so230785uah.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2019 18:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190528121148.GA18162@lst.de>
In-Reply-To: <20190528121148.GA18162@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 29 May 2019 10:12:37 +0900
Message-ID: <CAK7LNAQRW+phJrdR-5NfUE9L09O-nRiimfW5rB8Y8S9POtkxCA@mail.gmail.com>
Subject: Re: building individual files in subdirectories
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, May 28, 2019 at 9:12 PM Christoph Hellwig <hch@lst.de> wrote:
>
> A few kernel modules have source files in multiple subdirectories.
> Trying to build just a single object of a source file in such a
> subdirectory currently doesn't work.
>
> For example:
>
> hch@brick:~/work/xfs$ make fs/xfs/libxfs/xfs_alloc.o
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   DESCEND  objtool
> scripts/Makefile.build:42: fs/xfs/libxfs/Makefile: No such file or directory
> make[1]: *** No rule to make target 'fs/xfs/libxfs/Makefile'.  Stop.
> make: *** [Makefile:1747: fs/xfs/libxfs/xfs_alloc.o] Error 2
>
> Is there any reasonably easy way to get this to work?


While single targets are useful,
they never work correctly.
subdir-ccflags-y from upper Makefiles
are not inherited.

I want to implement single targets correctly, but
I have never got around to it.

"make fs/xfs/" is an alternative solution
although it will compile much more than you want.

Another solution is to put a dummy
fs/xfs/libxfs/Makefile

-- 
Best Regards
Masahiro Yamada
