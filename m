Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34993 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752195AbdC0NZG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Mar 2017 09:25:06 -0400
MIME-Version: 1.0
In-Reply-To: <2e97b35f-bb9e-66e4-736d-66313626354e@suse.com>
References: <1490273467-97948-1-git-send-email-chao.p.peng@linux.intel.com>
 <CAE9FiQVmazd8Z=_DT2vrcy7aOpgtFwxAF1Cw6PvzFnE+MckSQg@mail.gmail.com>
 <20170323153117.GA6356@tigerII.localdomain> <1490333740.2925.7.camel@linux.intel.com>
 <20170327075817.bb7wda62fcuvfa4b@linutronix.de> <2e97b35f-bb9e-66e4-736d-66313626354e@suse.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Mar 2017 15:25:04 +0200
Message-ID: <CAK8P3a1nf7zOHZCK+ZhfhVo9R8Onz4Mv5T2eTg7i4nwuL=zo7w@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Support uncompressed kernel
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Chao Peng <chao.p.peng@linux.intel.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Yinghai Lu <yinghai@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Mar 27, 2017 at 1:47 PM, Michal Marek <mmarek@suse.com> wrote:
> Dne 27.3.2017 v 09:58 Sebastian Andrzej Siewior napsal(a):
>> On 2017-03-24 13:35:40 [+0800], Chao Peng wrote:
>>>
>>>>>>     kernel               kernel size    time in decompress_kernel
>>>>>>     compressed (gzip)    3.3M           53ms
>>>>>>     uncompressed         14M            3ms
>>>>>
>>> Exactly, LZ4 is the fastest. It takes 16ms to complete the
>>> decompression. Still sounds a little longer when compared to
>>> uncompressed kernel.
>>
>> Are we seriously talking here about one-time improvement of 13ms
>> boot time?
>
> If the use case is launching new VM instances continuously, then
> compressing the kernel image is about as useful as compressing /bin/bash.

I guess the next step would be to use CONFIG_XIP_KERNEL on x86,
which requires an uncompressed kernel but has the additional advantage
of sharing the read-only sections of the kernel image across virtual
machines, resulting in better RAM and cache usage.

        Arnd
