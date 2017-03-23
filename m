Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35977 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751619AbdCWPcc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Mar 2017 11:32:32 -0400
Date: Fri, 24 Mar 2017 00:31:17 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH] x86/boot: Support uncompressed kernel
Message-ID: <20170323153117.GA6356@tigerII.localdomain>
References: <1490273467-97948-1-git-send-email-chao.p.peng@linux.intel.com>
 <CAE9FiQVmazd8Z=_DT2vrcy7aOpgtFwxAF1Cw6PvzFnE+MckSQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE9FiQVmazd8Z=_DT2vrcy7aOpgtFwxAF1Cw6PvzFnE+MckSQg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yinghai Lu <yinghai@kernel.org>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, the arch/x86 maintainers <x86@kernel.org>, Michal Marek <mmarek@suse.com>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On (03/23/17 08:07), Yinghai Lu wrote:
> On Thu, Mar 23, 2017 at 5:51 AM, Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > Compressed kernel has its own drawback: uncompressing takes time. Even
> > though the time is short enough to ignore for most cases but for cases that
> > time is critical this is still a big number. In our on-going optimization
> > for kernel boot time, the measured overall kernel boot time is ~90ms while
> > the uncompressing takes ~50ms with gzip.
> >
> > The patch adds a 'CONFIG_KERNEL_RAW' configure choice so the built binary
> > can have no uncompressing at all. The experiment shows:
> >
> >     kernel               kernel size    time in decompress_kernel
> >     compressed (gzip)    3.3M           53ms
> >     uncompressed         14M            3ms
> 
> How about the time difference for bootloader to read kernel from
> flash/disk/network to ram?

there are also faster de-compressors than gzip out there. LZ4, for instance.
LZ4, as far as I remember, can be quite fast, like ~10 times faster than gzip.
have you tested it?

	-ss
