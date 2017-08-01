Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:59470 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751012AbdHANHb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 09:07:31 -0400
Message-ID: <1501592780.29303.324.camel@linux.intel.com>
Subject: Re: [PATCH v7 02/15] lib: Add shared copies of some GCC library
 routines
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 01 Aug 2017 16:06:20 +0300
In-Reply-To: <20170801010009.3302-3-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com>
         <20170801010009.3302-3-palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Mon, 2017-07-31 at 17:59 -0700, Palmer Dabbelt wrote:
> Many ports (m32r, microblaze, mips, parisc, score, and sparc) use
> functionally identical copies of various GCC library routine files,
> which came up as we were submitting the RISC-V port (which also uses
> some of these).
> 
> This patch adds a new copy of these library routine files, which are
> functionally identical to the various other copies.  These are
> availiable via Kconfig as CONFIG_GENERIC_$ROUTINE, which currently
> isn't
> used anywhere.
> 


> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>

> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>

That's why we are putting tags before own SoB line(s)


In two cases in the patch you have

+
+

for no reason. I think you may remove second empty line.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
