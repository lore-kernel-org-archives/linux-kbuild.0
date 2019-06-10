Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:32898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388071AbfFJHpN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jun 2019 03:45:13 -0400
Date: Mon, 10 Jun 2019 09:45:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190610074510.GA24746@kroah.com>
References: <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com>
 <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org>
 <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org>
 <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>

On Mon, Jun 10, 2019 at 12:21:51AM -0700, Ivan Babrou wrote:
> Looks like 4.19.49 received some patches for GCC 9+, but unfortunately
> perf still doesn't want to compile:
> 
> [07:15:32]In file included from /usr/include/string.h:635,
> [07:15:32] from util/debug.h:7,
> [07:15:32] from builtin-help.c:15:
> [07:15:32]In function 'strncpy',
> [07:15:32] inlined from 'add_man_viewer' at builtin-help.c:192:2,
> [07:15:32] inlined from 'perf_help_config' at builtin-help.c:284:3:
> [07:15:32]/usr/include/x86_64-linux-gnu/bits/string3.h:126:10: error:
> '__builtin_strncpy' output truncated before terminating nul copying as
> many bytes from a string as its length [-Werror=stringop-truncation]
> [07:15:32] 126 | return __builtin___strncpy_chk (__dest, __src, __len,
> __bos (__dest));
> [07:15:32] | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> [07:15:32]builtin-help.c: In function 'perf_help_config':
> [07:15:32]builtin-help.c:187:15: note: length computed here
> [07:15:32] 187 | size_t len = strlen(name);
> [07:15:32] | ^~~~~~~~~~~~
> [07:15:32]cc1: all warnings being treated as errors


Any chance in finding a patch in Linus's tree that resolves this?  I
don't have gcc9 on my systems here yet to test this.

thanks,

greg k-h
