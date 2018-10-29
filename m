Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:29707 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbeJ2VyM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Oct 2018 17:54:12 -0400
MIME-Version: 1.0
References: <20181028130945.23581-1-changbin.du@gmail.com> <20181028130945.23581-2-changbin.du@gmail.com>
 <20181028140911.21d49629@vmware.local.home>
In-Reply-To: <20181028140911.21d49629@vmware.local.home>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Oct 2018 22:04:46 +0900
Message-ID: <CAK7LNATixykqHqdu5W3NpfXqBXMNsP0OLKjNdsFc_EzJ_diOxA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] x86/mm: declare check_la57_support() as inline
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Changbin Du <changbin.du@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sparse@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>

On Mon, Oct 29, 2018 at 3:09 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Sun, 28 Oct 2018 13:09:42 +0000
> Changbin Du <changbin.du@gmail.com> wrote:
>
> > The level4_kernel_pgt is only defined when X86_5LEVEL is enabled.
> > So declare check_la57_support() as inline to make sure the code
> > referring to level4_kernel_pgt is optimized out. This is a preparation
> > for CONFIG_CC_OPTIMIZE_FOR_DEBUGGING.
> >
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
>
> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>
> -- Steve
>


Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
