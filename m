Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:1990 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752170AbdHANh1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 09:37:27 -0400
Message-ID: <1501594391.29303.329.camel@linux.intel.com>
Subject: Re: [PATCH v7 06/15] tty: New RISC-V SBI console driver
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 01 Aug 2017 16:33:11 +0300
In-Reply-To: <20170801010009.3302-7-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com>
         <20170801010009.3302-7-palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Mon, 2017-07-31 at 18:00 -0700, Palmer Dabbelt wrote:
> The RISC-V ISA defines a simple console that is availiable via SBI
> calls
> on all systems.  This patch adds a driver for this console interface
> that can act as both a target for early printk and as the system
> console.

> +#include <linux/console.h>

> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/moduleparam.h>
> +#include <linux/types.h>


> +#include <linux/delay.h>

> +#include <linux/irq.h>

I'm not sure I understand why above two headers are included here.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
