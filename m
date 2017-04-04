Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f173.google.com ([209.85.217.173]:34524 "EHLO
        mail-ua0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754868AbdDDWlY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Apr 2017 18:41:24 -0400
Received: by mail-ua0-f173.google.com with SMTP id 9so17724696uau.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Apr 2017 15:41:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGXu5jJH8s6sRn32zf2=WtDxrczTSxgCcT7iwoK7FDF3LEyF5w@mail.gmail.com>
References: <1491295954-124682-1-git-send-email-chao.p.peng@linux.intel.com> <CAGXu5jJH8s6sRn32zf2=WtDxrczTSxgCcT7iwoK7FDF3LEyF5w@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 4 Apr 2017 15:41:02 -0700
Message-ID: <CALCETrXk2gSYmmyy9RT+HT=bV8mPBMZTxsy_wgnqPDxn=zvBNA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/boot: Support uncompressed kernel
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Michal Marek <mmarek@suse.com>, Yinghai Lu <yinghai@kernel.org>, Baoquan He <bhe@redhat.com>, Jiri Kosina <jkosina@suse.cz>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Apr 4, 2017 at 12:14 PM, Kees Cook <keescook@chromium.org> wrote:
> On Tue, Apr 4, 2017 at 1:52 AM, Chao Peng <chao.p.peng@linux.intel.com> wrote:
>> -                       memmove(dest, output + phdr->p_offset, phdr->p_filesz);
>> +                       memmove(dest, buf + phdr->p_offset, phdr->p_filesz);
>
> With the renaming from "buf" to "input" this becomes much more
> comprehensible: the PT_LOAD segments from "input" are loaded into
> "output". However, does this mean that the RAW load uses parse_elf to
> move the kernel into place? Does this happen safely? If it's already
> safe, shouldn't we not need "input" at all, and leave this as-is, like
> how the decompressed kernel operate?

This is a bit of a brain dump of what I learned when I played with
this code a couple weeks ago:

parse_elf() is incredibly fragile.  It seems to work correct in two cases:

1. We're randomizing.  As far as I can tell, it just works.

2. We get lucky and all the memmoves are backwards.  The first segment
overwrites the headers, the second segment may overwrite the first,
etc.  This also requires that the (missing, ahem) memsets to zero out
the ends of segments don't overwrite anything.  Of course, nothing
accounts for them now and adding the missing memset breaks the boot.

#2 is very fragile, needless to say.

I'd love to see the code that sets up the decompressor figure out much
wiggle room is actually needed and allocate accordingly.
