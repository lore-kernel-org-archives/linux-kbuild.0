Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:46694 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfKPR7N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Nov 2019 12:59:13 -0500
Subject: Re: [PATCH] kallsyms: new /proc/kallmodsyms with builtin modules and
 symbol sizes
References: <20191114223036.9359-1-eugene.loh@oracle.com>
 <20191115114708.2a784f8d@gandalf.local.home>
 <CAHk-=wjQBFTaEfHQNmrBQOLOLey5Goz01wJHTJKKLQm22ZyrJA@mail.gmail.com>
From: Eugene Loh <eugene.loh@oracle.com>
Message-ID: <11861ca1-76c5-ed14-8ee1-f067c7e5b0c0@oracle.com>
Date: Sat, 16 Nov 2019 09:58:04 -0800
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjQBFTaEfHQNmrBQOLOLey5Goz01wJHTJKKLQm22ZyrJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Song Liu <songliubraving@fb.com>, Thomas Gleixner <tglx@linutronix.de>, jacob.e.keller@intel.com, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 11/15/2019 09:26 AM, Linus Torvalds wrote:

> Is a new config option even needed?

I suppose not.  The original motivations for this option no longer 
matter.  I can amend the patch if that makes sense.

> Honestly, I think the "add the module name even when built-in" could
> be done unconditionally with no backwards compatibility issues.  It's
> not a new syntax, and shouldn't break anything, and looks like a
> useful extension of the existing format - and one that existing tools
> already have to be aware of.
>
> The size thing is obviously different, but I find that much more
> questionable. What's the use-case? If it's just about the occasional
> big jumps, then adding a dummy entry for those (rare) cases sounds
> like a much better option, and wouldn't break any existing code.
>
> I don't see any upside at all in showing the "exact" function size
> instead of a size rounded up to the usual 16 bytes or whatever.
> Padding is real, and doesn't change anything.

Since there are very many gaps, adding dummy entries makes sense only 
for "big" jumps.  I don't know where one would want to draw the line for 
"big."  In any case, to identify such gaps, one would still need the "nm 
-S" information provided by this patch.

Meanwhile, there are some symbols that encompass others.  E.g.,
     ffffffff8a001000 1000 T hypercall_page
     ffffffff8a001000 20 t xen_hypercall_set_trap_table
     ffffffff8a001020 20 t xen_hypercall_mmu_update
     [...]
     ffffffff8a0016c0 20 t xen_hypercall_arch_6
     ffffffff8a0016e0 20 t xen_hypercall_arch_7
     ffffffff8a002000 8 T __startup_secondary_64
Something between ffffffff8a001700 and ffffffff8a002000 maps to 
hypercall_page, but you'd never know that from the "up until the next 
address" approach.

Symbols of zero size pose interesting questions.  E.g., do we want these 
zero-size symbols to have nonzero size?
     ffffffff8ac00e00 19 T __x86_indirect_thunk_r15
     ffffffff8ac00e19 0 T _etext
     ffffffff8ac00e19 0 T __indirect_thunk_end
     ffffffff8ac00e1c 0 R __start_notes
     ffffffff8ac00fd8 18 r _note_55
     ffffffff8ac01008 0 R __stop_notes

Size information also helps us distinguish symbol ranges when a 
zero-size symbol has the same address as another symbol.  E.g.,
     ffffffff8a9593e0 0 T __sched_text_start
     ffffffff8a9593e0 6b9 t __schedule
     ffffffff8a959aa0 9a T schedule
If we have an address above ffffffff8a9593e0, we see it belongs to 
__schedule.   Without size information, we might have assigned such an 
address to __sched_text_start.

Or how would one distinguish the symbols at ffffffff8b37d840 without 
size info?
     ffffffff8b37a870 0 R __start___param
     ffffffff8b37a870 28 r __param_initcall_debug
     ffffffff8b37a898 28 r __param_action
     [...]
     ffffffff8b37d7f0 28 r __param_disable_ipv6
     ffffffff8b37d818 28 r __param_disable
     ffffffff8b37d840 0 r __stop___param
     ffffffff8b37d840 0 r __start___modver   [configfs]
     ffffffff8b37d840 8 r __modver_attr      [configfs]

There are also symbols of zero size that mark the end of a segment and 
share the same address as the first symbol in the next segment. This 
means that the "up to the next symbol" algorithm leads to some 
confusion, e.g., overlapping segments.

Anyhow, given that we know real symbol sizes, why not just use them?
