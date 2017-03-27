Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:46957 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751407AbdC0J1g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Mar 2017 05:27:36 -0400
Message-ID: <1490606744.3661.7.camel@linux.intel.com>
Subject: Re: [PATCH] x86/boot: Support uncompressed kernel
From: Chao Peng <chao.p.peng@linux.intel.com>
Date: Mon, 27 Mar 2017 17:25:44 +0800
In-Reply-To: <20170327075817.bb7wda62fcuvfa4b@linutronix.de>
References: <1490273467-97948-1-git-send-email-chao.p.peng@linux.intel.com>
         <CAE9FiQVmazd8Z=_DT2vrcy7aOpgtFwxAF1Cw6PvzFnE+MckSQg@mail.gmail.com>
         <20170323153117.GA6356@tigerII.localdomain>
         <1490333740.2925.7.camel@linux.intel.com>
         <20170327075817.bb7wda62fcuvfa4b@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Yinghai Lu <yinghai@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, the arch/x86 maintainers <x86@kernel.org>, Michal Marek <mmarek@suse.com>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, 2017-03-27 at 09:58 +0200, Sebastian Andrzej Siewior wrote:
> On 2017-03-24 13:35:40 [+0800], Chao Peng wrote:
> > 
> > 
> > > 
> > > > 
> > > > > 
> > > > >     kernel               kernel size    time in
> > > > > decompress_kernel
> > > > >     compressed (gzip)    3.3M           53ms
> > > > >     uncompressed         14M            3ms
> > > > 
> > Exactly, LZ4 is the fastest. It takes 16ms to complete the
> > decompression. Still sounds a little longer when compared to
> > uncompressed kernel.
> 
> Are we seriously talking here about one-time improvement of 13ms
> boot time?

The usage model for us is to lunch kernel in virtual machine and there
will be thousands of instances lunched and shutdowned/re-lunched
frequently, so every single million-second helps. And 13ms means 20%
improvement to our existing optimization (the other part besides
decompression is optimized to ~40ms).

Chao
> 
> > 
> > Chao
> 
> Sebastian
