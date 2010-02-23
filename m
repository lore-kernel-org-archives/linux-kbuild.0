Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f219.google.com ([209.85.220.219]:63127 "EHLO
	mail-fx0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126Ab0BWGhl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Feb 2010 01:37:41 -0500
Date: Tue, 23 Feb 2010 07:37:34 +0100
From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: [PATCH] x86: Add optimized popcnt variants
Message-ID: <20100223063734.GA32503@liondog.tnic>
References: <4B7C29C1.10906@suse.cz>
 <20100218061923.GA1594@liondog.tnic>
 <20100219142205.GA32533@aftab>
 <4B7EB6EF.9010405@zytor.com>
 <20100219164512.GA492@aftab>
 <4B7EC20C.30607@zytor.com>
 <20100222141737.GB21233@aftab>
 <4B82BD01.3030008@zytor.com>
 <20100222184945.GD21233@aftab>
 <4B82E144.1050007@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4B82E144.1050007@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@amd64.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Wu Fengguang <fengguang.wu@intel.com>, LKML <linux-kernel@vger.kernel.org>, Jamie Lokier <jamie@shareable.org>, Roland Dreier <rdreier@cisco.com>, Al Viro <viro@ZenIV.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Brian Gerst <brgerst@gmail.com>

From: "H. Peter Anvin" <hpa@zytor.com>
Date: Mon, Feb 22, 2010 at 11:55:48AM -0800

> On 02/22/2010 10:49 AM, Borislav Petkov wrote:
> >>
> >> Just a note: this still means rdi is clobbered on x86-64, which is
> >> probably fine, but needs to be recorded as such.  Since gcc doesn't
> >> support clobbers for registers used as operands (sigh), you have to
> >> create a dummy output and assign it a "=D" constraint.
> >>
> >> I don't know if gcc would handle -fcall-saved-rdi here... and if so, how
> >> reliably.
> > 
> > Ok, from looking at kernel/sched.s output it looks like it saves rdi
> > content over the alternative where needed. I'll do some more testing
> > just to make sure.
> > 
> 
> No, you can't rely on behavioral observation.  A different version of
> gcc could behave differently.  We need to make sure we tell gcc what the
> requirements actually are, as opposed to thinking we can just fix them.

Ok, I've added the dummy "=D" constraint since it sounded like the more
stable thing to do WRT gcc versions. BTW, I left the machine overnight
and it is still alive cheerfully building randconfigs.

I'll try the -fcall-saved-rdi thing also later today.

> +#define POPCNT ".byte 0xf3\n\t.byte 0x48\n\t.byte 0x0f\n\t.byte
> 0xb8\n\t.byte 0xc7"
> 
> BTW, this can be written:
> 
> #define POPCNT ".byte 0xf3,0x48,0x0f,0xb8,0xc7"

done, updated version coming up.

-- 
Regards/Gruss,
    Boris.
