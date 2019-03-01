Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44528 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388984AbfCAQza (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Mar 2019 11:55:30 -0500
Received: by mail-ot1-f65.google.com with SMTP id g1so21489675otj.11
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Mar 2019 08:55:30 -0800 (PST)
MIME-Version: 1.0
References: <20190301031201.7416-1-jannh@google.com> <20190301031201.7416-2-jannh@google.com>
 <20190301162418.sbhth5tycd6znxin@treble> <20190301162911.ucd6diddioqnthc2@treble>
In-Reply-To: <20190301162911.ucd6diddioqnthc2@treble>
From: Jann Horn <jannh@google.com>
Date: Fri, 1 Mar 2019 17:55:03 +0100
Message-ID: <CAG48ez0dkHyoTzxro_nCdhExygbxWVHn4LWnTmc7sAb43RureA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/unwind: add hardcoded ORC entry for NULL
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, syzbot <syzbot+ca95b2b7aef9e7cbd6ab@syzkaller.appspotmail.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, kernel list <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

On Fri, Mar 1, 2019 at 5:29 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Fri, Mar 01, 2019 at 10:24:18AM -0600, Josh Poimboeuf wrote:
> > > Is there a reason why the top-level Makefile only sets
> > > -fno-optimize-sibling-calls if CONFIG_FRAME_POINTER is set?
> > > I suspect that this is just a historical thing, because reliable
> > > unwinding didn't work without frame pointers until ORC came along.
> > > I'm not quite sure how best to express "don't do tail optimization if
> > > either frame pointers are used or ORC is used" in a Makefile, and
> > > whether we want an indirection through Kconfig for that, so I'm not
> > > doing anything about it in this series.
> > > Can someone send a patch to deal with it properly?
> >
> > Why would sibling calls be a problem for ORC?  Once a function does a
> > sibling call, it has effectively returned and shouldn't show up on the
> > stack trace anyway.
>
> Answering my own question, I guess some people might find it confusing
> to have a caller skipped in the stack trace.  But nobody has ever
> complained about it.
>
> It's not a problem for livepatch since we only care about the return
> path.

Yeah, that's my concern. I understand that it's irrelevant for tooling
that wants to understand what context a function is running in, but it
might matter to a human trying to understand how a function was
reached. In a theoretical worst case, a stack trace might skip
directly from do_syscall_64() into some random helper function that
received a bad pointer, and that might make debugging harder.
