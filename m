Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35971 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728502AbfCAQAB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Mar 2019 11:00:01 -0500
Received: by mail-oi1-f193.google.com with SMTP id t206so19874666oib.3
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Mar 2019 08:00:00 -0800 (PST)
MIME-Version: 1.0
References: <20190301031201.7416-1-jannh@google.com> <20190301153258.GD22584@linux.intel.com>
In-Reply-To: <20190301153258.GD22584@linux.intel.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 1 Mar 2019 16:59:33 +0100
Message-ID: <CAG48ez1LEKEd695bnoZ71k5EZ6ZxRc5wH3vfkbLA-XkMq1-_jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/unwind: handle NULL pointer calls better in frame unwinder
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, syzbot <syzbot+ca95b2b7aef9e7cbd6ab@syzkaller.appspotmail.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, kernel list <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

On Fri, Mar 1, 2019 at 4:33 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
> On Fri, Mar 01, 2019 at 04:12:00AM +0100, Jann Horn wrote:
> > When the frame unwinder is invoked for an oops caused by a call to NULL,
> > it currently skips the parent function because BP still points to the
> > parent's stack frame; the (nonexistent) current function only has the first
> > half of a stack frame, and BP doesn't point to it yet.
> >
> > Add a special case for IP==0 that calculates a fake BP from SP, then uses
> > the real BP for the next frame.
> >
> > Note that this handles first_frame specially: We return information about
> > the parent function as long as the saved IP is >=first_frame, even if the
> > fake BP points below it.
> >
> > With an artificially-added NULL call in prctl_set_seccomp(), before this
> > patch, the trace is:
> >
> > Call Trace:
> >  ? prctl_set_seccomp+0x3a/0x50
> >  __x64_sys_prctl+0x457/0x6f0
> >  ? __ia32_sys_prctl+0x750/0x750
> >  do_syscall_64+0x72/0x160
> >  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >
> > After this patch, the trace is:
> >
> > Call Trace:
> >  prctl_set_seccomp+0x3a/0x50
> >  __x64_sys_prctl+0x457/0x6f0
> >  ? __ia32_sys_prctl+0x750/0x750
> >  do_syscall_64+0x72/0x160
> >  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> >  arch/x86/include/asm/unwind.h  |  6 ++++++
> >  arch/x86/kernel/unwind_frame.c | 25 ++++++++++++++++++++++---
> >  2 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/unwind.h b/arch/x86/include/asm/unwind.h
> > index 1f86e1b0a5cd..499578f7e6d7 100644
> > --- a/arch/x86/include/asm/unwind.h
> > +++ b/arch/x86/include/asm/unwind.h
> > @@ -23,6 +23,12 @@ struct unwind_state {
> >  #elif defined(CONFIG_UNWINDER_FRAME_POINTER)
> >       bool got_irq;
> >       unsigned long *bp, *orig_sp, ip;
> > +     /*
> > +      * If non-NULL: The current frame is incomplete and doesn't contain a
> > +      * valid BP. When looking for the next frame, use this instead of the
> > +      * non-existent saved BP.
> > +      */
> > +     unsigned long *next_bp;
> >       struct pt_regs *regs;
> >  #else
> >       unsigned long *sp;
> > diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame.c
> > index 3dc26f95d46e..9b9fd4826e7a 100644
> > --- a/arch/x86/kernel/unwind_frame.c
> > +++ b/arch/x86/kernel/unwind_frame.c
> > @@ -320,10 +320,14 @@ bool unwind_next_frame(struct unwind_state *state)
> >       }
> >
> >       /* Get the next frame pointer: */
> > -     if (state->regs)
> > +     if (state->next_bp) {
> > +             next_bp = state->next_bp;
> > +             state->next_bp = NULL;
> > +     } else if (state->regs) {
> >               next_bp = (unsigned long *)state->regs->bp;
> > -     else
> > +     } else {
> >               next_bp = (unsigned long *)READ_ONCE_TASK_STACK(state->task, *state->bp);
> > +     }
> >
> >       /* Move to the next frame if it's safe: */
> >       if (!update_stack_state(state, next_bp))
> > @@ -398,6 +402,21 @@ void __unwind_start(struct unwind_state *state, struct task_struct *task,
> >
> >       bp = get_frame_pointer(task, regs);
> >
> > +     /*
> > +      * If we crash with IP==0, the last successfully executed instruction
> > +      * was probably an indirect function call with a NULL function pointer.
> > +      * That means that SP points into the middle of an incomplete frame:
> > +      * *SP is a return pointer, and *(SP-sizeof(unsigned long)) is where we
> > +      * would have written a frame pointer if we hadn't crashed.
> > +      * Pretend that the frame is complete and that BP points to it, but save
> > +      * the real BP so that we can use it when looking for the next frame.
> > +      */
> > +     if (regs && regs->ip == 0 &&
>
> Would it make sense to do 'regs->ip < PAGE_SIZE', a la show_fault_oops()?
> E.g. to handle bugs where a function pointer gets loaded with NULL+offset.

I don't think near-NULL function pointers make sense or are likely to
occur in practice. Near-NULL pointer dereferences happen when you add
a struct member offset to a NULL pointer, or something like that; but
functions are never inline in structs/arrays, so there isn't really a
reason to compute a function pointer by adding an offset to a (NULL)
pointer.
