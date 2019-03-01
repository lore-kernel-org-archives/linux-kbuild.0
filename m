Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36218 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728449AbfCAQ3P (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Mar 2019 11:29:15 -0500
Date: Fri, 1 Mar 2019 10:29:11 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH 2/2] x86/unwind: add hardcoded ORC entry for NULL
Message-ID: <20190301162911.ucd6diddioqnthc2@treble>
References: <20190301031201.7416-1-jannh@google.com>
 <20190301031201.7416-2-jannh@google.com>
 <20190301162418.sbhth5tycd6znxin@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190301162418.sbhth5tycd6znxin@treble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jann Horn <jannh@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, syzbot <syzbot+ca95b2b7aef9e7cbd6ab@syzkaller.appspotmail.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

On Fri, Mar 01, 2019 at 10:24:18AM -0600, Josh Poimboeuf wrote:
> > Is there a reason why the top-level Makefile only sets
> > -fno-optimize-sibling-calls if CONFIG_FRAME_POINTER is set?
> > I suspect that this is just a historical thing, because reliable
> > unwinding didn't work without frame pointers until ORC came along.
> > I'm not quite sure how best to express "don't do tail optimization if
> > either frame pointers are used or ORC is used" in a Makefile, and
> > whether we want an indirection through Kconfig for that, so I'm not
> > doing anything about it in this series.
> > Can someone send a patch to deal with it properly?
> 
> Why would sibling calls be a problem for ORC?  Once a function does a
> sibling call, it has effectively returned and shouldn't show up on the
> stack trace anyway.

Answering my own question, I guess some people might find it confusing
to have a caller skipped in the stack trace.  But nobody has ever
complained about it.

It's not a problem for livepatch since we only care about the return
path.

-- 
Josh
