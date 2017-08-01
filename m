Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35965 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751884AbdHABAw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Jul 2017 21:00:52 -0400
Received: by mail-pf0-f195.google.com with SMTP id t83so249155pfj.3
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Jul 2017 18:00:51 -0700 (PDT)
Subject: [PATCH v7 06/15] tty: New RISC-V SBI console driver
Date: Mon, 31 Jul 2017 18:00:00 -0700
Message-Id: <20170801010009.3302-7-palmer@dabbelt.com>
In-Reply-To: <20170801010009.3302-1-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

The RISC-V ISA defines a simple console that is availiable via SBI calls
on all systems.  This patch adds a driver for this console interface
that can act as both a target for early printk and as the system
console.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 drivers/tty/hvc/Kconfig         | 11 +++++
 drivers/tty/hvc/Makefile        |  1 +
 drivers/tty/hvc/hvc_riscv_sbi.c | 94 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/tty/hvc/hvc_riscv_sbi.c

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index b8d5ea0ae26b..abe331761bdb 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -97,6 +97,17 @@ config HVC_BFIN_JTAG
 	 the HVC driver.  If you don't have JTAG, then you probably don't
 	 want this option.
 
+config HVC_RISCV_SBI
+	bool "RISC-V SBI console support"
+	depends on RISCV
+	select HVC_DRIVER
+	default y
+	help
+	  This enables support for console output via RISC-V SBI calls, which
+	  is normally used only during boot to output printk.
+
+	  If you don't know what do to here, say Y.
+
 config HVCS
 	tristate "IBM Hypervisor Virtual Console Server support"
 	depends on PPC_PSERIES && HVC_CONSOLE
diff --git a/drivers/tty/hvc/Makefile b/drivers/tty/hvc/Makefile
index 6a2702be76d1..be497f9312d1 100644
--- a/drivers/tty/hvc/Makefile
+++ b/drivers/tty/hvc/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_HVC_IUCV)		+= hvc_iucv.o
 obj-$(CONFIG_HVC_UDBG)		+= hvc_udbg.o
 obj-$(CONFIG_HVC_BFIN_JTAG)	+= hvc_bfin_jtag.o
 obj-$(CONFIG_HVCS)		+= hvcs.o
+obj-$(CONFIG_HVC_RISCV_SBI)	+= hvc_riscv_sbi.o
diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
new file mode 100644
index 000000000000..20a6bfda4e32
--- /dev/null
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -0,0 +1,94 @@
+/*
+ * RISC-V SBI interface to hvc_console.c
+ *  based on drivers-tty/hvc/hvc_udbg.c
+ *
+ * Copyright (C) 2008 David Gibson, IBM Corporation
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
+#include <linux/console.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/moduleparam.h>
+#include <linux/types.h>
+#include <linux/irq.h>
+
+#include <asm/sbi.h>
+
+#include "hvc_console.h"
+
+static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		sbi_console_putchar(buf[i]);
+
+	return i;
+}
+
+static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
+{
+	int i, c;
+
+	for (i = 0; i < count; i++) {
+		if ((c = sbi_console_getchar()) < 0)
+			break;
+		buf[i] = c;
+	}
+
+	return i;
+}
+
+static const struct hv_ops hvc_sbi_ops = {
+	.get_chars = hvc_sbi_tty_get,
+	.put_chars = hvc_sbi_tty_put,
+};
+
+static int __init hvc_sbi_init(void)
+{
+	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
+}
+device_initcall(hvc_sbi_init);
+
+static int __init hvc_sbi_console_init(void)
+{
+	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	add_preferred_console("hvc", 0, NULL);
+
+	return 0;
+}
+console_initcall(hvc_sbi_console_init);
+
+#ifdef CONFIG_EARLY_PRINTK
+static void sbi_console_write(struct console *co, const char *buf,
+			      unsigned int n)
+{
+	int i;
+
+	for (i = 0; i < n; ++i) {
+		if (buf[i] == '\n')
+			sbi_console_putchar('\r');
+		sbi_console_putchar(buf[i]);
+	}
+}
+
+/* This is used by arch/riscv/kernel/setup.c */
+struct console riscv_sbi_early_console_dev __initdata = {
+	.name	= "early",
+	.write	= sbi_console_write,
+	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
+	.index	= -1
+};
+#endif
-- 
2.13.0

