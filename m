Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0087.hostedemail.com ([216.40.44.87]:46452 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751648AbdIMOrE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 10:47:04 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 939658011E55
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2017 14:39:16 +0000 (UTC)
Message-ID: <1505313545.8969.8.camel@perches.com>
Subject: Re: [PATCH v8 01/18] MAINTAINERS: Add RISC-V
From: Joe Perches <joe@perches.com>
Date: Wed, 13 Sep 2017 07:39:05 -0700
In-Reply-To: <20170912215715.4186-2-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com>
         <20170912215715.4186-2-palmer@dabbelt.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Tue, 2017-09-12 at 14:56 -0700, Palmer Dabbelt wrote:
> RISC-V needs a MAINTAINERS entry. Let's add one.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -11253,6 +11253,15 @@ S:	Maintained
>  F:	drivers/mtd/nand/r852.c
>  F:	drivers/mtd/nand/r852.h
>  
> +RISC-V ARCHITECTURE
> +M:	Palmer Dabbelt <palmer@sifive.com>
> +M:	Albert Ou <albert@sifive.com>
> +L:	patches@groups.riscv.org
> +T:	git https://github.com/riscv/riscv-linux
> +S:	Supported
> +F:	arch/riscv/
> +K:	riscv

perhaps add

N:	riscv

