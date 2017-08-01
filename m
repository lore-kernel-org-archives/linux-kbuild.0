Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751834AbdHARIi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 13:08:38 -0400
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com [209.85.218.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 98B6523696
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Aug 2017 17:08:37 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id d71so16508507oih.0
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Aug 2017 10:08:37 -0700 (PDT)
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Aug 2017 12:08:14 -0500
Message-ID: <CABGGiswwVh46_5JgrXzb_w=jdbr5v6tQJMRCkeZQ8joNOefEdg@mail.gmail.com>
Subject: Re: [PATCH v7 04/15] irqchip: RISC-V Local Interrupt Controller Driver
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, Marc Zyngier <marc.zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, Will Deacon <will.deacon@arm.com>, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, Andrew Morton <akpm@linux-foundation.org>, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, Paul McKenney <paulmck@linux.vnet.ibm.com>, ncardwell@google.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Mon, Jul 31, 2017 at 7:59 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> This patch adds a driver that manages the local interrupts on each
> RISC-V hart, as specifiec by the RISC-V supervisor level ISA manual.
> The local interrupt controller manages software interrupts, timer
> interrupts, and hardware interrupts (which are routed via the
> platform level interrupt controller).  Per-hart local interrupt
> controllers are found on all RISC-V systems.
>
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---


> +IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);

What happened with the DT bindings? Those need to come first.

Rob
