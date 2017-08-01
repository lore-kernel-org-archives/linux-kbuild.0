Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:37053 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751865AbdHABAu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Jul 2017 21:00:50 -0400
Received: by mail-pf0-f196.google.com with SMTP id 72so244219pfl.4
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Jul 2017 18:00:50 -0700 (PDT)
Subject: [PATCH v7 05/15] irqchip: New RISC-V PLIC Driver
Date: Mon, 31 Jul 2017 17:59:59 -0700
Message-Id: <20170801010009.3302-6-palmer@dabbelt.com>
In-Reply-To: <20170801010009.3302-1-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

This patch adds a driver for the Platform Level Interrupt Controller
(PLIC) specified as part of the RISC-V supervisor level ISA manual.
The PLIC connocts global interrupt sources to the local interrupt
controller on each hart.  A PLIC is present on all RISC-V systems.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 drivers/irqchip/Kconfig          |  13 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-riscv-plic.c | 370 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 384 insertions(+)
 create mode 100644 drivers/irqchip/irq-riscv-plic.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 7923d3fa8fae..ae5e27f090ec 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -307,6 +307,19 @@ config QCOM_IRQ_COMBINER
 	  Say yes here to add support for the IRQ combiner devices embedded
 	  in Qualcomm Technologies chips.
 
+config RISCV_PLIC
+        bool "Platform-Level Interrupt Controller"
+	depends on RISCV
+        default y
+        help
+	   This enables support for the PLIC chip found in standard RISC-V
+	   systems.  The PLIC controls devices interrupts and connects them to
+	   each core's local interrupt controller.  Aside from timer and
+	   software interrupts, all other interrupt sources (MSI, GPIO, etc)
+	   are subordinate to the PLIC.
+
+	   If you don't know what to do here, say Y.
+
 config RISCV_INTC
 	def_bool y if RISCV
 	#bool "RISC-V Interrupt Controller"
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index b1aa9114afc4..7880c9cec40e 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -78,4 +78,5 @@ obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
 obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
+obj-$(CONFIG_RISCV_PLIC)		+= irq-riscv-plic.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
diff --git a/drivers/irqchip/irq-riscv-plic.c b/drivers/irqchip/irq-riscv-plic.c
new file mode 100644
index 000000000000..e326f239eea7
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-plic.c
@@ -0,0 +1,370 @@
+/*
+ * Copyright (C) 2017 SiFive
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+/*
+ * From the RISC-V Privlidged Spec v1.10:
+ *
+ * Global interrupt sources are assigned small unsigned integer identifiers,
+ * beginning at the value 1.  An interrupt ID of 0 is reserved to mean “no
+ * interrupt”.  Interrupt identifiers are also used to break ties when two or
+ * more interrupt sources have the same assigned priority. Smaller values of
+ * interrupt ID take precedence over larger values of interrupt ID.
+ *
+ * While the RISC-V supervisor spec doesn't define the maximum number of
+ * devices supported by the PLIC, the largest number supported by devices
+ * marked as 'riscv,plic0' (which is the only device type this driver supports,
+ * and is the only extant PLIC as of now) is 1024.  As mentioned above, device
+ * 0 is defined to be non-existant so this device really only supports 1023
+ * devices.
+ */
+#define MAX_DEVICES	1024
+#define MAX_CONTEXTS	15872
+
+/*
+ * The PLIC consists of memory-mapped control registers, with a memory map as
+ * follows:
+ *
+ * base + 0x000000: Reserved (interrupt source 0 does not exist)
+ * base + 0x000004: Interrupt source 1 priority
+ * base + 0x000008: Interrupt source 2 priority
+ * ...
+ * base + 0x000FFC: Interrupt source 1023 priority
+ * base + 0x001000: Pending 0
+ * base + 0x001FFF: Pending
+ * base + 0x002000: Enable bits for sources 0-31 on context 0
+ * base + 0x002004: Enable bits for sources 32-63 on context 0
+ * ...
+ * base + 0x0020FC: Enable bits for sources 992-1023 on context 0
+ * base + 0x002080: Enable bits for sources 0-31 on context 1
+ * ...
+ * base + 0x002100: Enable bits for sources 0-31 on context 2
+ * ...
+ * base + 0x1F1F80: Enable bits for sources 992-1023 on context 15871
+ * base + 0x1F1F84: Reserved
+ * ...              (higher context IDs would fit here, but wouldn't fit
+ *                   inside the per-context priority vector)
+ * base + 0x1FFFFC: Reserved
+ * base + 0x200000: Priority threshold for context 0
+ * base + 0x200004: Claim/complete for context 0
+ * base + 0x200008: Reserved
+ * ...
+ * base + 0x200FFC: Reserved
+ * base + 0x201000: Priority threshold for context 1
+ * base + 0x201004: Claim/complete for context 1
+ * ...
+ * base + 0xFFE000: Priority threshold for context 15871
+ * base + 0xFFE004: Claim/complete for context 15871
+ * base + 0xFFF008: Reserved
+ * ...
+ * base + 0xFFFFFC: Reserved
+ */
+
+/* Each interrupt source has a priority register associated with it. */
+#define PRIORITY_BASE		0
+#define PRIORITY_PER_ID		4
+
+/*
+ * Each hart context has a vector of interupt enable bits associated with it.
+ * There's one bit for each interrupt source. */
+#define ENABLE_BASE		0x2000
+#define ENABLE_PER_HART		0x80
+
+/*
+ * Each hart context has a set of control registers associated with it.  Right
+ * now there's only two: a source priority threshold over which the hart will
+ * take an interrupt, and a register to claim interrupts.
+ */
+#define CONTEXT_BASE		0x200000
+#define CONTEXT_PER_HART	0x1000
+#define CONTEXT_THRESHOLD	0
+#define CONTEXT_CLAIM		4
+
+/*
+ * PLIC devices are named like 'riscv,plic0,%llx', this is enough space to
+ * store that name.
+ */
+#define PLIC_DATA_NAME_SIZE 30
+
+struct plic_handler {
+	bool			present;
+	int			contextid;
+	struct plic_data	*data;
+};
+
+struct plic_data {
+	struct irq_chip		chip;
+	struct irq_domain	*domain;
+	u32			ndev;
+	void __iomem		*reg;
+	int			handlers;
+	struct plic_handler	*handler;
+	char			name[PLIC_DATA_NAME_SIZE];
+	spinlock_t		lock;
+};
+
+/* Addressing helper functions. */
+static inline
+void __iomem *plic_enable_vector(struct plic_data *data, int contextid)
+{
+	return data->reg + ENABLE_BASE + contextid * ENABLE_PER_HART;
+}
+
+static inline
+void __iomem *plic_priority(struct plic_data *data, int hwirq)
+{
+	return data->reg + PRIORITY_BASE + hwirq * PRIORITY_PER_ID;
+}
+
+static inline
+void __iomem *plic_hart_threshold(struct plic_data *data, int contextid)
+{
+	return data->reg + CONTEXT_BASE + CONTEXT_PER_HART * contextid + CONTEXT_THRESHOLD;
+}
+
+static inline
+void __iomem *plic_hart_claim(struct plic_data *data, int contextid)
+{
+	return data->reg + CONTEXT_BASE + CONTEXT_PER_HART * contextid + CONTEXT_CLAIM;
+}
+
+/*
+ * Handling an interrupt is a two-step process: first you claim the interrupt
+ * by reading the claim register, then you complete the interrupt by writing
+ * that source ID back to the same claim register.  This automatically enables
+ * and disables the interrupt, so there's nothing else to do.
+ */
+static inline
+u32 plic_claim(struct plic_data *data, int contextid)
+{
+	return readl(plic_hart_claim(data, contextid));
+}
+
+static inline
+void plic_complete(struct plic_data *data, int contextid, u32 claim)
+{
+	writel(claim, plic_hart_claim(data, contextid));
+}
+
+/* Explicit interrupt masking. */
+static void plic_disable(struct plic_data *data, int contextid, int hwirq)
+{
+	void __iomem *reg = plic_enable_vector(data, contextid) + (hwirq / 32);
+	u32 mask = ~(1 << (hwirq % 32));
+
+	spin_lock(&data->lock);
+	writel(readl(reg) & mask, reg);
+	spin_unlock(&data->lock);
+}
+
+static void plic_enable(struct plic_data *data, int contextid, int hwirq)
+{
+	void __iomem *reg = plic_enable_vector(data, contextid) + (hwirq / 32);
+	u32 bit = 1 << (hwirq % 32);
+
+	spin_lock(&data->lock);
+	writel(readl(reg) | bit, reg);
+	spin_unlock(&data->lock);
+}
+
+/*
+ * There is no need to mask/unmask PLIC interrupts
+ * They are "masked" by reading claim and "unmasked" when writing it back.
+ */
+static void plic_irq_mask(struct irq_data *d) { }
+static void plic_irq_unmask(struct irq_data *d) { }
+
+static void plic_irq_enable(struct irq_data *d)
+{
+	struct plic_data *data = irq_data_get_irq_chip_data(d);
+	void __iomem *priority = plic_priority(data, d->hwirq);
+	int i;
+
+	writel(1, priority);
+	for (i = 0; i < data->handlers; ++i)
+		if (data->handler[i].present)
+			plic_enable(data, i, d->hwirq);
+}
+
+static void plic_irq_disable(struct irq_data *d)
+{
+	struct plic_data *data = irq_data_get_irq_chip_data(d);
+	void __iomem *priority = plic_priority(data, d->hwirq);
+	int i;
+
+	writel(0, priority);
+	for (i = 0; i < data->handlers; ++i)
+		if (data->handler[i].present)
+			plic_disable(data, i, d->hwirq);
+}
+
+static void plic_irq_eoi(struct irq_data *d)
+{
+	struct plic_handler *handler = d->common->handler_data;
+	plic_complete(handler->data, handler->contextid, d->hwirq);
+}
+
+static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
+			      irq_hw_number_t hwirq)
+{
+	struct plic_data *data = d->host_data;
+
+	irq_set_chip_and_handler(irq, &data->chip, handle_fasteoi_irq);
+	irq_set_chip_data(irq, data);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops plic_irqdomain_ops = {
+	.map	= plic_irqdomain_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static void plic_chained_handle_irq(struct irq_desc *desc)
+{
+	struct plic_handler *handler = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_domain *domain = handler->data->domain;
+	u32 what;
+
+	chained_irq_enter(chip, desc);
+
+	while ((what = plic_claim(handler->data, handler->contextid))) {
+		int irq = irq_find_mapping(domain, what);
+
+		if (irq > 0)
+			generic_handle_irq(irq);
+		else
+			handle_bad_irq(desc);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int plic_init(struct device_node *node, struct device_node *parent)
+{
+	struct plic_data *data;
+	struct resource resource;
+	int i, ok = 0;
+	int out = -1;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (WARN_ON(!data))
+		return -ENOMEM;
+
+	spin_lock_init(&data->lock);
+
+	data->reg = of_iomap(node, 0);
+	if (WARN_ON(!data->reg)) {
+		out = -EIO;
+		goto free_data;
+	}
+
+	of_property_read_u32(node, "riscv,ndev", &data->ndev);
+	if (WARN_ON(!data->ndev)) {
+		out = -EINVAL;
+		goto free_reg;
+	}
+
+	data->handlers = of_irq_count(node);
+	if (WARN_ON(!data->handlers)) {
+		out = -EINVAL;
+		goto free_reg;
+	}
+
+	data->handler =
+		kcalloc(data->handlers, sizeof(*data->handler), GFP_KERNEL);
+	if (WARN_ON(!data->handler)) {
+		out = -ENOMEM;
+		goto free_reg;
+	}
+
+	data->domain = irq_domain_add_linear(node, data->ndev+1, &plic_irqdomain_ops, data);
+	if (WARN_ON(!data->domain)) {
+		out = -ENOMEM;
+		goto free_handler;
+	}
+
+	of_address_to_resource(node, 0, &resource);
+	snprintf(data->name, sizeof(data->name),
+		 "riscv,plic0,%llx", resource.start);
+	data->chip.name = data->name;
+	data->chip.irq_mask = plic_irq_mask;
+	data->chip.irq_unmask = plic_irq_unmask;
+	data->chip.irq_enable = plic_irq_enable;
+	data->chip.irq_disable = plic_irq_disable;
+	data->chip.irq_eoi = plic_irq_eoi;
+
+	for (i = 0; i < data->handlers; ++i) {
+		struct plic_handler *handler = &data->handler[i];
+		struct of_phandle_args parent;
+		int parent_irq, hwirq;
+
+		handler->present = false;
+
+		if (of_irq_parse_one(node, i, &parent))
+			continue;
+		/* skip context holes */
+		if (parent.args[0] == -1)
+			continue;
+
+		/* skip any contexts that lead to inactive harts */
+		if (of_device_is_compatible(parent.np, "riscv,cpu-intc") &&
+		    parent.np->parent &&
+		    riscv_of_processor_hart(parent.np->parent) < 0)
+			continue;
+
+		parent_irq = irq_create_of_mapping(&parent);
+		if (!parent_irq)
+			continue;
+
+		handler->present = true;
+		handler->contextid = i;
+		handler->data = data;
+		/* hwirq prio must be > this to trigger an interrupt */
+		writel(0, plic_hart_threshold(data, i));
+
+		for (hwirq = 1; hwirq <= data->ndev; ++hwirq)
+			plic_disable(data, i, hwirq);
+		irq_set_chained_handler_and_data(parent_irq, plic_chained_handle_irq, handler);
+		++ok;
+	}
+
+	pr_info("%s: mapped %d interrupts to %d/%d handlers\n",
+	        data->name, data->ndev, ok, data->handlers);
+	WARN_ON(!ok);
+	return 0;
+
+free_handler:
+	kfree(data->handler);
+free_reg:
+	iounmap(data->reg);
+free_data:
+	kfree(data);
+	return out;
+}
+
+IRQCHIP_DECLARE(plic0, "riscv,plic0", plic_init);
-- 
2.13.0

