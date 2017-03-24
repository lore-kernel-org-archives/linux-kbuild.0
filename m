Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:14251 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753764AbdCXFfu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Mar 2017 01:35:50 -0400
Message-ID: <1490333740.2925.7.camel@linux.intel.com>
Subject: Re: [PATCH] x86/boot: Support uncompressed kernel
From: Chao Peng <chao.p.peng@linux.intel.com>
Date: Fri, 24 Mar 2017 13:35:40 +0800
In-Reply-To: <20170323153117.GA6356@tigerII.localdomain>
References: <1490273467-97948-1-git-send-email-chao.p.peng@linux.intel.com>
         <CAE9FiQVmazd8Z=_DT2vrcy7aOpgtFwxAF1Cw6PvzFnE+MckSQg@mail.gmail.com>
         <20170323153117.GA6356@tigerII.localdomain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Yinghai Lu <yinghai@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, the arch/x86 maintainers <x86@kernel.org>, Michal Marek <mmarek@suse.com>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>


> > > The patch adds a 'CONFIG_KERNEL_RAW' configure choice so the built
> > > binary
> > > can have no uncompressing at all. The experiment shows:
> > > 
> > >     kernel               kernel size    time in decompress_kernel
> > >     compressed (gzip)    3.3M           53ms
> > >     uncompressed         14M            3ms
> > 
> > How about the time difference for bootloader to read kernel from
> > flash/disk/network to ram?

The loading time for bootloader can be longer as size increased, but
that depends on which media it uses. For our usecase, it's not a big
problem. As we run the kernel in virtual machine and lunch thousands of
instances in the same physical machine so only the first instance needs
to read from the file and later we just copy the memory. The thing that
really matters for us is how fast we can boot for majority of the
instances.

> 
> there are also faster de-compressors than gzip out there. LZ4, for
> instance.
> LZ4, as far as I remember, can be quite fast, like ~10 times faster
> than gzip.
> have you tested it?

Exactly, LZ4 is the fastest. It takes 16ms to complete the
decompression. Still sounds a little longer when compared to
uncompressed kernel.

Chao
