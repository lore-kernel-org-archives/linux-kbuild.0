Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390708AbfFJOVs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jun 2019 10:21:48 -0400
Date: Mon, 10 Jun 2019 16:21:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190610142145.GC5937@kroah.com>
References: <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org>
 <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org>
 <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
 <20190610074510.GA24746@kroah.com>
 <CALrw=nEp=hUUaKtuU3Q1c_zKO3zYC3uP_s_Dyz_zhkxW7K+4mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALrw=nEp=hUUaKtuU3Q1c_zKO3zYC3uP_s_Dyz_zhkxW7K+4mQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: Ivan Babrou <ivan@cloudflare.com>, Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

On Mon, Jun 10, 2019 at 10:32:25AM +0100, Ignat Korchagin wrote:
> Hi Greg,
> 
> For us it seems applying the following 4 mainline patches makes 4.19.x
> branch perf compile with GCC-9:
> 
> 4d0f16d059ddb91424480d88473f7392f24aebdc: perf ui helpline: Use
> strlcpy() as a shorter form of strncpy() + explicit set nul
> b6313899f4ed2e76b8375cf8069556f5b94fbff0: perf help: Remove needless
> use of strncpy()
> 5192bde7d98c99f2cd80225649e3c2e7493722f7: perf header: Fix unchecked
> usage of strncpy()
> 97acec7df172cd1e450f81f5e293c0aa145a2797: perf data: Fix 'strncat may
> truncate' build failure with recent gcc
> 
> I also checked that 4.19.49 compiles fine with GCC 9, although with a
> lot of warnings, mostly from objtool, like "warning: objtool:
> sock_register()+0xd: sibling call from callable instruction with
> modified stack frame". But it's a start.
> 
> Can we apply the above-mentioned patches, please?

I'll look into these after the next round of kernels are released.  I
guess I'll go find a distro that has gcc9 on it to actually test
things...

thanks,

greg k-h
