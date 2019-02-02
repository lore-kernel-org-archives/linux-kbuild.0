Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37514 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727627AbfBBLwj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Feb 2019 06:52:39 -0500
MIME-Version: 1.0
References: <CAKcZhuW-ozJp-MVU3gw=uhuSc9+HTMVJza8QRUL3TaRrbqjJew@mail.gmail.com>
 <CACT4Y+aJADsj37Y8jPAV7PASqKm_L-iJ=MDv68yPUO0TFvhdRg@mail.gmail.com>
 <CACT4Y+ZxgzdbCeFquYmKThfiTGg3pZhn90X_Fk3yRXGYfepU4Q@mail.gmail.com>
 <CAKcZhuWE_2+D_AP_U0XZP-bjb=8Eec1Ku3KD8qO8K0zDGo98Ow@mail.gmail.com>
 <CACT4Y+Ye+0bBV5sB1F3wVbCC1guyA=RdsRnYHgrar=AhftGtQA@mail.gmail.com>
 <20190121175842.0f526757@vmware.local.home> <CACT4Y+Y7PJ1=dv6wzDTVRkFJCnrtDYyksmYp6UibW9a8_ob0Nw@mail.gmail.com>
In-Reply-To: <CACT4Y+Y7PJ1=dv6wzDTVRkFJCnrtDYyksmYp6UibW9a8_ob0Nw@mail.gmail.com>
From: Zenghui Yu <zenghuiyu96@gmail.com>
Date: Sat, 2 Feb 2019 19:52:24 +0800
Message-ID: <CAKcZhuXfgXvpb2YNVanA_TZHzHWj59_sB2YYwyTsoXKeW2bG2g@mail.gmail.com>
Subject: Re: [RESEND BUG REPORT] System hung! Due to ftrace or KASAN?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Cc: Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, linux-trace-devel@vger.kernel.org, kasan-dev <kasan-dev@googlegroups.com>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrey Konovalov <andreyknvl@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Linus Torvalds <torvalds@linux-foundation.org>, Christoph Lameter <cl@linux.com>, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>, Steven Rostedt <rostedt@goodmis.org>

On Tue, Jan 29, 2019 at 9:16 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, Jan 29, 2019 at 1:27 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Mon, 21 Jan 2019 10:36:25 +0100 Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > > > Thanks Dmitry! I'll try to test this commit tomorrow.
> > > >
> > > > BTW, I have bisect-ed and tested for this issue today. Finally it turned out
> > > > that
> > > >         bffa986c6f80e39d9903015fc7d0d99a66bbf559 is the first bad commit.
> > > > So I'm wondering if anywhere need to be fixed in commit bffa986c6f80 ("kasan:
> > > > move common generic and tag-based code to common.c").
> > >
> > > Thanks for bisecting. I think we have understanding of what happens
> > > here and it's exactly this that needs to be fixed:
> > > https://groups.google.com/d/msg/kasan-dev/g8A8PLKCyoE/vXnirYEnCAAJ
> > > And this commit already fixes it.
> >
> > Has that been sent in my direction?  I can't find it.
> >
> > If sending it please add
> >
> > Tested-by: Dmitry Vyukov <dvyukov@google.com>
> > Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>

Also,

Tested-by: Zenghui Yu <zenghuiyu96@gmail.com>

on x86 machines, if need :)


Thanks!

>
> Yes, it's here (State: New):
> https://lore.kernel.org/patchwork/patch/1024393/
>
> This page says it was mailed to linux-mm mailing list too:
> https://groups.google.com/forum/#!topic/kasan-dev/g8A8PLKCyoE
>
> But I can't find linux-mm archives here:
> http://vger.kernel.org/vger-lists.html
>
> How can I add a tag to an existing change under review? Patchwork does
> not show something like "add Tested-by: me tag" to me on the patch
> page.
>
> Patchwork shows Todo list on the main page with "Your todo list
> contains patches that have been delegated to you". But I don't see an
> option to delegate this patch to you either...
