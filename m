Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34550 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751670AbdHAPUb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 11:20:31 -0400
Subject: Re: [PATCH v7 05/15] irqchip: New RISC-V PLIC Driver
References: <20170801010009.3302-1-palmer@dabbelt.com>
 <20170801010009.3302-6-palmer@dabbelt.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <71a0632d-913e-d56a-037c-9990394b761f@infradead.org>
Date: Tue, 1 Aug 2017 08:20:02 -0700
MIME-Version: 1.0
In-Reply-To: <20170801010009.3302-6-palmer@dabbelt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On 07/31/2017 05:59 PM, Palmer Dabbelt wrote:
>  drivers/irqchip/Kconfig          |  13 ++
>  drivers/irqchip/Makefile         |   1 +
>  drivers/irqchip/irq-riscv-plic.c | 370 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 384 insertions(+)
>  create mode 100644 drivers/irqchip/irq-riscv-plic.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 7923d3fa8fae..ae5e27f090ec 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -307,6 +307,19 @@ config QCOM_IRQ_COMBINER
>  	  Say yes here to add support for the IRQ combiner devices embedded
>  	  in Qualcomm Technologies chips.
>  
> +config RISCV_PLIC
> +        bool "Platform-Level Interrupt Controller"
> +	depends on RISCV
> +        default y
> +        help
> +	   This enables support for the PLIC chip found in standard RISC-V
> +	   systems.  The PLIC controls devices interrupts and connects them to
> +	   each core's local interrupt controller.  Aside from timer and
> +	   software interrupts, all other interrupt sources (MSI, GPIO, etc)
> +	   are subordinate to the PLIC.
> +
> +	   If you don't know what to do here, say Y.
> +
Please use tabs instead of spaces for indenting ("help", "default y", and "bool...").

-- 
~Randy
