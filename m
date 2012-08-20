Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:56618 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755622Ab2HTHsl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Aug 2012 03:48:41 -0400
Date: Mon, 20 Aug 2012 09:48:35 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: RFC: Link Time Optimization support for the kernel
Message-ID: <20120820074835.GA6710@gmail.com>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>


* Andi Kleen <andi@firstfloor.org> wrote:

> This rather large patchkit enables gcc Link Time Optimization (LTO) 
> support for the kernel. 
> 
> With LTO gcc will do whole program optimizations for
> the whole kernel and each module. This increases compile time,
> but can generate faster code.

By how much does it increase compile time?

How much faster does kernel code get?

Last time I checked LTO optimizations (half a year ago) it 
resulted in significantly slower build times.

I tried out and measured the LTO speedups and was less than 
impressed by them - a lot of build time increase for not much 
increase in performance. There was also visible, ongoing 
maintenance cost.

The combination of these seemed like a show-stopper.

It's obviously an optimization feature we should consider, but 
we really need hard numbers to make a cost/benefit analysis.

Thanks,

	Ingo
