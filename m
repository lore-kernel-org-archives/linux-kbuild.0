Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751259AbdIOOe7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Sep 2017 10:34:59 -0400
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com [209.85.128.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F95022A72
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Sep 2017 14:34:59 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id c23so1983852wrg.9
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Sep 2017 07:34:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170912215715.4186-5-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com> <20170912215715.4186-5-palmer@dabbelt.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 15 Sep 2017 09:34:33 -0500
Message-ID: <CABGGisxeubZsYaDdaKre5o+Bq9HrQqx-9TV7w0+g4wJxQRVmxQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/18] dt-bindings: interrupt-controller: RISC-V PLIC documentation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, Marc Zyngier <marc.zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, albert@sifive.com, Will Deacon <will.deacon@arm.com>, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, =?UTF-8?B?RnLDqWTDqXJpYyBXZWlzYmVja2Vy?= <fweisbec@gmail.com>, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, Nicolas Dichtel <nicolas.dichtel@6wind.com>, Guenter Roeck <linux@roeck-us.net>, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, Jeremy Kerr <jk@ozlabs.org>, Chris Wilson <chris@chris-wilson.co.uk>, Jason@zx2c4.com, Paul McKenney <paulmck@linux.vnet.ibm.com>, Neal Cardwell <ncardwell@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Tue, Sep 12, 2017 at 4:57 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> This patch adds documentation for the platform-level interrupt
> controller (PLIC) found in all RISC-V systems.  This interrupt
> controller routes interrupts from all the devices in the system to each
> hart-local interrupt controller.

It has been mentioned before, but please copy the right people and
lists. IOW, use scripts/get_maintainers.pl. You've got a whole bunch
of people CCed and probably most don't care about DT bindings at all.

Rob
