Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42365 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751280AbdIPVif (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Sep 2017 17:38:35 -0400
Subject: Re: [PATCH v8 10/18] RISC-V: Init and Halt Code
References: <20170912215715.4186-1-palmer@dabbelt.com>
 <20170912215715.4186-11-palmer@dabbelt.com>
 <799b75ef-f512-3182-bc6d-cc79afedf282@linaro.org>
 <98372099-25e1-f340-f204-8e9a10d659f9@oss-tech.org>
 <173e7b29-7a1d-ebe9-cdad-9ff90d3c485f@linaro.org>
From: Dmitriy Cherkasov <dmitriy@oss-tech.org>
Message-ID: <e069a544-3087-6493-e2b1-8181abc4c051@oss-tech.org>
Date: Sat, 16 Sep 2017 14:38:26 -0700
MIME-Version: 1.0
In-Reply-To: <173e7b29-7a1d-ebe9-cdad-9ff90d3c485f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On 09/16/2017 06:28 AM, Daniel Lezcano wrote:
> On 16/09/2017 08:23, Dmitriy Cherkasov wrote:
>> On 09/13/2017 11:15 AM, Daniel Lezcano wrote:

>>>
>>> Where is get_cycles64() ?
>>
>> This is in asm/timex.h. Should this be split into a separate asm header
>> ala arm64?
> 
> No, it is fine but may be it is get_cycles(), no get_cycles64(), right?
> 

get_cycles() returns a 32 or 64-bit value depending on machine register width, 
using one assembly instruction to retrieve it.

get_cycles64() always returns a 64-bit value at the expense of a few more 
instructions on 32-bit systems.
