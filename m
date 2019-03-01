Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58134 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbfCAEWb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Feb 2019 23:22:31 -0500
Date: Thu, 28 Feb 2019 22:22:26 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH 1/2] x86/unwind: handle NULL pointer calls better in
 frame unwinder
Message-ID: <20190301042226.qnh7ny5otz5w3bz7@treble>
References: <20190301031201.7416-1-jannh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190301031201.7416-1-jannh@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jann Horn <jannh@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, syzbot <syzbot+ca95b2b7aef9e7cbd6ab@syzkaller.appspotmail.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

On Fri, Mar 01, 2019 at 04:12:00AM +0100, Jann Horn wrote:
> When the frame unwinder is invoked for an oops caused by a call to NULL,
> it currently skips the parent function because BP still points to the
> parent's stack frame; the (nonexistent) current function only has the first
> half of a stack frame, and BP doesn't point to it yet.
> 
> Add a special case for IP==0 that calculates a fake BP from SP, then uses
> the real BP for the next frame.
> 
> Note that this handles first_frame specially: We return information about
> the parent function as long as the saved IP is >=first_frame, even if the
> fake BP points below it.
> 
> With an artificially-added NULL call in prctl_set_seccomp(), before this
> patch, the trace is:
> 
> Call Trace:
>  ? prctl_set_seccomp+0x3a/0x50
>  __x64_sys_prctl+0x457/0x6f0
>  ? __ia32_sys_prctl+0x750/0x750
>  do_syscall_64+0x72/0x160
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> After this patch, the trace is:
> 
> Call Trace:
>  prctl_set_seccomp+0x3a/0x50
>  __x64_sys_prctl+0x457/0x6f0
>  ? __ia32_sys_prctl+0x750/0x750
>  do_syscall_64+0x72/0x160
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Signed-off-by: Jann Horn <jannh@google.com>

The general approach looks good.  I'll try to give it a proper review
tomorrow or so.

-- 
Josh
