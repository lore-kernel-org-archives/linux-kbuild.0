Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:55946 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965571AbdCXOLK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Mar 2017 10:11:10 -0400
Date: Fri, 24 Mar 2017 15:10:53 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 6/7] md/raid10, LLVM: get rid of variable length array
Message-ID: <20170324141053.lte3qq7mfl6krlkb@hirez.programming.kicks-ass.net>
References: <20170317120837.pr74cv3xuj7qpoin@hirez.programming.kicks-ass.net>
 <CAG_fn=XcQLtcHRSm2BHYce9LMtyFJ+fWxfE4vYPCw+7U0DcrmQ@mail.gmail.com>
 <CAG_fn=WooTLkzex3hqPgO5pr7GsK3v7Z5riSA7K+-_S=S7rmBQ@mail.gmail.com>
 <20170317180350.63jjysejk2i6vkon@pd.tnic>
 <CACT4Y+Ysvjz+UzEi0dTtsNxxnG7WXTiZPr+KSk8HHwSu7vX1ew@mail.gmail.com>
 <20170317185720.5s7qa6hl233t24ag@pd.tnic>
 <CACT4Y+bybdpqB71=inx8amwr188Mb2QyBeRTDdWZ3AFyDwVX0A@mail.gmail.com>
 <20170317192642.qnrf7xuopxzapl2r@hirez.programming.kicks-ass.net>
 <20170317192935.d5almj4brat6uvlt@hirez.programming.kicks-ass.net>
 <CACT4Y+bRWePGuZB-HCGBhHuENHAM=uDDv3i81fwZjNUKhNY2UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+bRWePGuZB-HCGBhHuENHAM=uDDv3i81fwZjNUKhNY2UA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Borislav Petkov <bp@alien8.de>, Alexander Potapenko <glider@google.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, "x86@kernel.org" <x86@kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, kbuild-all@01.org, Fengguang Wu <fengguang.wu@intel.com>

On Fri, Mar 24, 2017 at 02:50:24PM +0100, Dmitry Vyukov wrote:
> OK, I guess should not have referenced the llvm-linux page.
> So here are reasons on our side that I am ready to vouch:
> 
>  - clang make it possible to implement KMSAN (dynamic detection of
> uses of uninit memory)

How does GCC make this impossible?

>  - better code coverage for fuzzing

How so? Why can't the same be achieved using GCC?

>  - why simpler and faster development (e.g. we can port our user-space
> hardening technologies -- CFI and SafeStack)

That's just because you've already implemented this in clang, right? So
less work for you. Not because its impossible.
