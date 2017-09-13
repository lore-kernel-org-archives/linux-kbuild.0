Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:47844 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751106AbdIMSPR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 14:15:17 -0400
Received: by mail-pg0-f53.google.com with SMTP id d8so1819408pgt.4
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2017 11:15:17 -0700 (PDT)
Subject: Re: [PATCH v8 10/18] RISC-V: Init and Halt Code
References: <20170912215715.4186-1-palmer@dabbelt.com>
 <20170912215715.4186-11-palmer@dabbelt.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <799b75ef-f512-3182-bc6d-cc79afedf282@linaro.org>
Date: Wed, 13 Sep 2017 20:15:12 +0200
MIME-Version: 1.0
In-Reply-To: <20170912215715.4186-11-palmer@dabbelt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On 12/09/2017 23:57, Palmer Dabbelt wrote:
> This contains the various __init C functions, the initial assembly
> kernel entry point, and the code to reset the system.  When a file was
> init-related this patch contains the entire file.
> 
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---

[ ... ]

> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> new file mode 100644
> index 000000000000..8362a0e17a1a
> --- /dev/null
> +++ b/arch/riscv/kernel/time.c
> @@ -0,0 +1,78 @@
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + *
> + *   This program is free software; you can redistribute it and/or
> + *   modify it under the terms of the GNU General Public License
> + *   as published by the Free Software Foundation, version 2.
> + *
> + *   This program is distributed in the hope that it will be useful,
> + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *   GNU General Public License for more details.
> + */
> +
> +#include <linux/clocksource.h>
> +#include <linux/clockchips.h>
> +#include <linux/delay.h>
> +#include <linux/timer_riscv.h>
> +
> +#include <asm/sbi.h>
> +
> +unsigned long riscv_timebase;
> +
> +DECLARE_PER_CPU(struct clock_event_device, riscv_clock_event);
> +
> +static int next_event(unsigned long delta, struct clock_event_device *ce)
> +{
> +	/*
> +	 * time_init() allocates a timer for each CPU.  Since we're writing the
> +	 * timer comparison register here we can't allow the timers to cross
> +	 * harts.
> +	 */
> +	BUG_ON(ce != this_cpu_ptr(&riscv_clock_event));
> +	sbi_set_timer(get_cycles64() + delta);
> +	return 0;
> +}
> +
> +static unsigned long long rdtime(struct clocksource *cs)
> +{
> +	/*
> +	 * It's guarnteed that all the timers across all the harts are
> +	 * synchronized within one tick of each other, so while this could
> +	 * technically go backwards when hopping between CPUs, practically it
> +	 * won't happen.
> +	 */
> +	return get_cycles64();
> +}
> +
> +void riscv_timer_interrupt(void)
> +{
> +	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
> +
> +	evdev->event_handler(evdev);
> +}
> +
> +void __init init_clockevent(void)
> +{
> +	int cpu_id = smp_processor_id();
> +
> +	timer_riscv_init(cpu_id, riscv_timebase, &next_event);
> +	csr_set(sie, SIE_STIE);
> +}
> +
> +void __init time_init(void)
> +{
> +	struct device_node *cpu;
> +	u32 prop;
> +
> +	cpu = of_find_node_by_path("/cpus");
> +	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> +		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
> +	riscv_timebase = prop;
> +
> +	lpj_fine = riscv_timebase / HZ;
> +
> +	clocksource_riscv_init(&rdtime);
> +	init_clockevent();
> +}

All this code must go in the timer side and use the TIMER_OF_DECLARE
macro with the proper wrappers.

Where is the request_per_cpu_interrupt()?

What is this riscv_timer_interrupt() signature?

Where is get_cycles64() ?

The timer driver should be self-contained and not spread across
different places, it is very difficult to review it.

[ ... ]

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

