Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34794 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751295AbdHAPfd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 11:35:33 -0400
Subject: Re: [PATCH v7 04/15] irqchip: RISC-V Local Interrupt Controller
 Driver
References: <20170801010009.3302-1-palmer@dabbelt.com>
 <20170801010009.3302-5-palmer@dabbelt.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ffef3600-06bf-9f52-afa6-fbce55b0539c@infradead.org>
Date: Tue, 1 Aug 2017 08:35:22 -0700
MIME-Version: 1.0
In-Reply-To: <20170801010009.3302-5-palmer@dabbelt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On 07/31/2017 05:59 PM, Palmer Dabbelt wrote:
> This patch adds a driver that manages the local interrupts on each
> RISC-V hart, as specifiec by the RISC-V supervisor level ISA manual.
> The local interrupt controller manages software interrupts, timer
> interrupts, and hardware interrupts (which are routed via the
> platform level interrupt controller).  Per-hart local interrupt
> controllers are found on all RISC-V systems.
> 
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  drivers/irqchip/Kconfig          |  14 +++
>  drivers/irqchip/Makefile         |   1 +
>  drivers/irqchip/irq-riscv-intc.c | 213 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 228 insertions(+)
>  create mode 100644 drivers/irqchip/irq-riscv-intc.c

> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> new file mode 100644
> index 000000000000..96ae020cf1d5
> --- /dev/null
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -0,0 +1,213 @@
> +/*
[]

> +
> +error_add_linear:
> +	pr_warning("%s: unable to add IRQ domain\n",
> +		   data->name);
> +	return -(ENXIO);
> +

  Why the parentheses around ENXIO? Is it some macro calculation?
  Otherwise just use
	return -ENXIO;
  and drop the following blank line.

> +}
> +
> +IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> 


-- 
~Randy
