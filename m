Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34012 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751454AbdILV5s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 17:57:48 -0400
Received: by mail-pg0-f65.google.com with SMTP id v82so6746699pgb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2017 14:57:47 -0700 (PDT)
Subject: [PATCH v8 03/18] dt-bindings: interrupt-controller: RISC-V local interrupt controller docs
Date: Tue, 12 Sep 2017 14:57:00 -0700
Message-Id: <20170912215715.4186-4-palmer@dabbelt.com>
In-Reply-To: <20170912215715.4186-1-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

This patch adds documentation on the RISC-V local interrupt controller,
which is a per-hart interrupt controller that manages all interrupts
entering a RISC-V hart.  This interrupt controller is present on all
RISC-V systems.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 .../interrupt-controller/riscv,cpu-intc.txt        | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
new file mode 100644
index 000000000000..61900e2e3868
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
@@ -0,0 +1,41 @@
+RISC-V Hart-Level Interrupt Controller (HLIC)
+---------------------------------------------
+
+RISC-V cores include Control Status Registers (CSRs) which are local to each
+hart and can be read or written by software. Some of these CSRs are used to
+control local interrupts connected to the core.  Every interrupt is ultimately
+routed through a hart's HLIC before it interrupts that hart.
+
+The RISC-V supervisor ISA manual specifies three interrupt sources that are
+attached to every HLIC: software interrupts, the timer interrupt, and external
+interrupts.  Software interrupts are used to send IPIs between cores.  The
+timer interrupt comes from an architecturally mandated real-time timer that is
+controller via SBI calls and CSR reads.  External interrupts connect all other
+device interrupts to the HLIC, which are routed via the platform-level
+interrupt controller (PLIC).
+
+All RISC-V systems that conform to the supervisor ISA specification are
+required to have a HLIC with these three interrupt sources present.  Since the
+interrupt map is defined by the ISA it's not listed in the HLIC's device tree
+entry, though external interrupt controllers (like the PLIC, for example) will
+need to define how their interrupts map to the relevant HLICs.
+
+Required properties:
+- compatible : "riscv,cpu-intc"
+- #interrupt-cells : should be <1>
+- interrupt-controller : Identifies the node as an interrupt controller
+
+Furthermore, this interrupt-controller MUST be embedded inside the cpu
+definition of the hart whose CSRs control these local interrupts.
+
+An example device tree entry for a HLIC is show below.
+
+	cpu1: cpu@1 {
+		compatible = "riscv";
+		...
+		cpu1-intc: interrupt-controller {
+			#interrupt-cells = <1>;
+			compatible = "riscv,cpu-intc";
+			interrupt-controller;
+		};
+	};
-- 
2.13.5

