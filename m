Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33953 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753183AbdHTTyH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Aug 2017 15:54:07 -0400
Received: by mail-pg0-f66.google.com with SMTP id i12so5324329pgr.1
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Aug 2017 12:54:07 -0700 (PDT)
Date: Sun, 20 Aug 2017 12:54:05 -0700 (PDT)
Subject: Re: [PATCH v7 02/15] lib: Add shared copies of some GCC library routines
In-Reply-To: <1501592780.29303.324.camel@linux.intel.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <mhng-7ffaa0f4-dc5d-42d0-a927-83262fecee02@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: andriy.shevchenko@linux.intel.com
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Tue, 01 Aug 2017 06:06:20 PDT (-0700), andriy.shevchenko@linux.intel.com wrote:
> On Mon, 2017-07-31 at 17:59 -0700, Palmer Dabbelt wrote:
>> Many ports (m32r, microblaze, mips, parisc, score, and sparc) use
>> functionally identical copies of various GCC library routine files,
>> which came up as we were submitting the RISC-V port (which also uses
>> some of these).
>>
>> This patch adds a new copy of these library routine files, which are
>> functionally identical to the various other copies.  These are
>> availiable via Kconfig as CONFIG_GENERIC_$ROUTINE, which currently
>> isn't
>> used anywhere.
>>
>
>
>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>
>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>
> That's why we are putting tags before own SoB line(s)

OK, sorry about that -- I'll fix it for our v8 patch set.

> In two cases in the patch you have
>
> +
> +
>
> for no reason. I think you may remove second empty line.

Makes sense.  I'll squash this into the next patch set.

diff --git a/include/lib/libgcc.h b/include/lib/libgcc.h
index a5397e34e005..32e1e0f4b2d0 100644
--- a/include/lib/libgcc.h
+++ b/include/lib/libgcc.h
@@ -16,7 +16,6 @@
  * to the Free Software Foundation, Inc.
  */

-
 #ifndef __LIB_LIBGCC_H
 #define __LIB_LIBGCC_H

diff --git a/lib/ashldi3.c b/lib/ashldi3.c
index ff4ec63d2ab6..1b6087db95a5 100644
--- a/lib/ashldi3.c
+++ b/lib/ashldi3.c
@@ -14,7 +14,6 @@
  * to the Free Software Foundation, Inc.
  */

-
 #include <linux/export.h>

 #include <lib/libgcc.h>

