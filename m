Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34354 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750825AbdIOQYo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Sep 2017 12:24:44 -0400
Received: by mail-pg0-f68.google.com with SMTP id v82so1568870pgb.1
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Sep 2017 09:24:43 -0700 (PDT)
Date: Fri, 15 Sep 2017 09:24:42 -0700 (PDT)
Subject: Re: [PATCH v8 04/18] dt-bindings: interrupt-controller: RISC-V PLIC documentation
In-Reply-To: <CABGGisxeubZsYaDdaKre5o+Bq9HrQqx-9TV7w0+g4wJxQRVmxQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <mhng-7054582d-b872-4847-ac0e-8e713a03f516@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: robh@kernel.org
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Fri, 15 Sep 2017 07:34:33 PDT (-0700), robh@kernel.org wrote:
> On Tue, Sep 12, 2017 at 4:57 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> This patch adds documentation for the platform-level interrupt
>> controller (PLIC) found in all RISC-V systems.  This interrupt
>> controller routes interrupts from all the devices in the system to each
>> hart-local interrupt controller.
>
> It has been mentioned before, but please copy the right people and
> lists. IOW, use scripts/get_maintainers.pl. You've got a whole bunch
> of people CCed and probably most don't care about DT bindings at all.

Sorry about that -- I'd just been CCing everyone on the entire patch set so
everyone's on the same page.  It was suggested we start splitting up the
patches again, so if you think it's better I can submit just the binding
patches as another patch set right now?  Then they'll only go to the people
from get_maintainers.
