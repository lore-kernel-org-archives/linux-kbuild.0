Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF66C4338F
	for <linux-kbuild@archiver.kernel.org>; Tue, 17 Aug 2021 02:06:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57FA260F55
	for <linux-kbuild@archiver.kernel.org>; Tue, 17 Aug 2021 02:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236051AbhHQCGh (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 16 Aug 2021 22:06:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:42896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236010AbhHQCGg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 22:06:36 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE30B6044F;
        Tue, 17 Aug 2021 02:06:03 +0000 (UTC)
Date:   Mon, 16 Aug 2021 22:05:57 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] Makefile: use -Wno-main in the full kernel tree
Message-ID: <20210816220557.2253bc10@oasis.local.home>
In-Reply-To: <CAHk-=wiA2wnA-3_iVjN9kUf-Gve2jD8UzDkvhDGLg=R=O1vN9g@mail.gmail.com>
References: <20210813224131.25803-1-rdunlap@infradead.org>
        <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
        <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
        <CAHk-=whP8o-K2=WWQm=cqx5YTpZcb+KCVvomZ+NeV19CsBMp3w@mail.gmail.com>
        <4eafc072-1837-737f-973a-a4e0c815cebd@infradead.org>
        <CAHk-=wiA2wnA-3_iVjN9kUf-Gve2jD8UzDkvhDGLg=R=O1vN9g@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 16 Aug 2021 15:31:33 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, Aug 16, 2021 at 3:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > That sounds likely. We can just ignore this if you had rather go that way.  
> 
> I'm happy doing it, I don't think the Wmain warnings buy anything for
> the kernel. My main worry is just that some compiler version might not
> support it at all or similar, and it would cause problems that way.
> 
> Which is really the only reason why I'd like to narrow it down as much
> as (trivially) possible.
> 
> It doesn't sound worth trying to pinpoint exact gcc version, but
> making it gcc-only would at least narrow it down a _bit_.

Looks to me that -Wmain and -Wno-main have been in gcc for a long time.
If we limit it to just gcc, I believe it will not be an issue for any
compiler version the kernel supports.

  https://gcc.gnu.org/onlinedocs/gcc/Option-Index.html

And perhaps you are correct, as this is not a new option (it's in all
the gcc versions I have (tested back to 4.2.4)), and it didn't trigger
for me, I too believe this was a bug in a particular version that Randy
used.

-- Steve
