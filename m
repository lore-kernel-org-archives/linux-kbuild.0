Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:16858 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750853AbdHAXDf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 19:03:35 -0400
MIME-Version: 1.0
In-Reply-To: <20170801010009.3302-16-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com> <20170801010009.3302-16-palmer@dabbelt.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 2 Aug 2017 08:03:21 +0900
Message-ID: <CAK7LNATr5gTKZV2aoNxx7pWYsnqrvOe5guvT-E+OazKog_bnOQ@mail.gmail.com>
Subject: Re: [PATCH v7 15/15] RISC-V: Build Infastructure
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>, albert@sifive.com, Will Deacon <will.deacon@arm.com>, boqun.feng@gmail.com, oleg@redhat.com, Ingo Molnar <mingo@redhat.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, "David S. Miller" <davem@davemloft.net>, mchehab@kernel.org, hverkuil@xs4all.nl, Randy Dunlap <rdunlap@infradead.org>, viro@zeniv.linux.org.uk, Masami Hiramatsu <mhiramat@kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Russell King <rmk+kernel@armlinux.org.uk>, Paul Gortmaker <paul.gortmaker@windriver.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, Guenter Roeck <linux@roeck-us.net>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jiri@mellanox.com, Vineet Gupta <vgupta@synopsys.com>, Dave Airlie <airlied@redhat.com>, Jeremy Kerr <jk@ozlabs.org>, Chris Wilson <chris@chris-wilson.co.uk>, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, patches@groups.riscv.org

Hi.

> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> new file mode 100644
> index 000000000000..18158be62a2b
> --- /dev/null
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -0,0 +1,61 @@
> +generic-y += bugs.h
> +generic-y += cacheflush.h
> +generic-y += checksum.h
> +generic-y += clkdev.h
> +generic-y += cputime.h
> +generic-y += device.h
> +generic-y += div64.h
> +generic-y += dma.h
> +generic-y += dma-contiguous.h
> +generic-y += emergency-restart.h
> +generic-y += errno.h
> +generic-y += exec.h
> +generic-y += fb.h
> +generic-y += fcntl.h
> +generic-y += ftrace.h
> +generic-y += futex.h
> +generic-y += hardirq.h
> +generic-y += hash.h
> +generic-y += hw_irq.h
> +generic-y += ioctl.h
> +generic-y += ioctls.h
> +generic-y += ipcbuf.h
> +generic-y += irq_regs.h
> +generic-y += irq_work.h
> +generic-y += kdebug.h
> +generic-y += kmap_types.h
> +generic-y += kvm_para.h
> +generic-y += local.h
> +generic-y += mm-arch-hooks.h
> +generic-y += mman.h
> +generic-y += module.h
> +generic-y += msgbuf.h
> +generic-y += mutex.h
> +generic-y += param.h
> +generic-y += percpu.h
> +generic-y += poll.h
> +generic-y += posix_types.h
> +generic-y += preempt.h
> +generic-y += resource.h
> +generic-y += scatterlist.h
> +generic-y += sections.h
> +generic-y += sembuf.h
> +generic-y += setup.h
> +generic-y += shmbuf.h
> +generic-y += shmparam.h
> +generic-y += signal.h
> +generic-y += socket.h
> +generic-y += sockios.h
> +generic-y += stat.h
> +generic-y += statfs.h
> +generic-y += swab.h
> +generic-y += termbits.h
> +generic-y += termios.h
> +generic-y += topology.h
> +generic-y += trace_clock.h
> +generic-y += types.h
> +generic-y += unaligned.h
> +generic-y += user.h
> +generic-y += vga.h
> +generic-y += vmlinux.lds.h
> +generic-y += xor.h


Please split exported headers to arch/riscv/include/uapi/asm/Kbuild.

Otherwise, "make headers_install" will not work.

Please check
git show a8ff49a1d..d1b32bac



-- 
Best Regards
Masahiro Yamada
