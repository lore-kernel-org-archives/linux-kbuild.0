Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:57247 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751101AbdHANEl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 09:04:41 -0400
Message-ID: <1501592608.29303.321.camel@linux.intel.com>
Subject: Re: [PATCH v7 01/15] MAINTAINERS: Add RISC-V
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 01 Aug 2017 16:03:28 +0300
In-Reply-To: <20170801010009.3302-2-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com>
         <20170801010009.3302-2-palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Mon, 2017-07-31 at 17:59 -0700, Palmer Dabbelt wrote:
> From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> RISC-V needs a MAINTAINERS entry. Let's add one.
> 

Have you checked this by a brand new script (*) from Linus? 

(*) parse-maintainers.pl

> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 196bbc4613c7..651b9ad5cd68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11302,6 +11302,15 @@ S:	Maintained
>  F:	drivers/mtd/nand/r852.c
>  F:	drivers/mtd/nand/r852.h
>  
> +RISC-V ARCHITECTURE
> +M:	Palmer Dabbelt <palmer@sifive.com>
> +M:	Albert Ou <albert@sifive.com>
> +L:	patches@groups.riscv.org
> +T:	git https://github.com/riscv/riscv-linux
> +S:	Supported
> +F:	arch/riscv/
> +K:	riscv
> +
>  ROCCAT DRIVERS
>  M:	Stefan Achatz <erazor_de@users.sourceforge.net>
>  W:	http://sourceforge.net/projects/roccat/

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
