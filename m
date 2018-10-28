Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:65113 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbeJ1V4w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Oct 2018 17:56:52 -0400
MIME-Version: 1.0
References: <20181019124921.13780-1-changbin.du@gmail.com> <20181019124921.13780-3-changbin.du@gmail.com>
In-Reply-To: <20181019124921.13780-3-changbin.du@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Oct 2018 22:11:27 +0900
Message-ID: <CAK7LNASAv3OcujS9RssGue-0Nd+zVh+O4jMOOmKQOqdtWWt9Jw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] kernel hacking: new config NO_AUTO_INLINE to
 disable compiler auto-inline optimizations
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sparse@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>

On Fri, Oct 19, 2018 at 9:50 PM Du Changbin <changbin.du@gmail.com> wrote:
>
> This patch add a new kernel hacking option NO_AUTO_INLINE. Selecting
> this option will prevent the compiler from optimizing the kernel by
> auto-inlining functions not marked with the inline keyword.
>
> With this option, only functions explicitly marked with "inline" will
> be inlined. This will allow the function tracer to trace more functions
> because it only traces functions that the compiler has not inlined.
>
> Signed-off-by: Du Changbin <changbin.du@gmail.com>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>


This subject
"kernel hacking: new config NO_AUTO_INLINE to disable compiler
auto-inline optimizations"
is also too long.

Could you please make it a bit shorter?


-- 
Best Regards
Masahiro Yamada
