Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34893 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387674AbfFJTOW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jun 2019 15:14:22 -0400
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Date: Mon, 10 Jun 2019 16:14:17 -0300
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190610191417.GW21245@kernel.org>
References: <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org>
 <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org>
 <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
 <20190610151407.GS21245@kernel.org>
 <20190610152542.GA4132@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610152542.GA4132@kroah.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Ivan Babrou <ivan@cloudflare.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

Em Mon, Jun 10, 2019 at 05:25:42PM +0200, Greg KH escreveu:
> On Mon, Jun 10, 2019 at 12:14:07PM -0300, Arnaldo Carvalho de Melo wrote:
> > Em Mon, Jun 10, 2019 at 12:21:51AM -0700, Ivan Babrou escreveu:
> > > Looks like 4.19.49 received some patches for GCC 9+, but unfortunately
> > > perf still doesn't want to compile:
> > > 
> > > [07:15:32]In file included from /usr/include/string.h:635,
> > > [07:15:32] from util/debug.h:7,
> > > [07:15:32] from builtin-help.c:15:
> > > [07:15:32]In function 'strncpy',
> > > [07:15:32] inlined from 'add_man_viewer' at builtin-help.c:192:2,
> > > [07:15:32] inlined from 'perf_help_config' at builtin-help.c:284:3:
> > > [07:15:32]/usr/include/x86_64-linux-gnu/bits/string3.h:126:10: error:
> > > '__builtin_strncpy' output truncated before terminating nul copying as
> > > many bytes from a string as its length [-Werror=stringop-truncation]
> > > [07:15:32] 126 | return __builtin___strncpy_chk (__dest, __src, __len,
> > > __bos (__dest));
> > > [07:15:32] | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > [07:15:32]builtin-help.c: In function 'perf_help_config':
> > > [07:15:32]builtin-help.c:187:15: note: length computed here
> > > [07:15:32] 187 | size_t len = strlen(name);
> > > [07:15:32] | ^~~~~~~~~~~~
> > > [07:15:32]cc1: all warnings being treated as errors
> > 
> > The patch below should've taken care of that, and it has a Fixes: tag,
> > i.e. the stable scripts should've noticed that, and it was noticed with
> > gcc 8.2.
> 
> No, stable scripts do not always pick up the "Fixes:" tag, they are only

Humm, I thought it picked those, or is it that AUTOSEL thing? Ok, I'll
add stable@ when I add Fixes: then.

> guaranteed to pick up the "cc: stable@" tag.  Sometimes we catch the
> fixes ones too, but not always by far.
> 
> Anyway, I'll queue this patch up after this next round of kernels are
> released, thanks!
> 
> greg k-h

-- 

- Arnaldo
