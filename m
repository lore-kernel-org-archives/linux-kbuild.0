Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35793 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751920AbdIMUSR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 16:18:17 -0400
Received: by mail-pg0-f68.google.com with SMTP id j16so590736pga.2
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2017 13:18:17 -0700 (PDT)
Date: Wed, 13 Sep 2017 13:18:16 -0700 (PDT)
Subject: Re: [PATCH v8 18/18] RISC-V: Build Infrastructure
In-Reply-To: <CAK8P3a1eNM0pBcwG27n9cvRXRAfvSDhsNke1wDw6NRrXDFC+jw@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <mhng-13aa2008-e670-4dc0-aac6-a6fbaa8d6df1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, dmitriy@oss-tech.org, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Wed, 13 Sep 2017 09:06:03 PDT (-0700), Arnd Bergmann wrote:
> On Tue, Sep 12, 2017 at 11:57 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> This patch contains all the build infrastructure that actually enables
>> the RISC-V port.  This includes Makefiles, linker scripts, and Kconfig
>> files.  It also contains the only top-level change, which adds RISC-V to
>> the list of architectures that need a sed run to produce the ARCH
>> variable when building locally.
>
>> diff --git a/arch/riscv/configs/freedom-u500_defconfig b/arch/riscv/configs/freedom-u500_defconfig
>> new file mode 100644
>> index 000000000000..b580dc5c8feb
>> --- /dev/null
>> +++ b/arch/riscv/configs/freedom-u500_defconfig
>> @@ -0,0 +1,52 @@
>> +CONFIG_DEFAULT_HOSTNAME="ucbvax"
>
> That probably shouldn't be in here or the other defconfig files.

I agree.

>> +# CONFIG_CROSS_MEMORY_ATTACH is not set
>> +# CONFIG_FHANDLE is not set
>> +CONFIG_NAMESPACES=y
>> +# CONFIG_SGETMASK_SYSCALL is not set
>> +CONFIG_EMBEDDED=y
>
> You have CONFIG_EMBEDDED set in all defconfig files,
> which is a bit odd, as the only effect of that is to let you
> turn off some options that you normally want for a usable
> system, (e.g. sysfs, blk_dev or file_locking).
>
> Is this intentional?

No.

> In my experience, having one defconfig per machine
> can quickly get out of hand as more hardware gets added.
> You could start out with just one defconfig that sets all
> the common options, and then use config-fragments to
> decide between 32-bit and 64-bit.

Makes sense.  I guess I hadn't really paid much attention to the defconfig
files, I kind of just inherited them.  I'll go through them and come up with
something sane for the v9.
