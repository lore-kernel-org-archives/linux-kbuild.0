Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34246 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751093AbdIMRBu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 13:01:50 -0400
Received: by mail-pf0-f195.google.com with SMTP id g65so323739pfe.1
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2017 10:01:49 -0700 (PDT)
Date: Wed, 13 Sep 2017 10:01:46 -0700 (PDT)
Subject: Re: [patches] Re: [PATCH v8 11/18] RISC-V: Atomic and Locking Code
In-Reply-To: <CAK8P3a2Us_Q8-OxSTKnpYbvzXvZkNrErdmxVkSJaQvQmQPryfw@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <mhng-31437315-8417-4331-8a57-da9e3c16c517@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, dmitriy@oss-tech.org, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Wed, 13 Sep 2017 08:28:30 PDT (-0700), Arnd Bergmann wrote:
> On Tue, Sep 12, 2017 at 11:57 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> This contains all the code that directly interfaces with the RISC-V
>> memory model.  While this code corforms to the current RISC-V ISA
>> specifications (user 2.2 and priv 1.10), the memory model is somewhat
>> underspecified in those documents.  There is a working group that hopes
>> to produce a formal memory model by the end of the year, but my
>> understanding is that the basic definitions we're relying on here won't
>> change significantly.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>
> I've read through the current definition of the I/O accessors again, as we
> discussed those before, and this version looks good to me. I've also
> looked briefly at the other helpers in this patch and found nothing
> surprising in there, so feel free to add
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> to the patch.

Thanks for all your time!
