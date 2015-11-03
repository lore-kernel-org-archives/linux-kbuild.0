Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:34263 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755207AbbKCRpk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Nov 2015 12:45:40 -0500
Received: by oies66 with SMTP id s66so13182982oie.1
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2015 09:45:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aOxQO6T9fnev=SrHXwwd9DD=6=7FCDO9_Cst0Ee-TC2g@mail.gmail.com>
References: <1415969446-26356-1-git-send-email-a.ryabinin@samsung.com>
 <5638ECEC.1030604@oracle.com> <CACT4Y+aOxQO6T9fnev=SrHXwwd9DD=6=7FCDO9_Cst0Ee-TC2g@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 3 Nov 2015 18:45:20 +0100
Message-ID: <CACT4Y+bmmVQT598Oagc7KS+4qRu_vVwm8MhAXiGqO0hJHxu_Aw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] UBSan: run-time undefined behavior sanity checker
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sasha Levin <sasha.levin@oracle.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Konstantin Khlebnikov <koct9i@gmail.com>, "x86@kernel.org" <x86@kernel.org>, linux-doc@vger.kernel.org, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>

+Andrey

On Tue, Nov 3, 2015 at 6:35 PM, Dmitry Vyukov <dvyukov@google.com> wrote:
> I guess just nobody reviewed this. I would like to see this merged as well.
>
>
>
> On Tue, Nov 3, 2015 at 6:20 PM, Sasha Levin <sasha.levin@oracle.com> wrote:
>> Anyone knows why wasn't this merged a year ago? I didn't see any review comments, and it
>> ended up finding real bugs.
>>
>> On 11/14/2014 07:50 AM, Andrey Ryabinin wrote:
>>> Next spin of UBSan and there are two patches from now.
>>> "Two there should be; no more, no less. One to embody the UBSan,
>>> the other to not deadlock it."
>>>
>>> Patches on top of v3.18-rc4. As usual they are available in git:
>>>       git://github.com/aryabinin/linux ubsan/v2
>>>
>>> Changes since v1:
>>>    - Refactoring and cleanups in lib/ubsan.c including Sasha's complains.
>>>    - Some spelling fixes from Randy
>>>    - Fixed possible memory corruption on 64 big endian machines, spotted by Rasmus.
>>>    - Links to the relevant GCC documentation added into changelog (Peter).
>>>    - Added documentation.
>>>    - Fix deadlock caused by kernel/printk/printk.c instrumentation
>>>         (patch "kernel: printk: specify alignment for struct printk_log").
>>>    - Dropped useless 'Indirect call of a function through a function pointer of the wrong type'
>>>      checker. GCC doesn't support this, and as clang manual says it's for C++ only.
>>>    - Added checker for __builtin_unreachable() calls.
>>>    - Removed redundant -fno-sanitize=float-cast-overflow from CFLAGS.
>>>    - Added lock to prevent mixing reports.
>>>
>>> Andrey Ryabinin (2):
>>>   kernel: printk: specify alignment for struct printk_log
>>>   UBSan: run-time undefined behavior sanity checker
>>>
>>>  Documentation/ubsan.txt               |  69 +++++
>>>  Makefile                              |  10 +-
>>>  arch/x86/Kconfig                      |   1 +
>>>  arch/x86/boot/Makefile                |   1 +
>>>  arch/x86/boot/compressed/Makefile     |   1 +
>>>  arch/x86/realmode/rm/Makefile         |   1 +
>>>  arch/x86/vdso/Makefile                |   2 +
>>>  drivers/firmware/efi/libstub/Makefile |   1 +
>>>  include/linux/sched.h                 |   3 +
>>>  kernel/printk/printk.c                |  10 +-
>>>  lib/Kconfig.debug                     |  22 ++
>>>  lib/Makefile                          |   3 +
>>>  lib/ubsan.c                           | 567 ++++++++++++++++++++++++++++++++++
>>>  lib/ubsan.h                           |  84 +++++
>>>  scripts/Makefile.lib                  |   6 +
>>>  15 files changed, 775 insertions(+), 6 deletions(-)
>>>  create mode 100644 Documentation/ubsan.txt
>>>  create mode 100644 lib/ubsan.c
>>>  create mode 100644 lib/ubsan.h
>>>
>>
