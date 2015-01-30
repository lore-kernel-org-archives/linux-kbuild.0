Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:44866 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760066AbbA3XSE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Jan 2015 18:18:04 -0500
MIME-Version: 1.0
In-Reply-To: <20150130134525.d9e4ddf09f3c52f710e4a6f4@linux-foundation.org>
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
	<1422544321-24232-1-git-send-email-a.ryabinin@samsung.com>
	<1422544321-24232-18-git-send-email-a.ryabinin@samsung.com>
	<20150129151332.3f87c0b2e335afd88af33e08@linux-foundation.org>
	<54CBC3A1.5040505@samsung.com>
	<20150130134525.d9e4ddf09f3c52f710e4a6f4@linux-foundation.org>
Date: Sat, 31 Jan 2015 03:18:04 +0400
Message-ID: <CAPAsAGzmu8nXJrVgmFNkyPaYBVvK9OgJNu8WBgwsBHWsprfs4g@mail.gmail.com>
Subject: Re: [PATCH v10 17/17] kasan: enable instrumentation of global variables
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Ryabinin <a.ryabinin@samsung.com>, LKML <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Dmitry Chernenkov <dmitryc@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Dave Hansen <dave.hansen@intel.com>, Andi Kleen <andi@firstfloor.org>, "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <mmarek@suse.cz>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>

2015-01-31 0:45 GMT+03:00 Andrew Morton <akpm@linux-foundation.org>:
> On Fri, 30 Jan 2015 20:47:13 +0300 Andrey Ryabinin <a.ryabinin@samsung.com> wrote:
>
>> >> +struct kasan_global {
>> >> +  const void *beg;                /* Address of the beginning of the global variable. */
>> >> +  size_t size;                    /* Size of the global variable. */
>> >> +  size_t size_with_redzone;       /* Size of the variable + size of the red zone. 32 bytes aligned */
>> >> +  const void *name;
>> >> +  const void *module_name;        /* Name of the module where the global variable is declared. */
>> >> +  unsigned long has_dynamic_init; /* This needed for C++ */
>> >
>> > This can be removed?
>> >
>>
>> No, compiler dictates layout of this struct. That probably deserves a comment.
>
> I see.  A link to the relevant gcc doc would be good.
>

There is no doc, only gcc source code.

> Perhaps the compiler provides a header file so clients of this feature
> don't need to write their own?
>

Nope.
Actually, we are the only client of this feature outside gcc code.
