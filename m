Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34005 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbgFDOVJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 10:21:09 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH 5/5] gcc-plugins/stackleak: Don't instrument
 vgettimeofday.c in arm64 VDSO
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-6-alex.popov@linux.com>
 <20200604135806.GA3170@willie-the-truck>
 <CAG48ez0H_+EBd1wekk2oddSzLsgzincyZb_dB+s5atudB23YyA@mail.gmail.com>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <ab7b6e17-69c5-dce9-a0ae-d12964319433@linux.com>
Date: Thu, 4 Jun 2020 17:20:48 +0300
MIME-Version: 1.0
In-Reply-To: <CAG48ez0H_+EBd1wekk2oddSzLsgzincyZb_dB+s5atudB23YyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jann Horn <jannh@google.com>, Will Deacon <will@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, linux-kbuild@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, kernel list <linux-kernel@vger.kernel.org>, gcc@gcc.gnu.org, notify@kernel.org

On 04.06.2020 17:14, Jann Horn wrote:
> On Thu, Jun 4, 2020 at 3:58 PM Will Deacon <will@kernel.org> wrote:
>> On Thu, Jun 04, 2020 at 04:49:57PM +0300, Alexander Popov wrote:
>>> Don't try instrumenting functions in arch/arm64/kernel/vdso/vgettimeofday.c.
>>> Otherwise that can cause issues if the cleanup pass of stackleak gcc plugin
>>> is disabled.
>>>
>>> Signed-off-by: Alexander Popov <alex.popov@linux.com>
>>> ---
>>>  arch/arm64/kernel/vdso/Makefile | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>>> index 3862cad2410c..9b84cafbd2da 100644
>>> --- a/arch/arm64/kernel/vdso/Makefile
>>> +++ b/arch/arm64/kernel/vdso/Makefile
>>> @@ -32,7 +32,8 @@ UBSAN_SANITIZE                      := n
>>>  OBJECT_FILES_NON_STANDARD    := y
>>>  KCOV_INSTRUMENT                      := n
>>>
>>> -CFLAGS_vgettimeofday.o = -O2 -mcmodel=tiny -fasynchronous-unwind-tables
>>> +CFLAGS_vgettimeofday.o = -O2 -mcmodel=tiny -fasynchronous-unwind-tables \
>>> +             $(DISABLE_STACKLEAK_PLUGIN)
>>
>> I can pick this one up via arm64, thanks. Are there any other plugins we
>> should be wary of? 

I can't tell exactly. I'm sure Kees has the whole picture.

>> It looks like x86 filters out $(GCC_PLUGINS_CFLAGS)
>> when building the vDSO.

Yes, that's why building x86 vDSO doesn't need $(DISABLE_STACKLEAK_PLUGIN).

> Maybe at some point we should replace exclusions based on
> GCC_PLUGINS_CFLAGS and KASAN_SANITIZE and UBSAN_SANITIZE and
> OBJECT_FILES_NON_STANDARD and so on with something more generic...
> something that says "this file will not be built into the normal
> kernel, it contains code that runs in realmode / userspace / some
> similarly weird context, and none of our instrumentation
> infrastructure is available there"...

Good idea. I would also add 'notrace' to that list.

Best regards,
Alexander
