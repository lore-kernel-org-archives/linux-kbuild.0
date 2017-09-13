Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:37885 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751348AbdIMRBv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 13:01:51 -0400
Received: by mail-pg0-f65.google.com with SMTP id v5so373046pgn.4
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2017 10:01:51 -0700 (PDT)
Date: Wed, 13 Sep 2017 10:01:49 -0700 (PDT)
Subject: Re: [PATCH v8 15/18] RISC-V: Device, timer, IRQs, and the SBI
In-Reply-To: <CAK8P3a2_jOmOhHSUtJDRHL_Pw3vnnYWyv3f1WnxwT-aD0Hp7FA@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <mhng-33488bd9-ac28-4d2a-8812-c97ef7153ed3@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, dmitriy@oss-tech.org, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Wed, 13 Sep 2017 08:36:54 PDT (-0700), Arnd Bergmann wrote:
> On Tue, Sep 12, 2017 at 11:57 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
>> +
>> +/* RISC-V TileLink and PCIe share the share address space */
>> +#define PCI_DMA_BUS_IS_PHYS 1
>
> To be pedantic, the comment here is not helpful.

Ya, you're right: TileLink isn't a RISC-V thing, so the comment doesn't even
make sense.

> PCI_DMA_BUS_IS_PHYS is a misnamed symbol that indicates
> the absence of an IOMMU. When it is zero, the scsi and network
> layers assume that they don't need to use bounce buffers
> since the IOMMU can usually address any RAM even if a
> PCI device cannot.

OK.  How does this look?

diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index 285747fa2ef0..0f2fc9ef20fc 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -26,7 +26,7 @@
 /* RISC-V shim does not initialize PCI bus */
 #define pcibios_assign_all_busses() 1

-/* RISC-V TileLink and PCIe share the share address space */
+/* We do not have an IOMMU */
 #define PCI_DMA_BUS_IS_PHYS 1

 extern int isa_dma_bridge_buggy;
