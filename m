Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:35505 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728698AbgBQK3B (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 05:29:01 -0500
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: install is no longer PHONY?
In-Reply-To: <CAK7LNASePHZ78O6fnScU_fVHkDOKJEgT+B+OC7NPxkW+tb7q1Q@mail.gmail.com>
References: <874kvz10rx.fsf@mpe.ellerman.id.au> <CAK7LNASePHZ78O6fnScU_fVHkDOKJEgT+B+OC7NPxkW+tb7q1Q@mail.gmail.com>
Date: Mon, 17 Feb 2020 21:28:55 +1100
Message-ID: <87d0adfqxk.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> Hi Michael,
>
> On Mon, Feb 10, 2020 at 2:15 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Hi Masahiro,
>>
>> I noticed that "install" seems to be no longer PHONY, or at least if I
>> have a file/directory called install then the build doesn't run.
>>
>> eg:
>>   $ touch install
>>   $ make install
>>   make: 'install' is up to date.
>>   $ rm install
>>   $ make install
>>     LDS     arch/powerpc/boot/zImage.lds
>>     WRAP    arch/powerpc/boot/zImage.pseries
>>     WRAP    arch/powerpc/boot/zImage.epapr
>
>
> I think the reason is
> 'install' is not specified as a phony target.
>
> You can add 'PHONY += install' to fix it.
>
>
> PHONY += install    # please add this!
> install:
>         $(Q)$(MAKE) $(build)=$(boot) install
>
>
> Please do so in both arch/powerpc/Makefile and
> arch/powerpc/boot/Makefile.

Oh lol, sorry I didn't realise install was in the arch Makefile.


>> In the past the presence of an install file/directory didn't have any
>> affect.
>>
>> It seems this changed in:
>>   d79424137a73 ("kbuild: do not update config when running install targets")
>>
>> Was that expected?
>>
>> cheers
>
>
> I do not think commit is related.
>
> Prior to this commit, I still see the same issue.
>
>
> $ git checkout d7942413^
> $ touch install
> $ make -s ARCH=powerpc allnoconfig
> $ make  ARCH=powerpc install
> make: 'install' is up to date.

Hmm weird. I did bisect it:

  # bad: [d79424137a7312d381d131d707a462440c0e8df9] kbuild: do not update config when running install targets
  git bisect bad d79424137a7312d381d131d707a462440c0e8df9
  # good: [9c2af1c7377a8a6ef86e5cabf80978f3dbbb25c0] kbuild: add .DELETE_ON_ERROR special target
  git bisect good 9c2af1c7377a8a6ef86e5cabf80978f3dbbb25c0
  # first bad commit: [d79424137a7312d381d131d707a462440c0e8df9] kbuild: do not update config when running install targets

But you're right. I must have messed something up while bisecting.

Sorry for the noise.

cheers
