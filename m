Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43922 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfKOR0g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 12:26:36 -0500
Received: by mail-lf1-f66.google.com with SMTP id l14so1912988lfh.10
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Nov 2019 09:26:33 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id m28sm4346491ljc.96.2019.11.15.09.26.31
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 09:26:31 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id e9so11485071ljp.13
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Nov 2019 09:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20191114223036.9359-1-eugene.loh@oracle.com> <20191115114708.2a784f8d@gandalf.local.home>
In-Reply-To: <20191115114708.2a784f8d@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 15 Nov 2019 09:26:15 -0800
Message-ID: <CAHk-=wjQBFTaEfHQNmrBQOLOLey5Goz01wJHTJKKLQm22ZyrJA@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: new /proc/kallmodsyms with builtin modules and
 symbol sizes
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: eugene.loh@oracle.com, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Song Liu <songliubraving@fb.com>, Thomas Gleixner <tglx@linutronix.de>, jacob.e.keller@intel.com, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Fri, Nov 15, 2019 at 8:47 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> [ Adding Linus, Andrew and Greg as this is something that needs higher
>   level of approval for acceptance ]

Is a new config option even needed?

Honestly, I think the "add the module name even when built-in" could
be done unconditionally with no backwards compatibility issues.  It's
not a new syntax, and shouldn't break anything, and looks like a
useful extension of the existing format - and one that existing tools
already have to be aware of.

The size thing is obviously different, but I find that much more
questionable. What's the use-case? If it's just about the occasional
big jumps, then adding a dummy entry for those (rare) cases sounds
like a much better option, and wouldn't break any existing code.

I don't see any upside at all in showing the "exact" function size
instead of a size rounded up to the usual 16 bytes or whatever.
Padding is real, and doesn't change anything.

              Linus
