Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34930 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751017AbdILV5u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 17:57:50 -0400
Received: by mail-pg0-f68.google.com with SMTP id j16so3646448pga.2
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2017 14:57:50 -0700 (PDT)
Subject: [PATCH v8 05/18] dt-bindings: RISC-V CPU Bindings
Date: Tue, 12 Sep 2017 14:57:02 -0700
Message-Id: <20170912215715.4186-6-palmer@dabbelt.com>
In-Reply-To: <20170912215715.4186-1-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

This patch adds device tree bindings for RISC-V CPUs, patterned after
the ARM device tree CPU bindings.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 Documentation/devicetree/bindings/riscv/cpus.txt | 162 +++++++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/cpus.txt

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
new file mode 100644
index 000000000000..adf7b7af5dc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/cpus.txt
@@ -0,0 +1,162 @@
+===================
+RISC-V CPU Bindings
+===================
+
+The device tree allows to describe the layout of CPUs in a system through
+the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
+defining properties for every cpu.
+
+Bindings for CPU nodes follow the Devicetree Specification, available from:
+
+https://www.devicetree.org/specifications/
+
+with updates for 32-bit and 64-bit RISC-V systems provided in this document.
+
+===========
+Terminology
+===========
+
+This document uses some terminology common to the RISC-V community that is not
+widely used, the definitions of which are listed here:
+
+* hart: A hardware execution context, which contains all the state mandated by
+  the RISC-V ISA: a PC and some registers.  This terminology is designed to
+  disambiguate software's view of execution contexts from any particular
+  microarchitectural implementation strategy.  For example, my Intel laptop is
+  described as having one socket with two cores, each of which has two hyper
+  threads.  Therefore this system has four harts.
+
+=====================================
+cpus and cpu node bindings definition
+=====================================
+
+The RISC-V architecture, in accordance with the Devicetree Specification,
+requires the cpus and cpu nodes to be present and contain the properties
+described below.
+
+- cpus node
+
+        Description: Container of cpu nodes
+
+        The node name must be "cpus".
+
+        A cpus node must define the following properties:
+
+        - #address-cells
+                Usage: required
+                Value type: <u32>
+                Definition: must be set to 1
+        - #size-cells
+                Usage: required
+                Value type: <u32>
+                Definition: must be set to 0
+
+- cpu node
+
+        Description: Describes a hart context
+
+        PROPERTIES
+
+        - device_type
+                Usage: required
+                Value type: <string>
+                Definition: must be "cpu"
+        - reg
+                Usage: required
+                Value type: <u32>
+                Definition: The hart ID of this CPU node
+        - compatible:
+                Usage: required
+                Value type: <stringlist>
+                Definition: must contain "riscv", may contain one of
+                            "sifive,rocket0"
+        - mmu-type:
+                Usage: optional
+                Value type: <string>
+                Definition: Specifies the CPU's MMU type.  Possible values are
+                            "riscv,sv32"
+                            "riscv,sv39"
+                            "riscv,sv48"
+        - riscv,isa:
+                Usage: required
+                Value type: <string>
+                Definition: Contains the RISC-V ISA string of this hart.  These
+                            ISA strings are defined by the RISC-V ISA manual.
+
+Example: SiFive Freedom U540G Development Kit
+---------------------------------------------
+
+This system contains two harts: a hart marked as disabled that's used for
+low-level system tasks and should be ignored by Linux, and a second hart that
+Linux is allowed to run on.
+
+        cpus {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                timebase-frequency = <1000000>;
+                cpu@0 {
+                        clock-frequency = <1600000000>;
+                        compatible = "sifive,rocket0", "riscv";
+                        device_type = "cpu";
+                        i-cache-block-size = <64>;
+                        i-cache-sets = <128>;
+                        i-cache-size = <16384>;
+                        next-level-cache = <&L15 &L0>;
+                        reg = <0>;
+                        riscv,isa = "rv64imac";
+                        status = "disabled";
+                        L10: interrupt-controller {
+                                #interrupt-cells = <1>;
+                                compatible = "riscv,cpu-intc";
+                                interrupt-controller;
+                        };
+                };
+                cpu@1 {
+                        clock-frequency = <1600000000>;
+                        compatible = "sifive,rocket0", "riscv";
+                        d-cache-block-size = <64>;
+                        d-cache-sets = <64>;
+                        d-cache-size = <32768>;
+                        d-tlb-sets = <1>;
+                        d-tlb-size = <32>;
+                        device_type = "cpu";
+                        i-cache-block-size = <64>;
+                        i-cache-sets = <64>;
+                        i-cache-size = <32768>;
+                        i-tlb-sets = <1>;
+                        i-tlb-size = <32>;
+                        mmu-type = "riscv,sv39";
+                        next-level-cache = <&L15 &L0>;
+                        reg = <1>;
+                        riscv,isa = "rv64imafdc";
+                        status = "okay";
+                        tlb-split;
+                        L13: interrupt-controller {
+                                #interrupt-cells = <1>;
+                                compatible = "riscv,cpu-intc";
+                                interrupt-controller;
+                        };
+                };
+        };
+
+Example: Spike ISA Simulator with 1 Hart
+----------------------------------------
+
+This device tree matches the Spike ISA golden model as run with `spike -p1`.
+
+        cpus {
+                cpu@0 {
+                        device_type = "cpu";
+                        reg = <0x00000000>;
+                        status = "okay";
+                        compatible = "riscv";
+                        riscv,isa = "rv64imafdc";
+                        mmu-type = "riscv,sv48";
+                        clock-frequency = <0x3b9aca00>;
+                        interrupt-controller {
+                                #interrupt-cells = <0x00000001>;
+                                interrupt-controller;
+                                compatible = "riscv,cpu-intc";
+                        }
+                }
+        }
-- 
2.13.5

