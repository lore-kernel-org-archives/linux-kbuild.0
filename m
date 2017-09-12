Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37212 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751784AbdILV60 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 17:58:26 -0400
Received: by mail-pf0-f194.google.com with SMTP id e69so4924769pfg.4
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2017 14:58:26 -0700 (PDT)
Subject: [PATCH v8 01/18] MAINTAINERS: Add RISC-V
Date: Tue, 12 Sep 2017 14:56:58 -0700
Message-Id: <20170912215715.4186-2-palmer@dabbelt.com>
In-Reply-To: <20170912215715.4186-1-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

RISC-V needs a MAINTAINERS entry. Let's add one.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c3feffb1c1c..d5d70a1318d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11253,6 +11253,15 @@ S:	Maintained
 F:	drivers/mtd/nand/r852.c
 F:	drivers/mtd/nand/r852.h
 
+RISC-V ARCHITECTURE
+M:	Palmer Dabbelt <palmer@sifive.com>
+M:	Albert Ou <albert@sifive.com>
+L:	patches@groups.riscv.org
+T:	git https://github.com/riscv/riscv-linux
+S:	Supported
+F:	arch/riscv/
+K:	riscv
+
 ROCCAT DRIVERS
 M:	Stefan Achatz <erazor_de@users.sourceforge.net>
 W:	http://sourceforge.net/projects/roccat/
-- 
2.13.5

