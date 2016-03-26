Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33909 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752041AbcCZBsk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Mar 2016 21:48:40 -0400
Date: Sat, 26 Mar 2016 12:48:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL v4.6]  MDB Linux Kernel Debugger x86/x86_64
Message-ID: <20160326124838.512a230f@canb.auug.org.au>
In-Reply-To: <20160325083621.GA21959@gmail.com>
References: <20160314235035.GA5799@localhost.localdomain>
	<1457999823.11972.143.camel@perches.com>
	<20160315112458.7248d665@canb.auug.org.au>
	<20160325083621.GA21959@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Joe Perches <joe@perches.com>, Jeffrey Merkey <jeffmerkey@gmail.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Ingo,

On Fri, 25 Mar 2016 09:36:21 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> So neither the x86 nor other affected maintainers have acked these changes or have 
> agreed to merge it - in fact there are outstanding NAKs against this tree, which 
> were not mentioned in the pull request.
> 
> Here's one of the objections by me:
> 
>    https://lkml.org/lkml/2016/1/29/64
> 
> ... which technical objections were replied to by Jeff Merkey by accusing me of 
> trolling:
> 
>   "You were not included on the post since you are not a maintainer of watchdog.c
>    so I am confused as to why you are nacking and trolling me on something not in
>    your area."
> 
>    https://lkml.org/lkml/2016/1/29/397
> 
> So this tree is very far from being ready and I'm not convinced we want to merge 
> it in its current form. If we merge bits of it then we want to merge it via the 
> x86 tree, not a separate tree.
> 
> In fact I also have more fundamental objections as well, such as the question of 
> unnecessary code duplication: this new MDB debugger overlaps in functionality with 
> the already in-tree kgdb+KDB live kernel debugger approach:
> 
> I don't think we want to see two overlapping solutions in this area, both of which 
> are inferior in their own ways. If then the KDB frontend should be improved: 
> features such as disassembler output, more commands and usability improvements 
> that can and should be added to the KDB front-end instead. I see nothing in this 
> patch that couldn't be added to KDB/KGDB.
> 
> All in one, I'd much rather like to see a gradual set of improvement patches to 
> KDB, to improve live kernel debugging, than this kind of monolithic, arch 
> dependent duplication of functionality.

Thanks for your input clarifying the situation.
-- 
Cheers,
Stephen Rothwell
