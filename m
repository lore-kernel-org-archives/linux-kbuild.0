Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:35847 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755702AbdCWPHu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Mar 2017 11:07:50 -0400
MIME-Version: 1.0
In-Reply-To: <1490273467-97948-1-git-send-email-chao.p.peng@linux.intel.com>
References: <1490273467-97948-1-git-send-email-chao.p.peng@linux.intel.com>
From: Yinghai Lu <yinghai@kernel.org>
Date: Thu, 23 Mar 2017 08:07:48 -0700
Message-ID: <CAE9FiQVmazd8Z=_DT2vrcy7aOpgtFwxAF1Cw6PvzFnE+MckSQg@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Support uncompressed kernel
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, the arch/x86 maintainers <x86@kernel.org>, Michal Marek <mmarek@suse.com>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Mar 23, 2017 at 5:51 AM, Chao Peng <chao.p.peng@linux.intel.com> wrote:
> Compressed kernel has its own drawback: uncompressing takes time. Even
> though the time is short enough to ignore for most cases but for cases that
> time is critical this is still a big number. In our on-going optimization
> for kernel boot time, the measured overall kernel boot time is ~90ms while
> the uncompressing takes ~50ms with gzip.
>
> The patch adds a 'CONFIG_KERNEL_RAW' configure choice so the built binary
> can have no uncompressing at all. The experiment shows:
>
>     kernel               kernel size    time in decompress_kernel
>     compressed (gzip)    3.3M           53ms
>     uncompressed         14M            3ms

How about the time difference for bootloader to read kernel from
flash/disk/network to ram?

Thanks

Yinghai
