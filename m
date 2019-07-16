Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([193.142.43.55]:51238 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728434AbfGPWZY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 18:25:24 -0400
Date: Wed, 17 Jul 2019 00:25:14 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] kbuild: Fail if gold linker is detected
In-Reply-To: <CAHbf0-GjYKZtV2786d5n2EEnVM9TW6cZbxjG3mtqm_bw=1CThA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907170015530.1767@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de> <20190716170606.GA38406@archlinux-threadripper> <alpine.DEB.2.21.1907162059200.1767@nanos.tec.linutronix.de> <alpine.DEB.2.21.1907162135590.1767@nanos.tec.linutronix.de>
 <20190716195957.GA38495@archlinux-threadripper> <CAHbf0-GjYKZtV2786d5n2EEnVM9TW6cZbxjG3mtqm_bw=1CThA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: Nathan Chancellor <natechancellor@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>

Mike,

On Tue, 16 Jul 2019, Mike Lothian wrote:
> On Tue, 16 Jul 2019 at 21:00, Nathan Chancellor wrote
> 
> Would it be possible to force ld.bfd with -fuse-ld=bfd when gold is detected?

It's probably possible but way beyond my kbuild foo.

Adding LD=ld.bfd to the make invocation is the trivial workaround.

> Are there gold bug reports for any of the issues that have been seen
> with gold?

Yes. Some got resolved, some not.

> It's been my default system linker for years and I've had very few issues
> with it and it's a big improvement when linking with LTO

I understand, but the fact that you need to turn off config options in
order to build a kernel and the clear statement that it's not recommended
makes it truly unsuitable and unmaintainable for us.

If the gold people are interested to link a kernel and resolve all issues,
this surely can be revisited. We work with tooling folks and we try to
accomodate different tools, see the ongoing efforts for clang, but that
requires commitment from the tooling side.

Thanks,

	tglx
