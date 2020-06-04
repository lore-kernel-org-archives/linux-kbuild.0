Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38231 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729170AbgFDPXy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 11:23:54 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH 1/5] gcc-plugins/stackleak: Exclude alloca() from the
 instrumentation logic
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-2-alex.popov@linux.com>
 <CAG48ez05JOvqzYGr3PvyQGwFURspFWvNvf-b8Y613PX0biug8w@mail.gmail.com>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <70319f78-2c7c-8141-d751-07f28203db7c@linux.com>
Date: Thu, 4 Jun 2020 18:23:38 +0300
MIME-Version: 1.0
In-Reply-To: <CAG48ez05JOvqzYGr3PvyQGwFURspFWvNvf-b8Y613PX0biug8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jann Horn <jannh@google.com>, Kees Cook <keescook@chromium.org>, Elena Reshetova <elena.reshetova@intel.com>
Cc: Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, linux-kbuild@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, kernel list <linux-kernel@vger.kernel.org>, gcc@gcc.gnu.org, notify@kernel.org

On 04.06.2020 17:01, Jann Horn wrote:
> On Thu, Jun 4, 2020 at 3:51 PM Alexander Popov <alex.popov@linux.com> wrote:
>> Some time ago Variable Length Arrays (VLA) were removed from the kernel.
>> The kernel is built with '-Wvla'. Let's exclude alloca() from the
>> instrumentation logic and make it simpler. The build-time assertion
>> against alloca() is added instead.
> [...]
>> +                       /* Variable Length Arrays are forbidden in the kernel */
>> +                       gcc_assert(!is_alloca(stmt));
> 
> There is a patch series from Elena and Kees on the kernel-hardening
> list that deliberately uses __builtin_alloca() in the syscall entry
> path to randomize the stack pointer per-syscall - see
> <https://lore.kernel.org/kernel-hardening/20200406231606.37619-4-keescook@chromium.org/>.

Thanks, Jann.

At first glance, leaving alloca() handling in stackleak instrumentation logic
would allow to integrate stackleak and this version of random_kstack_offset.

Kees, Elena, did you try random_kstack_offset with upstream stackleak?

It looks to me that without stackleak erasing random_kstack_offset can be
weaker. I mean, if next syscall has a bigger stack randomization gap, the data
on thread stack from the previous syscall is not overwritten and can be used. Am
I right?

Another aspect: CONFIG_STACKLEAK_METRICS can be used for guessing kernel stack
offset, which is bad. It should be disabled if random_kstack_offset is on.

Best regards,
Alexander
