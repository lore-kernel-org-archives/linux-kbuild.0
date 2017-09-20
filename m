Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53632 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751584AbdITJmm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 05:42:42 -0400
MIME-Version: 1.0
In-Reply-To: <20170912215715.4186-19-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com> <20170912215715.4186-19-palmer@dabbelt.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Sep 2017 18:41:52 +0900
Message-ID: <CAK7LNATwMzSXSvWVz1Ue-Jb8A=DJECwheMxEOfGy9DVF1UVC=w@mail.gmail.com>
Subject: Re: [PATCH v8 18/18] RISC-V: Build Infrastructure
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org, Michal Marek <mmarek@suse.com>, albert@sifive.com, Will Deacon <will.deacon@arm.com>, boqun.feng@gmail.com, oleg@redhat.com, Ingo Molnar <mingo@redhat.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, hverkuil@xs4all.nl, Randy Dunlap <rdunlap@infradead.org>, viro@zeniv.linux.org.uk, Masami Hiramatsu <mhiramat@kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Russell King <rmk+kernel@armlinux.org.uk>, Paul Gortmaker <paul.gortmaker@windriver.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, Guenter Roeck <linux@roeck-us.net>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jiri@mellanox.com, Vineet Gupta <vgupta@synopsys.com>, Dave Airlie <airlied@redhat.com>, Jeremy Kerr <jk@ozlabs.org>, Chris Wilson <chris@chris-wilson.co.uk>, Jason@zx2c4.com, Paul McKenney <paulmck@linux.vnet.ibm.com>, Neal Cardwell <ncardwell@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, patches@groups.riscv.org

2017-09-13 6:57 GMT+09:00 Palmer Dabbelt <palmer@dabbelt.com>:
> This patch contains all the build infrastructure that actually enables
> the RISC-V port.  This includes Makefiles, linker scripts, and Kconfig
> files.  It also contains the only top-level change, which adds RISC-V to
> the list of architectures that need a sed run to produce the ARCH
> variable when building locally.
>
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>

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


Please split out exported ones into arch/riscv/include/uapi/asm/Kbuild.

Otherwise, "make headers_install" will fail.


-- 
Best Regards
Masahiro Yamada
