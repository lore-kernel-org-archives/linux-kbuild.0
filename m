Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgETM32 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 May 2020 08:29:28 -0400
Date: Wed, 20 May 2020 14:29:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 03/29] modpost: add read_text_file() and get_line()
 helpers
Message-ID: <20200520122920.GB325280@hirez.programming.kicks-ass.net>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-4-masahiroy@kernel.org>
 <20200519102133.GA279905@hirez.programming.kicks-ass.net>
 <CAK7LNARkUkdRsW0D5cc5cEtXFJfnKhiVuZvrD6T1Xg3sr9kv=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARkUkdRsW0D5cc5cEtXFJfnKhiVuZvrD6T1Xg3sr9kv=A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, May 20, 2020 at 09:17:45PM +0900, Masahiro Yamada wrote:

> The specification [1] says this:
> 
> "The value returned may be less than nbyte if the number of bytes
> left in the file is less than nbyte, if the read() request was
> interrupted by a signal, or if the file is a pipe or FIFO or
> special file and has fewer than nbyte bytes immediately available
> for reading."
> 
> 
> This case does not meet any of 'if ...' parts.

So nobody ever ^Z's their build? I really don't think you can assume
that you'll never get a signal. That's just asking for trouble.

Doing the right thing here is 'trivial', there is absolutely no reason
to not do it.
