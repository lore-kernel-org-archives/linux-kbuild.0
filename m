Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:58961 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751517AbdHPPZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Aug 2017 11:25:22 -0400
Date: Wed, 16 Aug 2017 17:23:47 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 03/15] clocksource: New RISC-V SBI timer driver
In-Reply-To: <20170801010009.3302-4-palmer@dabbelt.com>
Message-ID: <alpine.DEB.2.20.1708161715240.1987@nanos>
References: <20170801010009.3302-1-palmer@dabbelt.com> <20170801010009.3302-4-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: peterz@infradead.org, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Mon, 31 Jul 2017, Palmer Dabbelt wrote:

> +void timer_riscv_init(int cpu_id,
> +		      unsigned long riscv_timebase,
> +		      unsigned long long (*rdtime)(struct clocksource *),
> +		      int (*next)(unsigned long, struct clock_event_device*))
> +{
> +	struct clocksource *cs = &per_cpu(clock_source, cpu_id);
> +	struct clock_event_device *ce = &per_cpu(clock_event, cpu_id);

per_cpu_ptr() please

> +	*cs = (struct clocksource) {
> +		.name = "riscv_clocksource",
> +		.rating = 300,
> +		.read = rdtime,
> +		.mask = CLOCKSOURCE_MASK(BITS_PER_LONG),
> +		.flags = CLOCK_SOURCE_IS_CONTINUOUS,
> +	};

Hmm, why do you try to register clocksources per cpu. The core code will
only use the first one registered and the others are just ballast. You
should just have that once at boot time and not on a per cpu basis.

> +	clocksource_register_hz(cs, riscv_timebase);

Clock events are per CPU though.

> +	*ce = (struct clock_event_device){
> +		.name = "riscv_timer_clockevent",
> +		.features = CLOCK_EVT_FEAT_ONESHOT,
> +		.rating = 300,
> +		.cpumask = cpumask_of(cpu_id),
> +		.set_next_event = next,
> +		.set_state_oneshot  = NULL,
> +		.set_state_shutdown = NULL,
> +	};

I'm not a big fan of that. What's wrong with just making it:

static DEFINE_PER_CPU(struct clock_event_device, clock_event) = {
	.name		= "riscv_timer_clockevent",
	.features	= CLOCK_EVT_FEAT_ONESHOT,
	.rating		= 300,
};

and here just do:

	ce->cpumask = cpumask_of(cpu_id);
	ce->set_next_event = next;

> +	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);

Hmm?

> +/*
> + * Looks up the clocksource or clock_even_device that cooresponds the given
> + * hart.
> + */
> +struct clocksource *timer_riscv_source(int cpuid);
> +struct clock_event_device *timer_riscv_device(int cpu_id);

What for? You register and forget them ....

Thanks,

	tglx
