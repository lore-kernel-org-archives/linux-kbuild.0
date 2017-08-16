Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:58814 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751575AbdHPPOc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Aug 2017 11:14:32 -0400
Date: Wed, 16 Aug 2017 17:12:18 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 04/15] irqchip: RISC-V Local Interrupt Controller
 Driver
In-Reply-To: <20170801010009.3302-5-palmer@dabbelt.com>
Message-ID: <alpine.DEB.2.20.1708161702350.1987@nanos>
References: <20170801010009.3302-1-palmer@dabbelt.com> <20170801010009.3302-5-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: peterz@infradead.org, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Mon, 31 Jul 2017, Palmer Dabbelt wrote:
> +static void riscv_software_interrupt(void)
> +{
> +#ifdef CONFIG_SMP
> +	irqreturn_t ret;
> +
> +	ret = handle_ipi();
> +
> +	WARN_ON(ret == IRQ_NONE);

  	WARN_ON(handle_ipi() == IRQ_NONE);

perhaps?

> +#else
> +	/*
> +	 * We currently only use software interrupts to pass inter-processor
> +	 * interrupts, so if a non-SMP system gets a software interrupt then we
> +	 * don't know what to do.
> +	 */
> +	pr_warning("Software Interrupt without CONFIG_SMP\n");
> +#endif
> +}


> +static void riscv_irq_enable(struct irq_data *d)
> +{
> +	struct riscv_irq_data *data = irq_data_get_irq_chip_data(d);
> +
> +	/*
> +	 * It's only possible to write SIE on the current hart.  This jumps
> +	 * over to the target hart if it's not the current one.  It's invalid
> +	 * to write SIE on a hart that's not currently running.
> +	 */
> +	if (data->hart == smp_processor_id())
> +		riscv_irq_unmask(d);
> +	else if (cpu_online(data->hart))
> +		smp_call_function_single(data->hart,
> +					 riscv_irq_enable_helper,
> +					 d,
> +					 true);
> +	else
> +		WARN_ON_ONCE(1);

If you write a small helper:

static void riscv_remote_ctrl(unsigned int cpu, void (*fn)(void *d),
       	    		      struct irq_data *data)
{
	smp_call_function_single(cpu, cb, data, true);
}

Then both riscv_irq_enable() and riscv_irq_disable() become readable
functions.

	if (data->hart == smp_processor_id())
		riscv_irq_unmask(d);
	else if (cpu_online(data->hart))
	     	riscv_remote_ctrl(data->hart, riscv_irq_enable_helper, d);
	else
		WARN_ON_ONCE(1);

Hmm?

> +static int riscv_intc_init(struct device_node *node, struct device_node *parent)
> +{
> +	int hart;
> +	struct riscv_irq_data *data;
> +
> +	if (parent)
> +		return 0;
> +
> +	hart = riscv_of_processor_hart(node->parent);
> +	if (hart < 0)
> +		return -EIO;
> +
> +	data = &per_cpu(riscv_irq_data, hart);
> +	snprintf(data->name, sizeof(data->name), "riscv,cpu_intc,%d", hart);
> +	data->hart = hart;
> +	data->chip.name = data->name;
> +	data->chip.irq_mask = riscv_irq_mask;
> +	data->chip.irq_unmask = riscv_irq_unmask;
> +	data->chip.irq_enable = riscv_irq_enable;
> +	data->chip.irq_disable = riscv_irq_disable;
> +	data->domain = irq_domain_add_linear(
> +		node,
> +		8*sizeof(uintptr_t),
> +		&riscv_irqdomain_ops,
> +		data);

This is really horrible to read. What's wrong with using the full 80 chars?

	data->domain = irq_domain_add_linear(node, 8 * sizeof(uintptr_t),
					     &riscv_irqdomain_ops, data);

> +	if (!data->domain)
> +		goto error_add_linear;
> +	pr_info("%s: %d local interrupts mapped\n",
> +	        data->name, 8*(int)sizeof(uintptr_t));

Can we please make that '8 * sizeof()' a constant and use it in both
places? Which makes the pr_info also fit into a single line.

> +	return 0;
> +
> +error_add_linear:
> +	pr_warning("%s: unable to add IRQ domain\n",
> +		   data->name);

Single line please. Enough room.

> +	return -(ENXIO);

No braces.

Thanks,

	tglx
