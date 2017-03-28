Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:46171 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751806AbdC1MBm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Mar 2017 08:01:42 -0400
Message-ID: <1490702482.3011.7.camel@linux.intel.com>
Subject: Re: [PATCH] x86/boot: Support uncompressed kernel
From: Chao Peng <chao.p.peng@linux.intel.com>
Date: Tue, 28 Mar 2017 20:01:22 +0800
In-Reply-To: <CAK8P3a1nf7zOHZCK+ZhfhVo9R8Onz4Mv5T2eTg7i4nwuL=zo7w@mail.gmail.com>
References: <1490273467-97948-1-git-send-email-chao.p.peng@linux.intel.com>
         <CAE9FiQVmazd8Z=_DT2vrcy7aOpgtFwxAF1Cw6PvzFnE+MckSQg@mail.gmail.com>
         <20170323153117.GA6356@tigerII.localdomain>
         <1490333740.2925.7.camel@linux.intel.com>
         <20170327075817.bb7wda62fcuvfa4b@linutronix.de>
         <2e97b35f-bb9e-66e4-736d-66313626354e@suse.com>
         <CAK8P3a1nf7zOHZCK+ZhfhVo9R8Onz4Mv5T2eTg7i4nwuL=zo7w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Yinghai Lu <yinghai@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, 2017-03-27 at 15:25 +0200, Arnd Bergmann wrote:
> On Mon, Mar 27, 2017 at 1:47 PM, Michal Marek <mmarek@suse.com> wrote:
> > 
> > Dne 27.3.2017 v 09:58 Sebastian Andrzej Siewior napsal(a):
> > > 
> > > On 2017-03-24 13:35:40 [+0800], Chao Peng wrote:
> > > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > >     kernel               kernel size    time in
> > > > > > > decompress_kernel
> > > > > > >     compressed (gzip)    3.3M           53ms
> > > > > > >     uncompressed         14M            3ms
> > > > > > 
> > > > Exactly, LZ4 is the fastest. It takes 16ms to complete the
> > > > decompression. Still sounds a little longer when compared to
> > > > uncompressed kernel.
> > > 
> > > Are we seriously talking here about one-time improvement of 13ms
> > > boot time?
> > 
> > If the use case is launching new VM instances continuously, then
> > compressing the kernel image is about as useful as compressing
> > /bin/bash.
> 
> I guess the next step would be to use CONFIG_XIP_KERNEL on x86,
> which requires an uncompressed kernel but has the additional advantage
> of sharing the read-only sections of the kernel image across virtual
> machines, resulting in better RAM and cache usage.

That is something we wanna look into :)

Chao
