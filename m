Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:22223 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgEWETn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 May 2020 00:19:43 -0400
MIME-Version: 1.0
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-4-masahiroy@kernel.org> <20200519102133.GA279905@hirez.programming.kicks-ass.net>
 <CAK7LNARkUkdRsW0D5cc5cEtXFJfnKhiVuZvrD6T1Xg3sr9kv=A@mail.gmail.com> <20200520122920.GB325280@hirez.programming.kicks-ass.net>
In-Reply-To: <20200520122920.GB325280@hirez.programming.kicks-ass.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 23 May 2020 13:18:38 +0900
Message-ID: <CAK7LNAQf_VTA31tFQAbZUkwLWihhqqiQqYQw6RqD93u-Ch4ZJg@mail.gmail.com>
Subject: Re: [PATCH 03/29] modpost: add read_text_file() and get_line() helpers
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, May 20, 2020 at 9:29 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, May 20, 2020 at 09:17:45PM +0900, Masahiro Yamada wrote:
>
> > The specification [1] says this:
> >
> > "The value returned may be less than nbyte if the number of bytes
> > left in the file is less than nbyte, if the read() request was
> > interrupted by a signal, or if the file is a pipe or FIFO or
> > special file and has fewer than nbyte bytes immediately available
> > for reading."
> >
> >
> > This case does not meet any of 'if ...' parts.
>
> So nobody ever ^Z's their build? I really don't think you can assume
> that you'll never get a signal. That's just asking for trouble.
>
> Doing the right thing here is 'trivial', there is absolutely no reason
> to not do it.


In my testing, read() seems robust against ^Z,
but perhaps it might be implementation-defined ?


I think you are right.
We can gain extra safety with a trivial change.

--
Best Regards
Masahiro Yamada
