Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:50209 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751701AbdHAN3w (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 09:29:52 -0400
Message-ID: <1501594180.29303.327.camel@linux.intel.com>
Subject: Re: [PATCH v7 05/15] irqchip: New RISC-V PLIC Driver
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 01 Aug 2017 16:29:40 +0300
In-Reply-To: <20170801010009.3302-6-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com>
         <20170801010009.3302-6-palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Mon, 2017-07-31 at 17:59 -0700, Palmer Dabbelt wrote:
> This patch adds a driver for the Platform Level Interrupt Controller
> (PLIC) specified as part of the RISC-V supervisor level ISA manual.
> The PLIC connocts global interrupt sources to the local interrupt
> controller on each hart.  A PLIC is present on all RISC-V systems.
> 

> +static int plic_init(struct device_node *node, struct device_node
> *parent)
> +{
> +	struct plic_data *data;
> +	struct resource resource;
> +	int i, ok = 0;
> +	int out = -1;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (WARN_ON(!data))
> +		return -ENOMEM;
> +
> +	spin_lock_init(&data->lock);
> +
> +	data->reg = of_iomap(node, 0);
> +	if (WARN_ON(!data->reg)) {
> +		out = -EIO;
> +		goto free_data;
> +	}
> +
> +	of_property_read_u32(node, "riscv,ndev", &data->ndev);
> +	if (WARN_ON(!data->ndev)) {
> +		out = -EINVAL;
> +		goto free_reg;
> +	}
> +
> +	data->handlers = of_irq_count(node);
> +	if (WARN_ON(!data->handlers)) {
> +		out = -EINVAL;
> +		goto free_reg;
> +	}
> +
> +	data->handler =
> +		kcalloc(data->handlers, sizeof(*data->handler),
> GFP_KERNEL);
> +	if (WARN_ON(!data->handler)) {
> +		out = -ENOMEM;
> +		goto free_reg;
> +	}
> +
> +	data->domain = irq_domain_add_linear(node, data->ndev+1,
> &plic_irqdomain_ops, data);
> +	if (WARN_ON(!data->domain)) {
> +		out = -ENOMEM;
> +		goto free_handler;
> +	}
> +
> +	of_address_to_resource(node, 0, &resource);
> +	snprintf(data->name, sizeof(data->name),
> +		 "riscv,plic0,%llx", resource.start);
> +	data->chip.name = data->name;
> +	data->chip.irq_mask = plic_irq_mask;
> +	data->chip.irq_unmask = plic_irq_unmask;
> +	data->chip.irq_enable = plic_irq_enable;
> +	data->chip.irq_disable = plic_irq_disable;
> +	data->chip.irq_eoi = plic_irq_eoi;
> +
> +	for (i = 0; i < data->handlers; ++i) {
> +		struct plic_handler *handler = &data->handler[i];
> +		struct of_phandle_args parent;
> +		int parent_irq, hwirq;
> +
> +		handler->present = false;
> +
> +		if (of_irq_parse_one(node, i, &parent))
> +			continue;
> +		/* skip context holes */
> +		if (parent.args[0] == -1)
> +			continue;
> +
> +		/* skip any contexts that lead to inactive harts */
> +		if (of_device_is_compatible(parent.np, "riscv,cpu-
> intc") &&
> +		    parent.np->parent &&
> +		    riscv_of_processor_hart(parent.np->parent) < 0)
> +			continue;
> +
> +		parent_irq = irq_create_of_mapping(&parent);
> +		if (!parent_irq)
> +			continue;
> +
> +		handler->present = true;
> +		handler->contextid = i;
> +		handler->data = data;
> +		/* hwirq prio must be > this to trigger an interrupt
> */
> +		writel(0, plic_hart_threshold(data, i));
> +
> +		for (hwirq = 1; hwirq <= data->ndev; ++hwirq)
> +			plic_disable(data, i, hwirq);
> +		irq_set_chained_handler_and_data(parent_irq,
> plic_chained_handle_irq, handler);
> +		++ok;
> +	}
> +
> +	pr_info("%s: mapped %d interrupts to %d/%d handlers\n",
> +	        data->name, data->ndev, ok, data->handlers);
> +	WARN_ON(!ok);
> +	return 0;
> +
> +free_handler:
> +	kfree(data->handler);
> +free_reg:
> +	iounmap(data->reg);
> +free_data:
> +	kfree(data);
> +	return out;
> +}

Something warns me on about this function.

> +
> +IRQCHIP_DECLARE(plic0, "riscv,plic0", plic_init);

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
