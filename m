Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30953 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730425AbgCaJt7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 05:49:59 -0400
MIME-Version: 1.0
References: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
In-Reply-To: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 31 Mar 2020 18:49:19 +0900
Message-ID: <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com>
Subject: Re: single target builds are broken
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 31, 2020 at 6:16 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
>
> Hi,
>
> I often run 'make foo/bar.o' as part of my workflow, even when bar.o is
> not specified in any kernel makefile, and this has worked just fine for
> years.
>
> This is broken after commit 394053f4a4b3e3eeeaa67b67fc886a9a75bd9e4d
> (kbuild: make single targets work more correctly) and just gives an error:
>
> $ make kernel/test.o
>    CALL    scripts/checksyscalls.sh
>    CALL    scripts/atomic/check-atomics.sh
>    DESCEND  objtool
> make[2]: *** No rule to make target 'kernel/test.o'.  Stop.
> scripts/Makefile.build:502: recipe for target '__build' failed
> make[1]: *** [__build] Error 2
> Makefile:1670: recipe for target 'kernel' failed
> make: *** [kernel] Error 2


This is intentional to make the single target builds
work in the same manner as the normal builds.


The necessary CONFIG dependency must be met.

obj-$(CONFIG_FOO) += foo.o

foo.o can be built only when CONFIG_FOO is y/m.



> For top-level objects (e.g. 'make bar.o') the situation is even worse,
> since make exits with status 0 without building anything :-/


There is no .c or .S file at the top-level of the kernel source tree.

'make bar.o' never happens.



> Is there any chance we can get this back? It was super useful for me.


What you want is "Let's build whatever", right?

No, please add 'obj-y += test.o' if you want to
test your local file.


-- 
Best Regards
Masahiro Yamada
