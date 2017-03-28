Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f48.google.com ([209.85.213.48]:34683 "EHLO
        mail-vk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932594AbdC1W4Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Mar 2017 18:56:24 -0400
Received: by mail-vk0-f48.google.com with SMTP id z204so106383665vkd.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Mar 2017 15:56:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3cbfa24b-8bae-7cc9-dcf5-93f02971e673@zytor.com>
References: <1490273467-97948-1-git-send-email-chao.p.peng@linux.intel.com>
 <CAE9FiQVmazd8Z=_DT2vrcy7aOpgtFwxAF1Cw6PvzFnE+MckSQg@mail.gmail.com>
 <20170323153117.GA6356@tigerII.localdomain> <1490333740.2925.7.camel@linux.intel.com>
 <20170327075817.bb7wda62fcuvfa4b@linutronix.de> <2e97b35f-bb9e-66e4-736d-66313626354e@suse.com>
 <CAK8P3a1nf7zOHZCK+ZhfhVo9R8Onz4Mv5T2eTg7i4nwuL=zo7w@mail.gmail.com>
 <1490702482.3011.7.camel@linux.intel.com> <3cbfa24b-8bae-7cc9-dcf5-93f02971e673@zytor.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 28 Mar 2017 15:55:47 -0700
Message-ID: <CALCETrVnc6pWKcbFWeJHmPVDtmD5Js_LbW_AVbx-sBJ0hpRNwQ@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Support uncompressed kernel
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Yinghai Lu <yinghai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Mar 28, 2017 at 3:38 PM, H. Peter Anvin <hpa@zytor.com> wrote:
> On 03/28/17 05:01, Chao Peng wrote:
>>>
>>> I guess the next step would be to use CONFIG_XIP_KERNEL on x86,
>>> which requires an uncompressed kernel but has the additional advantage
>>> of sharing the read-only sections of the kernel image across virtual
>>> machines, resulting in better RAM and cache usage.
>>
>> That is something we wanna look into :)
>>
>
> It is, but that is a second order thing... especially since the x86
> kernel makes heavy use of self-patching at the moment.  What would be
> more significant, though, would be to avoid the memcpy() and instead
> decode the uncompressed kernel in-place.
>

Having looked at this code recently, I'd rather fix it differently:
use the streaming decompression API and integrate it with the ELF
parsing code so we can decompress directly into the actual load
location.  Also, the parse_elf() code needs some serious improved
documentation and robustification.  It's absurdly fragile right now.
