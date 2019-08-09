Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53367 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405388AbfHIFP6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Aug 2019 01:15:58 -0400
Received: by mail-wm1-f68.google.com with SMTP id 10so4382108wmp.3
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Aug 2019 22:15:56 -0700 (PDT)
Date: Thu, 8 Aug 2019 22:15:52 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the
 environment
Message-ID: <20190809051552.GA44466@archlinux-threadripper>
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
 <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel@collabora.com

On Thu, Aug 08, 2019 at 03:42:32PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Thu, Aug 8, 2019 at 2:07 PM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> >
> > Only use gcc/g++ for HOSTCC, HOSTCXX and CC by default if they are not
> > already defined in the environment.  This fixes cases such as building
> > host tools with clang without having gcc installed.
> >
> > The issue was initially hit when running merge_config.sh with clang
> > only as it failed to build "HOSTCC scripts/basic/fixdep".
> 
> Thanks for the patch.  I don't quite follow the exact error.
> 
> When building with Clang, I usually do:
> 
> $ make CC=clang HOSTCC=clang ...
> 
> are you trying to fix the case where you do:
> 
> $ make CC=clang ...
> <no HOSTCC set>
> when GCC is not installed?  Because if so, I think it would be easier
> to just specify HOSTCC=clang, but maybe I'm misunderstanding the
> issue?

As I understand it,

$ make CC=clang HOSTCC=clang

works fine. What doesn't currently work is:

$ export CC=clang
$ export HOSTCC=clang
$ make

This is problematic because there is no way for CC, HOSTCC, and HOSTCXX
to be passed to make within scripts/kconfig/merge_config.sh.

A quick test before and after the patch:

$ ( export HOSTCC=clang; make -j$(nproc) O=out defconfig V=1 )
...
  gcc -Wp,-MD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes...
  gcc -Wp,-MD,scripts/kconfig/.confdata.o.d -Wall -Wmissing-prototypes...
...
$ ( export HOSTCC=clang; make -j$(nproc) O=out defconfig V=1 )
...
  clang -Wp,-MD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes...
  clang -Wp,-MD,scripts/kconfig/.confdata.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes...
...

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

I wonder if all variable should be converted to that scheme or just the
ones that are needed in this instance. I also wonder if this will cause
any issues with people who define these variables in their environment
already; if so, maybe merge_config.sh should be updated to support
passing CC, HOSTCC, and HOSTCXX to make.

Cheers,
Nathan
