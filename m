Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34704 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751729AbdHAP2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 11:28:00 -0400
Subject: Re: [PATCH v7 15/15] RISC-V: Build Infastructure
References: <20170801010009.3302-1-palmer@dabbelt.com>
 <20170801010009.3302-16-palmer@dabbelt.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <98b59662-f976-c58a-db3c-22c9f8ffbe52@infradead.org>
Date: Tue, 1 Aug 2017 08:27:51 -0700
MIME-Version: 1.0
In-Reply-To: <20170801010009.3302-16-palmer@dabbelt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On 07/31/2017 06:00 PM, Palmer Dabbelt wrote:
> This patch contains all the build infastructure that actually enables
> the RISC-V port.  This includes Makefiles, linker scripts, and Kconfig
> files.  It also contains the only top-level change, which adds RISC-V to
> the list of architectures that need a sed run to produce the ARCH
> variable when building locally.
> 
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> new file mode 100644
> index 000000000000..9b7d077f40af
> --- /dev/null
> +++ b/arch/riscv/Kconfig
> @@ -0,0 +1,275 @@
> +#
> +# For a description of the syntax of this configuration file,
> +# see Documentation/kbuild/kconfig-language.txt.
> +#

[]

drop the "default n" lines below:

> +config CMDLINE_BOOL
> +	bool "Built-in kernel command line"
> +	default n
> +	help
> +	  For most platforms, it is firmware or second stage bootloader
> +	  that by default specifies the kernel command line options.
> +	  However, it might be necessary or advantageous to either override
> +	  the default kernel command line or add a few extra options to it.
> +	  For such cases, this option allows hardcoding command line options
> +	  directly into the kernel.
> +
> +	  For that, choose 'Y' here and fill in the extra boot parameters
> +	  in CONFIG_CMDLINE.
> +
> +	  The built-in options will be concatenated to the default command
> +	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
> +	  command line will be ignored and replaced by the built-in string.
> +
> +config CMDLINE
> +	string "Built-in kernel command string"
> +	depends on CMDLINE_BOOL
> +	default ""
> +	help
> +	  Supply command-line options at build time by entering them here.
> +
> +config CMDLINE_OVERRIDE
> +	bool "Built-in command line overrides bootloader arguments"
> +	default n
> +	depends on CMDLINE_BOOL
> +	help
> +	  Set this option to 'Y' to have the kernel ignore the bootloader
> +	  or firmware command line.  Instead, the built-in command line
> +	  will be used exclusively.
> +
> +	  If you don't know what to do here, say N.



-- 
~Randy
