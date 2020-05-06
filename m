Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59652 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgEFOiZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 10:38:25 -0400
MIME-Version: 1.0
References: <cd20b888-7f3d-e7ff-8096-2cc8305a5107@gmail.com>
In-Reply-To: <cd20b888-7f3d-e7ff-8096-2cc8305a5107@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 May 2020 23:37:34 +0900
Message-ID: <CAK7LNAR5TsnUn2n2nDFHywQyqCT7si840yE2nyuxx70AYj+nDQ@mail.gmail.com>
Subject: Re: Proper use for linking foo.o_shipped after 69ea912fda74 ("kbuild:
 remove unneeded link_multi_deps")?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Wed, May 6, 2020 at 1:45 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> Hi Masahiro, Michal,
>
> While updating our systems from 4.9 to 5.4, we noticed that one of the
> kernel modules that we build, which is done by linking an object that we
> pre-compile out of Kbuild stopped working.
>
> I bisected it down to:
>
> commit 69ea912fda74a673d330d23595385e5b73e3a2b9 (refs/bisect/bad)
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date:   Thu Oct 4 13:25:19 2018 +0900
>
>     kbuild: remove unneeded link_multi_deps
>
>     Since commit c8589d1e9e01 ("kbuild: handle multi-objs dependency
>     appropriately"), $^ really represents all the prerequisite of the
>     composite object being built.
>
>     Hence, $(filter %.o,$^) contains all the objects to link together,
>     which is much simpler than link_multi_deps calculation.
>
>     Please note $(filter-out FORCE,$^) does not work here. When a single
>     object module is turned into a multi object module, $^ will contain
>     header files that were previously included for building the single
>     object, and recorded in the .*.cmd file. To filter out such headers,
>     $(filter %.o,$^) should be used here.
>
>     Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> and the linker now fails with the following:
>
> mkdir -p /home/florian/dev/lkm/.tmp_versions ; rm -f
> /home/florian/dev/lkm/.tmp_versions/*
>
>   WARNING: Symbol version dump ./Module.symvers
>            is missing; modules will have no dependencies and modversions.
>
> make -f ./scripts/Makefile.build obj=/home/florian/dev/lkm
> (cat /dev/null;   echo kernel//home/florian/dev/lkm/hello.ko;) >
> /home/florian/dev/lkm/modules.order
>   ld -m elf_x86_64  -z max-page-size=0x200000    -r -o
> /home/florian/dev/lkm/hello.o
> ld: no input files
> make[1]: *** [scripts/Makefile.build:492: /home/florian/dev/lkm/hello.o]
> Error 1
> make: *** [Makefile:1530: _module_/home/florian/dev/lkm] Error 2
>
> and here are some steps to reproduce this:
>
> Kbuild:
> obj-m   := hello.o
> hello-y := test.o_shipped
>
> test.c can be a simple hello world, and you can compile it using a
> standard Kbuild file first, and then move test.o as test.o_shipped.



Why don't you do like this?

obj-m   := hello.o
hello-y := test.o










> I am afraid I do not speak Kbuild fluently enough to recommend a fix for
> that.
>
> Thanks!
> --
> Florian



-- 
Best Regards
Masahiro Yamada
