Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:60599 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753763AbaGJOFO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Jul 2014 10:05:14 -0400
Message-id: <53BE9C53.5090301@samsung.com>
Date: Thu, 10 Jul 2014 17:59:47 +0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: [RFC/PATCH RESEND -next 00/21] Address sanitizer for kernel
 (kasan) - dynamic memory error detector.
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
 <53BDB1D6.1090605@intel.com> <8761j6nr53.fsf@tassilo.jf.intel.com>
 <CAOMGZ=Fmqg6MWyx3NygqVmYiqw=npkPQrO9ifhF489bq5Gxz4A@mail.gmail.com>
In-reply-to: <CAOMGZ=Fmqg6MWyx3NygqVmYiqw=npkPQrO9ifhF489bq5Gxz4A@mail.gmail.com>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Andi Kleen <andi@firstfloor.org>
Cc: Dave Hansen <dave.hansen@intel.com>, LKML <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Alexey Preobrazhensky <preobr@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, kbuild <linux-kbuild@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, x86 maintainers <x86@kernel.org>, Linux Memory Management List <linux-mm@kvack.org>

On 07/10/14 01:59, Vegard Nossum wrote:
> On 9 July 2014 23:44, Andi Kleen <andi@firstfloor.org> wrote:
>> Dave Hansen <dave.hansen@intel.com> writes:
>>>
>>> You're also claiming that "KASAN is better than all of
>>
>> better as in finding more bugs, but surely not better as in
>> "do so with less overhead"
>>
>>> CONFIG_DEBUG_PAGEALLOC".  So should we just disallow (or hide)
>>> DEBUG_PAGEALLOC on kernels where KASAN is available?
>>
>> I don't think DEBUG_PAGEALLOC/SLUB debug and kasan really conflict.
>>
>> DEBUG_PAGEALLOC/SLUB is "much lower overhead but less bugs found".
>> KASAN is "slow but thorough" There are niches for both.
>>
>> But I could see KASAN eventually deprecating kmemcheck, which
>> is just incredible slow.
> 
> FWIW, I definitely agree with this -- if KASAN can do everything that
> kmemcheck can, it is no doubt the right way forward.
> 

AFAIK kmemcheck could catch reads of uninitialized memory.
KASAN can't do it now, but It should be possible to implementation.
There is such tool for userspace - https://code.google.com/p/memory-sanitizer/wiki/MemorySanitizer

However detection of reads of uninitialized  memory will require a different
shadow encoding. Therefore I think it would be better to make it as a separate feature, incompatible with kasan.



> 
> Vegard
> 

