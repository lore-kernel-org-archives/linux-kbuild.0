Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727179AbfAUW7A (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jan 2019 17:59:00 -0500
Date: Mon, 21 Jan 2019 17:58:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RESEND BUG REPORT] System hung! Due to ftrace or KASAN?
Message-ID: <20190121175842.0f526757@vmware.local.home>
In-Reply-To: <CACT4Y+Ye+0bBV5sB1F3wVbCC1guyA=RdsRnYHgrar=AhftGtQA@mail.gmail.com>
References: <CAKcZhuW-ozJp-MVU3gw=uhuSc9+HTMVJza8QRUL3TaRrbqjJew@mail.gmail.com>
        <CACT4Y+aJADsj37Y8jPAV7PASqKm_L-iJ=MDv68yPUO0TFvhdRg@mail.gmail.com>
        <CACT4Y+ZxgzdbCeFquYmKThfiTGg3pZhn90X_Fk3yRXGYfepU4Q@mail.gmail.com>
        <CAKcZhuWE_2+D_AP_U0XZP-bjb=8Eec1Ku3KD8qO8K0zDGo98Ow@mail.gmail.com>
        <CACT4Y+Ye+0bBV5sB1F3wVbCC1guyA=RdsRnYHgrar=AhftGtQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Zenghui Yu <zenghuiyu96@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, linux-trace-devel@vger.kernel.org, kasan-dev <kasan-dev@googlegroups.com>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrey Konovalov <andreyknvl@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Christoph Lameter <cl@linux.com>, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>

On Mon, 21 Jan 2019 10:36:25 +0100
Dmitry Vyukov <dvyukov@google.com> wrote:

> > BTW, I have bisect-ed and tested for this issue today. Finally it turned out
> > that
> >         bffa986c6f80e39d9903015fc7d0d99a66bbf559 is the first bad commit.
> > So I'm wondering if anywhere need to be fixed in commit bffa986c6f80 ("kasan:
> > move common generic and tag-based code to common.c").  
> 
> Thanks for bisecting. I think we have understanding of what happens
> here and it's exactly this that needs to be fixed:
> https://groups.google.com/d/msg/kasan-dev/g8A8PLKCyoE/vXnirYEnCAAJ
> And this commit already fixes it.

I just got a chance to look at that commit, and I knew exactly what the
bug was when looking at the broken commit. And yes, the fix is the
correct fix for the issue.

KASAN can be triggered by parts of the function tracer that is outside
of the recursion protection. If that part of KASAN is also traced by
the function tracer, it will cause a infinite recursion and crash the
system.

Seeing that code that was moved out of the "-pg" removal into a file
that is compiled with "-pg" (which is what causes function tracer to
trace functions in that file), was going to cause issues.

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
