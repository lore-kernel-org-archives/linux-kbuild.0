Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40133 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgFJPYd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jun 2020 11:24:33 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH 1/5] gcc-plugins/stackleak: Exclude alloca() from the
 instrumentation logic
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-2-alex.popov@linux.com>
 <CAG48ez05JOvqzYGr3PvyQGwFURspFWvNvf-b8Y613PX0biug8w@mail.gmail.com>
 <70319f78-2c7c-8141-d751-07f28203db7c@linux.com>
 <202006091133.412F0E89@keescook>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <3b194cd9-909d-7186-0cc4-bf0a0358fe5d@linux.com>
Date: Wed, 10 Jun 2020 18:24:20 +0300
MIME-Version: 1.0
In-Reply-To: <202006091133.412F0E89@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Jann Horn <jannh@google.com>, Elena Reshetova <elena.reshetova@intel.com>, Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, linux-kbuild@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, kernel list <linux-kernel@vger.kernel.org>, gcc@gcc.gnu.org, notify@kernel.org

On 09.06.2020 21:39, Kees Cook wrote:
> On Thu, Jun 04, 2020 at 06:23:38PM +0300, Alexander Popov wrote:
>> On 04.06.2020 17:01, Jann Horn wrote:
>>> On Thu, Jun 4, 2020 at 3:51 PM Alexander Popov <alex.popov@linux.com> wrote:
>>>> Some time ago Variable Length Arrays (VLA) were removed from the kernel.
>>>> The kernel is built with '-Wvla'. Let's exclude alloca() from the
>>>> instrumentation logic and make it simpler. The build-time assertion
>>>> against alloca() is added instead.
>>> [...]
>>>> +                       /* Variable Length Arrays are forbidden in the kernel */
>>>> +                       gcc_assert(!is_alloca(stmt));
>>>
>>> There is a patch series from Elena and Kees on the kernel-hardening
>>> list that deliberately uses __builtin_alloca() in the syscall entry
>>> path to randomize the stack pointer per-syscall - see
>>> <https://lore.kernel.org/kernel-hardening/20200406231606.37619-4-keescook@chromium.org/>.
>>
>> Thanks, Jann.
>>
>> At first glance, leaving alloca() handling in stackleak instrumentation logic
>> would allow to integrate stackleak and this version of random_kstack_offset.
> 
> Right, it seems there would be a need for this coverage to remain,
> otherwise the depth of stack erasure might be incorrect.
> 
> It doesn't seem like the other patches strictly depend on alloca()
> support being removed, though?

Ok, I will leave alloca() support, reorganize the patch series and send v2.

>> Kees, Elena, did you try random_kstack_offset with upstream stackleak?
> 
> I didn't try that combination yet, no. It seemed there would likely
> still be further discussion about the offset series first (though the
> thread has been silent -- I'll rebase and resend it after rc2).

Ok, please add me to CC list.

Best regards,
Alexander

>> It looks to me that without stackleak erasing random_kstack_offset can be
>> weaker. I mean, if next syscall has a bigger stack randomization gap, the data
>> on thread stack from the previous syscall is not overwritten and can be used. Am
>> I right?
> 
> That's correct. I think the combination is needed, but I don't think
> they need to be strictly tied together.
> 
>> Another aspect: CONFIG_STACKLEAK_METRICS can be used for guessing kernel stack
>> offset, which is bad. It should be disabled if random_kstack_offset is on.
> 
> Agreed.
