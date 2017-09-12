Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:32874 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751519AbdILV5w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 17:57:52 -0400
Received: by mail-pg0-f68.google.com with SMTP id i130so4741848pgc.0
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2017 14:57:51 -0700 (PDT)
Subject: [PATCH v8 06/18] clocksource: New RISC-V SBI timer driver
Date: Tue, 12 Sep 2017 14:57:03 -0700
Message-Id: <20170912215715.4186-7-palmer@dabbelt.com>
In-Reply-To: <20170912215715.4186-1-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

The RISC-V ISA defines a per-hart real-time clock and timer, which is
present on all systems.  The clock is accessed via the 'rdtime'
pseudo-instruction (which reads a CSR), and the timer is set via an SBI
call.

This driver attempts to split out the RISC-V ISA specific mechanisms of
accessing the hardware from the clocksource driver by taking a pair of
function pointers to issue the actual RISC-V specific instructions.

Signed-off-by: Dmitriy Cherkasov <dmitriy@oss-tech.org>
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 drivers/clocksource/Kconfig       |  8 ++++++
 drivers/clocksource/Makefile      |  1 +
 drivers/clocksource/riscv_timer.c | 58 +++++++++++++++++++++++++++++++++++++++
 include/linux/timer_riscv.h       | 34 +++++++++++++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 drivers/clocksource/riscv_timer.c
 create mode 100644 include/linux/timer_riscv.h

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 54a67f8a28eb..aae9543cef68 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -607,4 +607,12 @@ config CLKSRC_ST_LPC
 	  Enable this option to use the Low Power controller timer
 	  as clocksource.
 
+config RISCV_TIMER
+	bool "Timer for the RISC-V platform" if COMPILE_TEST
+	depends on RISCV
+	help
+	  This enables the per-hart timer built into all RISC-V systems, which
+	  is accessed via both the SBI and the rdcycle instruction.  This is
+	  required for all RISC-V systems.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 6df949402dfc..20d75b3f22e4 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -73,3 +73,4 @@ obj-$(CONFIG_H8300_TMR16)		+= h8300_timer16.o
 obj-$(CONFIG_H8300_TPU)			+= h8300_tpu.o
 obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
 obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
+obj-$(CONFIG_RISCV_TIMER)		+= riscv_timer.o
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
new file mode 100644
index 000000000000..bbdee730240a
--- /dev/null
+++ b/drivers/clocksource/riscv_timer.c
@@ -0,0 +1,58 @@
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
+#include <linux/clocksource.h>
+#include <linux/clockchips.h>
+#include <linux/delay.h>
+#include <linux/timer_riscv.h>
+
+#define MINDELTA 100
+#define MAXDELTA 0x7fffffff
+
+/*
+ * See <linux/timer_riscv.h> for the rationale behind pre-allocating per-cpu
+ * timers on RISC-V systems.
+ */
+DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
+	.name           = "riscv_timer_clockevent",
+	.features       = CLOCK_EVT_FEAT_ONESHOT,
+	.rating         = 300,
+	.set_state_oneshot  = NULL,
+	.set_state_shutdown = NULL,
+};
+
+static struct clocksource cs = {
+	.name = "riscv_clocksource",
+	.rating = 300,
+	.mask = CLOCKSOURCE_MASK(BITS_PER_LONG),
+	.flags = CLOCK_SOURCE_IS_CONTINUOUS,
+};
+
+void clocksource_riscv_init(unsigned long long (*rdtime)(struct clocksource *))
+{
+	cs.read = rdtime;
+	clocksource_register_hz(&cs, riscv_timebase);
+}
+
+void timer_riscv_init(int cpu_id,
+		      unsigned long riscv_timebase,
+		      int (*next)(unsigned long, struct clock_event_device*))
+{
+	struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu_id);
+
+	ce->cpumask = cpumask_of(cpu_id);
+	ce->set_next_event = next;
+
+	clockevents_config_and_register(ce, riscv_timebase, MINDELTA, MAXDELTA);
+}
diff --git a/include/linux/timer_riscv.h b/include/linux/timer_riscv.h
new file mode 100644
index 000000000000..599358177d1b
--- /dev/null
+++ b/include/linux/timer_riscv.h
@@ -0,0 +1,34 @@
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
+#ifndef _LINUX_TIMER_RISCV_H
+#define _LINUX_TIMER_RISCV_H
+
+/*
+ * All RISC-V systems have a timer attached to every hart.  These timers can be
+ * read by the 'rdcycle' pseudo instruction, and can use the SBI to setup
+ * events.  In order to abstract the architecture-specific timer reading and
+ * setting functions away from the clock event insertion code, we provide
+ * function pointers to the clockevent subsystem that perform two basic operations:
+ * rdtime() reads the timer on the current CPU, and next_event(delta) sets the
+ * next timer event to 'delta' cycles in the future.  As the timers are
+ * inherently a per-cpu resource, these callbacks perform operations on the
+ * current hart.  There is guaranteed to be exactly one timer per hart on all
+ * RISC-V systems.
+ */
+void timer_riscv_init(int cpu_id,
+		      unsigned long riscv_timebase,
+		      int (*next_event)(unsigned long, struct clock_event_device *));
+
+void clocksource_riscv_init(unsigned long long (*rdtime)(struct clocksource *));
+#endif
-- 
2.13.5

