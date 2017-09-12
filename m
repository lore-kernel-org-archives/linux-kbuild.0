Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:38808 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751463AbdILV5s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 17:57:48 -0400
Received: by mail-pg0-f66.google.com with SMTP id m30so1775491pgn.5
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2017 14:57:48 -0700 (PDT)
Subject: [PATCH v8 04/18] dt-bindings: interrupt-controller: RISC-V PLIC documentation
Date: Tue, 12 Sep 2017 14:57:01 -0700
Message-Id: <20170912215715.4186-5-palmer@dabbelt.com>
In-Reply-To: <20170912215715.4186-1-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

This patch adds documentation for the platform-level interrupt
controller (PLIC) found in all RISC-V systems.  This interrupt
controller routes interrupts from all the devices in the system to each
hart-local interrupt controller.

Note: the DTS bindings for the PLIC aren't set in stone yet, as we might
want to change how we're specifying holes in the hart list.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 .../bindings/interrupt-controller/riscv,plic0.txt  | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt
new file mode 100644
index 000000000000..99cd359dbd43
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt
@@ -0,0 +1,55 @@
+RISC-V Platform-Level Interrupt Controller (PLIC)
+-------------------------------------------------
+
+The RISC-V supervisor ISA specification allows for the presence of a
+platform-level interrupt controller (PLIC).   The PLIC connects all external
+interrupts in the system to all hart contexts in the system, via the external
+interrupt source in each hart's hart-local interrupt controller (HLIC).  A hart
+context is a privilege mode in a hardware execution thread.  For example, in
+an 4 core system with 2-way SMT, you have 8 harts and probably at least two
+privilege modes per hart; machine mode and supervisor mode.
+
+Each interrupt can be enabled on per-context basis. Any context can claim
+a pending enabled interrupt and then release it once it has been handled.
+
+Each interrupt has a configurable priority. Higher priority interrupts are
+serviced firs. Each context can specify a priority threshold. Interrupts
+with priority below this threshold will not cause the PLIC to raise its
+interrupt line leading to the context.
+
+While the PLIC supports both edge-triggered and level-triggered interrupts,
+interrupt handlers are oblivious to this distinction and therefor it is not
+specific in the PLIC device-tree binding.
+
+While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
+"riscv,plic0" device is a concrete implementation of the PLIC that contains a
+specific memory layout.  More details about the memory layout of the
+"riscv,plic0" device can be found as a comment in the device driver, or as part
+of the SiFive U5 Coreplex Series Manual (page 22 of the PDF of version 1.0)
+<https://www.sifive.com/documentation/coreplex/u5-coreplex-series-manual/>
+
+Required properties:
+- compatible : "riscv,plic0"
+- #address-cells : should be <0>
+- #interrupt-cells : should be <1>
+- interrupt-controller : Identifies the node as an interrupt controller
+- reg : Should contain 1 register range (address and length)
+- interrupts-extended : Specifies which contexts are connected to the PLIC,
+  with "-1" specifying that a context is not present.
+
+Example:
+
+	plic: interrupt-controller@c000000 {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		compatible = "riscv,plic0";
+		interrupt-controller;
+		interrupts-extended = <
+			&cpu0-intc 11
+			&cpu1-intc 11 &cpu1-intc 9
+			&cpu2-intc 11 &cpu2-intc 9
+			&cpu3-intc 11 &cpu3-intc 9
+			&cpu4-intc 11 &cpu4-intc 9>;
+		reg = <0xc000000 0x4000000>;
+		riscv,ndev = <10>;
+	};
-- 
2.13.5

