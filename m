Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:39382 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752520Ab0BVR0E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Feb 2010 12:26:04 -0500
Message-ID: <4B82BD01.3030008@zytor.com>
Date: Mon, 22 Feb 2010 09:21:05 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH] x86: Add optimized popcnt variants
References: <4B75A66A.70005@zytor.com> <4B7BF5D6.3030701@suse.cz> <20100217172040.GC13429@aftab> <4B7C27D8.9050408@suse.cz> <4B7C29C1.10906@suse.cz> <20100218061923.GA1594@liondog.tnic> <20100219142205.GA32533@aftab> <4B7EB6EF.9010405@zytor.com> <20100219164512.GA492@aftab> <4B7EC20C.30607@zytor.com> <20100222141737.GB21233@aftab>
In-Reply-To: <20100222141737.GB21233@aftab>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@amd64.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Wu Fengguang <fengguang.wu@intel.com>, LKML <linux-kernel@vger.kernel.org>, Jamie Lokier <jamie@shareable.org>, Roland Dreier <rdreier@cisco.com>, Al Viro <viro@ZenIV.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Brian Gerst <brgerst@gmail.com>

On 02/22/2010 06:17 AM, Borislav Petkov wrote:
>  
> +config ARCH_HWEIGHT_CFLAGS
> +	string
> +	default "-fcall-saved-rsi -fcall-saved-rdx -fcall-saved-rcx -fcall-saved-r8 -fcall-saved-r9 -fcall-saved-r10 -fcall-saved-r11" if X86_64
> +

[...]

> +
> +#ifdef CONFIG_64BIT
> +/* popcnt %rdi, %rax */
> +#define POPCNT ".byte 0xf3\n\t.byte 0x48\n\t.byte 0x0f\n\t.byte 0xb8\n\t.byte 0xc7"
> +#define REG_IN "D"
> +#define REG_OUT "a"
> +#else

Just a note: this still means rdi is clobbered on x86-64, which is
probably fine, but needs to be recorded as such.  Since gcc doesn't
support clobbers for registers used as operands (sigh), you have to
create a dummy output and assign it a "=D" constraint.

I don't know if gcc would handle -fcall-saved-rdi here... and if so, how
reliably.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

