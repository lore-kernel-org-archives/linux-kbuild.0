Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f48.google.com ([209.85.213.48]:32864 "EHLO
        mail-vk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751295AbdCXNuq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Mar 2017 09:50:46 -0400
Received: by mail-vk0-f48.google.com with SMTP id d188so3574274vka.0
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Mar 2017 06:50:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170317192935.d5almj4brat6uvlt@hirez.programming.kicks-ass.net>
References: <20170317001520.85223-1-md@google.com> <20170317001520.85223-7-md@google.com>
 <20170317120837.pr74cv3xuj7qpoin@hirez.programming.kicks-ass.net>
 <CAG_fn=XcQLtcHRSm2BHYce9LMtyFJ+fWxfE4vYPCw+7U0DcrmQ@mail.gmail.com>
 <CAG_fn=WooTLkzex3hqPgO5pr7GsK3v7Z5riSA7K+-_S=S7rmBQ@mail.gmail.com>
 <20170317180350.63jjysejk2i6vkon@pd.tnic> <CACT4Y+Ysvjz+UzEi0dTtsNxxnG7WXTiZPr+KSk8HHwSu7vX1ew@mail.gmail.com>
 <20170317185720.5s7qa6hl233t24ag@pd.tnic> <CACT4Y+bybdpqB71=inx8amwr188Mb2QyBeRTDdWZ3AFyDwVX0A@mail.gmail.com>
 <20170317192642.qnrf7xuopxzapl2r@hirez.programming.kicks-ass.net> <20170317192935.d5almj4brat6uvlt@hirez.programming.kicks-ass.net>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 24 Mar 2017 14:50:24 +0100
Message-ID: <CACT4Y+bRWePGuZB-HCGBhHuENHAM=uDDv3i81fwZjNUKhNY2UA@mail.gmail.com>
Subject: Re: [PATCH 6/7] md/raid10, LLVM: get rid of variable length array
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Alexander Potapenko <glider@google.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, "x86@kernel.org" <x86@kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, kbuild-all@01.org, Fengguang Wu <fengguang.wu@intel.com>

On Fri, Mar 17, 2017 at 8:29 PM, Peter Zijlstra <peterz@infradead.org> wrote:
> On Fri, Mar 17, 2017 at 08:26:42PM +0100, Peter Zijlstra wrote:
>> On Fri, Mar 17, 2017 at 08:05:16PM +0100, Dmitry Vyukov wrote:
>> > You can also find some reasons in the Why section of LLVM-Linux project:
>> > http://llvm.linuxfoundation.org/index.php/Main_Page
>>
>> From that:
>>
>>  - LLVM/Clang is a fast moving project with many things fixed quickly
>>    and features added.
>>
>> So what's the deal with that 5 year old bug you want us to work around?
>>
>> Also, clang doesn't support asm cc flags output and a few other
>> extensions last time I checked.
>>
>
> Another great one:
>
>  - BSD License (some people prefer this license to the GPL)
>
> Seems a very weak argument to make when talking about the Linux Kernel
> which is very explicitly GPLv2 (and not later).

OK, I guess should not have referenced the llvm-linux page.
So here are reasons on our side that I am ready to vouch:

 - clang make it possible to implement KMSAN (dynamic detection of
uses of uninit memory)
 - better code coverage for fuzzing
 - why simpler and faster development (e.g. we can port our user-space
hardening technologies -- CFI and SafeStack)

Michael is on a different team and has own reasons to do this.
