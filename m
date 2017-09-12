Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34945 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751529AbdILV5x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 17:57:53 -0400
Received: by mail-pg0-f66.google.com with SMTP id j16so3646514pga.2
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2017 14:57:53 -0700 (PDT)
Subject: [PATCH v8 07/18] irqchip: RISC-V Local Interrupt Controller Driver
Date: Tue, 12 Sep 2017 14:57:04 -0700
Message-Id: <20170912215715.4186-8-palmer@dabbelt.com>
In-Reply-To: <20170912215715.4186-1-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

This patch adds a driver that manages the local interrupts on each
RISC-V hart, as specifiec by the RISC-V supervisor level ISA manual.
The local interrupt controller manages software interrupts, timer
interrupts, and hardware interrupts (which are routed via the
platform level interrupt controller).  Per-hart local interrupt
controllers are found on all RISC-V systems.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 drivers/irqchip/Kconfig          |  14 +++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-riscv-intc.c | 210 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 drivers/irqchip/irq-riscv-intc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f1fd5f44d1d4..7923d3fa8fae 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -306,3 +306,17 @@ config QCOM_IRQ_COMBINER
 	help
 	  Say yes here to add support for the IRQ combiner devices embedded
 	  in Qualcomm Technologies chips.
+
+config RISCV_INTC
+	def_bool y if RISCV
+	#bool "RISC-V Interrupt Controller"
+	depends on RISCV
+	default y
+	help
+	   This enables support for the local interrupt controller found in
+	   standard RISC-V systems.  The local interrupt controller handles
+	   timer interrupts, software interrupts, and hardware interrupts.
+	   Without a local interrupt controller the system will be unable to
+	   handle any interrupts, including those passed via the PLIC.
+
+	   If you don't know what to do here, say Y.
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index e88d856cc09c..b1aa9114afc4 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -78,3 +78,4 @@ obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
 obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
+obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
new file mode 100644
index 000000000000..d019bd3a4ae3
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -0,0 +1,210 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
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
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
+#include <linux/ftrace.h>
+#include <linux/of.h>
+#include <linux/seq_file.h>
+
+#include <asm/ptrace.h>
+#include <asm/sbi.h>
+#include <asm/smp.h>
+
+#define PTR_BITS (8 * sizeof(uintptr_t))
+
+struct riscv_irq_data {
+	struct irq_chip		chip;
+	struct irq_domain	*domain;
+	int			hart;
+	char			name[20];
+};
+DEFINE_PER_CPU(struct riscv_irq_data, riscv_irq_data);
+
+static void riscv_software_interrupt(void)
+{
+#ifdef CONFIG_SMP
+	irqreturn_t ret;
+
+	ret = handle_ipi();
+
+	WARN_ON(ret == IRQ_NONE);
+#else
+	/*
+	 * We currently only use software interrupts to pass inter-processor
+	 * interrupts, so if a non-SMP system gets a software interrupt then we
+	 * don't know what to do.
+	 */
+	pr_warning("Software Interrupt without CONFIG_SMP\n");
+#endif
+}
+
+asmlinkage void __irq_entry do_IRQ(unsigned int cause, struct pt_regs *regs)
+{
+	struct pt_regs *old_regs = set_irq_regs(regs);
+	struct irq_domain *domain;
+
+	irq_enter();
+
+	/*
+	 * There are three classes of interrupt: timer, software, and
+	 * external devices.  We dispatch between them here.  External
+	 * device interrupts use the generic IRQ mechanisms.
+	 */
+	switch (cause) {
+	case INTERRUPT_CAUSE_TIMER:
+		riscv_timer_interrupt();
+		break;
+	case INTERRUPT_CAUSE_SOFTWARE:
+		riscv_software_interrupt();
+		break;
+	default:
+		domain = per_cpu(riscv_irq_data, smp_processor_id()).domain;
+		generic_handle_irq(irq_find_mapping(domain, cause));
+		break;
+	}
+
+	irq_exit();
+	set_irq_regs(old_regs);
+}
+
+static int riscv_irqdomain_map(struct irq_domain *d, unsigned int irq,
+			       irq_hw_number_t hwirq)
+{
+	struct riscv_irq_data *data = d->host_data;
+
+	irq_set_chip_and_handler(irq, &data->chip, handle_simple_irq);
+	irq_set_chip_data(irq, data);
+	irq_set_noprobe(irq);
+	irq_set_affinity(irq, cpumask_of(data->hart));
+
+	return 0;
+}
+
+static const struct irq_domain_ops riscv_irqdomain_ops = {
+	.map	= riscv_irqdomain_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+/*
+ * On RISC-V systems local interrupts are masked or unmasked by writing the SIE
+ * (Supervisor Interrupt Enable) CSR.  As CSRs can only be written on the local
+ * hart, these functions can only be called on the hart that corresponds to the
+ * IRQ chip.  They are only called internally to this module, so they BUG_ON if
+ * this condition is violated rather than attempting to handle the error by
+ * forwarding to the target hart, as that's already expected to have been done.
+ */
+static void riscv_irq_mask(struct irq_data *d)
+{
+	struct riscv_irq_data *data = irq_data_get_irq_chip_data(d);
+
+	BUG_ON(smp_processor_id() != data->hart);
+	csr_clear(sie, 1 << (long)d->hwirq);
+}
+
+static void riscv_irq_unmask(struct irq_data *d)
+{
+	struct riscv_irq_data *data = irq_data_get_irq_chip_data(d);
+
+	BUG_ON(smp_processor_id() != data->hart);
+	csr_set(sie, 1 << (long)d->hwirq);
+}
+
+/* Callbacks for twiddling SIE on another hart. */
+static void riscv_irq_enable_helper(void *d)
+{
+	riscv_irq_unmask(d);
+}
+
+static void riscv_irq_disable_helper(void *d)
+{
+	riscv_irq_mask(d);
+}
+
+static void riscv_remote_ctrl(unsigned int cpu, void (*fn)(void *d),
+                              struct irq_data *data)
+{
+	smp_call_function_single(cpu, fn, data, true);
+}
+
+static void riscv_irq_enable(struct irq_data *d)
+{
+	struct riscv_irq_data *data = irq_data_get_irq_chip_data(d);
+
+	/*
+	 * It's only possible to write SIE on the current hart.  This jumps
+	 * over to the target hart if it's not the current one.  It's invalid
+	 * to write SIE on a hart that's not currently running.
+	 */
+	if (data->hart == smp_processor_id())
+		riscv_irq_unmask(d);
+	else if (cpu_online(data->hart))
+		riscv_remote_ctrl(data->hart, riscv_irq_enable_helper, d);
+	else
+		WARN_ON_ONCE(1);
+}
+
+static void riscv_irq_disable(struct irq_data *d)
+{
+	struct riscv_irq_data *data = irq_data_get_irq_chip_data(d);
+
+	/*
+	 * It's only possible to write SIE on the current hart.  This jumps
+	 * over to the target hart if it's not the current one.  It's invalid
+	 * to write SIE on a hart that's not currently running.
+	 */
+	if (data->hart == smp_processor_id())
+		riscv_irq_mask(d);
+	else if (cpu_online(data->hart))
+		riscv_remote_ctrl(data->hart, riscv_irq_disable_helper, d);
+	else
+		WARN_ON_ONCE(1);
+}
+
+static int riscv_intc_init(struct device_node *node, struct device_node *parent)
+{
+	int hart;
+	struct riscv_irq_data *data;
+
+	if (parent)
+		return 0;
+
+	hart = riscv_of_processor_hart(node->parent);
+	if (hart < 0)
+		return -EIO;
+
+	data = &per_cpu(riscv_irq_data, hart);
+	snprintf(data->name, sizeof(data->name), "riscv,cpu_intc,%d", hart);
+	data->hart = hart;
+	data->chip.name = data->name;
+	data->chip.irq_mask = riscv_irq_mask;
+	data->chip.irq_unmask = riscv_irq_unmask;
+	data->chip.irq_enable = riscv_irq_enable;
+	data->chip.irq_disable = riscv_irq_disable;
+	data->domain = irq_domain_add_linear(node, PTR_BITS,
+					     &riscv_irqdomain_ops, data);
+	if (!data->domain)
+		goto error_add_linear;
+	pr_info("%s: %d local interrupts mapped\n", data->name, PTR_BITS);
+	return 0;
+
+error_add_linear:
+	pr_warning("%s: unable to add IRQ domain\n",
+		   data->name);
+	return -ENXIO;
+}
+
+IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
-- 
2.13.5

