Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35088 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751973AbdIMPzG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 11:55:06 -0400
Received: by mail-pg0-f67.google.com with SMTP id j16so292696pga.2
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2017 08:55:05 -0700 (PDT)
Date: Wed, 13 Sep 2017 08:55:04 -0700 (PDT)
Subject: Re: [PATCH v8 01/18] MAINTAINERS: Add RISC-V
In-Reply-To: <1505313545.8969.8.camel@perches.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <mhng-dbc86b93-64b8-44af-86e3-0bbe8f9f121e@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: joe@perches.com
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Wed, 13 Sep 2017 07:39:05 PDT (-0700), joe@perches.com wrote:
> On Tue, 2017-09-12 at 14:56 -0700, Palmer Dabbelt wrote:
>> RISC-V needs a MAINTAINERS entry. Let's add one.
> []
>> diff --git a/MAINTAINERS b/MAINTAINERS
> []
>> @@ -11253,6 +11253,15 @@ S:	Maintained
>>  F:	drivers/mtd/nand/r852.c
>>  F:	drivers/mtd/nand/r852.h
>>
>> +RISC-V ARCHITECTURE
>> +M:	Palmer Dabbelt <palmer@sifive.com>
>> +M:	Albert Ou <albert@sifive.com>
>> +L:	patches@groups.riscv.org
>> +T:	git https://github.com/riscv/riscv-linux
>> +S:	Supported
>> +F:	arch/riscv/
>> +K:	riscv
>
> perhaps add
>
> N:	riscv

OK.  I'm assuming we'll submit a v9 that's based on linux-next, so I'll just
squash this in.

diff --git a/MAINTAINERS b/MAINTAINERS
index d5d70a1318d5..a84ebf12356f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11261,6 +11261,7 @@ T:      git https://github.com/riscv/riscv-linux
 S:     Supported
 F:     arch/riscv/
 K:     riscv
+N:     riscv

 ROCCAT DRIVERS
 M:     Stefan Achatz <erazor_de@users.sourceforge.net>
