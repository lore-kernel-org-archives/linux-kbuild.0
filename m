Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E996C433DB
	for <linux-kbuild@archiver.kernel.org>; Tue,  2 Feb 2021 23:21:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C5C064F75
	for <linux-kbuild@archiver.kernel.org>; Tue,  2 Feb 2021 23:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236364AbhBBXVn (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 2 Feb 2021 18:21:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:41120 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232756AbhBBXVm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 18:21:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 787CAB125;
        Tue,  2 Feb 2021 23:20:59 +0000 (UTC)
Date:   Tue, 2 Feb 2021 23:20:59 +0000 (UTC)
From:   Michael Matz <matz@suse.de>
To:     linux-kbuild@vger.kernel.org
cc:     Willy Tarreau <w@1wt.eu>, Amy Parker <enbyamy@gmail.com>,
        Borislav Petkov <bp@alien8.de>, linux-kernel@vger.kernel.org,
        linux-gcc@vger.kernel.org
Subject: Re: Alternative compilers to GCC/Clang
In-Reply-To: <20210202212048.GG18075@zn.tnic>
Message-ID: <alpine.LSU.2.20.2102022304070.10104@wotan.suse.de>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com> <20210202053307.GB28542@1wt.eu> <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com> <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
 <20210202201920.GA18106@zn.tnic> <20210202210039.GB29751@1wt.eu> <20210202212048.GG18075@zn.tnic>
User-Agent: Alpine 2.20 (LSU 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

On Tue, 2 Feb 2021, Borislav Petkov wrote:

> + Micha.

Huh, someone found my video ;-)

> > > > > > attributes for example), but is far from being able to compile 
> > > > > > a kernel

A _current_ kernel maybe :)  Some 4.6 x86-64 kernel in qemu in a certain 
config plus a little patches definitely does work.  Slowly, but usable.  
See the repo Boris mentioned.

> > > > It's definitely something to work towards - but I don't know if kernel
> > > > advancements requiring newer GCC versions will go slow enough to allow
> > > > TCC improvements to arise. This isn't just something like with Clang
> > > > where a few tweaks to files and to Clang itself did the trick.
> > > 
> > > Maybe this'll help you find something to do:
> > > 
> > > https://www.youtube.com/watch?v=iU0Z0vBKrtQ
> > > 
> > > Yes, it would be lovely to be able to compile the kernel with tcc but it
> > > is not going to be trivial.

As tcc is so simple it's actually not too much hassle, the biggest 
roadblocks should be gone; the usage of inline asm in the kernel is ... 
creative ... and hence the single pass nature of TCC and the C-asm 
integration pose some challenges ;)  Also anything that requires inlining 
to remove dead but non-conforming code (like calling undefined functions) 
needs an alternative like macros expanding to zero, instead of a function 
returning zero.  (I even have an limited inliner for tcc, but I didn't 
like it too much)

(My interest was tcc, not kernel development, which is why I never did 
anything with that 4.6 kernel, I wanted to retain a stable and big known 
source base for tcc hackery.  If someone is interested in kernel compiling 
that can change the picture of course; I think I at least remember most of 
the reasons for the kernel patches I had to do to make my tcc hackery 
easier :) ).

> It would be good to start forward-porting and integrating some of the 
> fixes and even extend tcc to handle some of the gnuisms we're using in 
> the kernel so that we can build the kernel with it too.
> 
> I can imagine having CONFIG_TCC - as long as that doesn't get too 
> intrusive and get in the way of things - and those who wanna build the 
> kernel with it, can enable it. For example...


Ciao,
Michael.
