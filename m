Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36344 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752000AbdIMUSS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 16:18:18 -0400
Received: by mail-pg0-f66.google.com with SMTP id d8so587163pgt.3
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2017 13:18:18 -0700 (PDT)
Date: Wed, 13 Sep 2017 13:18:17 -0700 (PDT)
Subject: Re: RISC-V Linux Port v8
In-Reply-To: <CAK8P3a0+um1A7hM9H+4c2SBR9fvEqUDGa_=_6Jdjo7unBv3LOQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <mhng-6ceee60c-0277-4a89-9bf8-9fd875250ac4@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, dmitriy@oss-tech.org, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Wed, 13 Sep 2017 09:15:39 PDT (-0700), Arnd Bergmann wrote:
> On Tue, Sep 12, 2017 at 11:56 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> I know it may not be the ideal time to submit a patch set right now, as it's
>> the middle of the merge window, but things have calmed down quite a bit in the
>> last month so I thought it would be good to get everyone on the same page.
>> There's been a handful of changes since the last patch set, but most of them
>> are fairly minor:
>>
>> * We changed PAGE_OFFSET to allowing mapping more physical memory on 64-bit
>>   systems.  This is user configurable, as it triggers a different code model
>>   that generates slightly less efficient code.
>> * The device tree binding documentation is back, I'd managed to lose it at some
>>   point.
>> * We now pass the atomic64 test suite.
>> * The SBI timer driver has been refactored.
>>
>> To the best of by knowledge, all the feedback we've gotten so far has been
>> taken into account for this patch set.  If I've missed anyone's feedback I'm
>> sorry, just point it out and I'll try to dig it up.
>>
>> Just to be clear on timelines: we're not pushing to get into 4.14, but we are
>> hoping we can make it in for 4.15.  If I understand the process correctly, we
>> should aim to get into linux-next some time in the next month so we can be
>> merged during the next merge window.
>
> I looked at all patches again and found a few minor things that we
> should clarify, but overall I think this looks good.

Thanks!

> What I think you should do as the next step is to separate the
> architecture specific changes from the device drivers and put
> them into one branch that you ask Stephen Rothwell to add to
> linux-next.

OK.  Would it be possible to get the MAINTAINERS patch merged as part of this
merge window?  If I'm ready to actually start getting things merged I'd like to
have a proper tree and I've been told this is a prerequisite.

> For the driver patches, I would submit them separately now
> with a reduced Cc-list that just contains the respective
> subsystem maintainers as well as the relevant mailing lists.

Makes sense.  I'll wait a bit for some more feedback and if there's nothing
major then I'll split things up for the v9.

Thanks!
