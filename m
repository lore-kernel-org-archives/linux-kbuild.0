Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38207 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbgBMQdF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Feb 2020 11:33:05 -0500
MIME-Version: 1.0
References: <874kvz10rx.fsf@mpe.ellerman.id.au>
In-Reply-To: <874kvz10rx.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 14 Feb 2020 01:32:13 +0900
Message-ID: <CAK7LNASePHZ78O6fnScU_fVHkDOKJEgT+B+OC7NPxkW+tb7q1Q@mail.gmail.com>
Subject: Re: install is no longer PHONY?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Michael,

On Mon, Feb 10, 2020 at 2:15 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi Masahiro,
>
> I noticed that "install" seems to be no longer PHONY, or at least if I
> have a file/directory called install then the build doesn't run.
>
> eg:
>   $ touch install
>   $ make install
>   make: 'install' is up to date.
>   $ rm install
>   $ make install
>     LDS     arch/powerpc/boot/zImage.lds
>     WRAP    arch/powerpc/boot/zImage.pseries
>     WRAP    arch/powerpc/boot/zImage.epapr


I think the reason is
'install' is not specified as a phony target.


You can add 'PHONY += install' to fix it.



PHONY += install    # please add this!
install:
        $(Q)$(MAKE) $(build)=$(boot) install


Please do so in both arch/powerpc/Makefile and
arch/powerpc/boot/Makefile.




> In the past the presence of an install file/directory didn't have any
> affect.
>
> It seems this changed in:
>   d79424137a73 ("kbuild: do not update config when running install targets")
>
> Was that expected?
>
> cheers


I do not think commit is related.

Prior to this commit, I still see the same issue.


$ git checkout d7942413^
$ touch install
$ make -s ARCH=powerpc allnoconfig
$ make  ARCH=powerpc install
make: 'install' is up to date.



-- 
Best Regards
Masahiro Yamada
