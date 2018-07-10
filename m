Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:53696 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750931AbeGJF1t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jul 2018 01:27:49 -0400
Date: Tue, 10 Jul 2018 07:27:45 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2] objtool: move libelf detection to Kconfig from
 Makefile
Message-ID: <20180710052745.GA16938@gmail.com>
References: <1531186516-15764-1-git-send-email-yamada.masahiro@socionext.com>
 <20180710022904.e3oql2ts4qz43bzo@treble>
 <CAK7LNASM+81JkGu5-z8GRZ9+sRyd55gO0G0M5c54zRhE5JhE3g@mail.gmail.com>
 <20180710042609.zie5fgrvoyusmeod@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710042609.zie5fgrvoyusmeod@treble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, X86 ML <x86@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>


* Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> Since we switched the x86_64 default to the ORC unwinder, a lot of
> people have switched over.  But this patch will reverse (or at least
> slow down) that trend, because almost nobody has the libelf devel
> packaged installed by default.  So over time, it will effectively make
> frame pointers the default again in many cases.  That's exactly what we
> *don't* want to do.  It will also cause people to accidentally re-enable
> frame pointers when they thought they had ORC.

Yeah, agreed - turning ORC off like that is a non-starter.

Thanks,

	Ingo
