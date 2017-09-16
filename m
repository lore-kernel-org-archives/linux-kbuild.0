Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:44734 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751218AbdIPN2a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Sep 2017 09:28:30 -0400
Received: by mail-pf0-f176.google.com with SMTP id e1so2776943pfk.1
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Sep 2017 06:28:30 -0700 (PDT)
Subject: Re: [PATCH v8 10/18] RISC-V: Init and Halt Code
References: <20170912215715.4186-1-palmer@dabbelt.com>
 <20170912215715.4186-11-palmer@dabbelt.com>
 <799b75ef-f512-3182-bc6d-cc79afedf282@linaro.org>
 <98372099-25e1-f340-f204-8e9a10d659f9@oss-tech.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <173e7b29-7a1d-ebe9-cdad-9ff90d3c485f@linaro.org>
Date: Sat, 16 Sep 2017 15:28:28 +0200
MIME-Version: 1.0
In-Reply-To: <98372099-25e1-f340-f204-8e9a10d659f9@oss-tech.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitriy Cherkasov <dmitriy@oss-tech.org>, Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On 16/09/2017 08:23, Dmitriy Cherkasov wrote:
> On 09/13/2017 11:15 AM, Daniel Lezcano wrote:
>>
>> All this code must go in the timer side and use the TIMER_OF_DECLARE
>> macro with the proper wrappers.
> 
> Hi, thanks for the feedback.
> 
> Agreed. I'll clean this up.
> 
>>
>> Where is the request_per_cpu_interrupt()?
>>
>> What is this riscv_timer_interrupt() signature?
> 
> This arch defines a separate exception type for local timer interrupts.
> Currently the interrupt controller driver checks the trap cause
> register, determines that it's a timer, and calls the handler directly.
> To make this go through the interrupt subsystem, this driver would need
> to be reworked.
> 
>>
>> Where is get_cycles64() ?
> 
> This is in asm/timex.h. Should this be split into a separate asm header
> ala arm64?

No, it is fine but may be it is get_cycles(), no get_cycles64(), right?

>> The timer driver should be self-contained and not spread across
>> different places, it is very difficult to review it.
>>
>> [ ... ]
>>
> 
> Agreed, thanks again for reviewing it anyway :)

Ok, thanks.

  -- Daniel

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

