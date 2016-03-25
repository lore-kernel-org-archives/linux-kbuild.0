Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33019 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752649AbcCYIg1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Mar 2016 04:36:27 -0400
Date: Fri, 25 Mar 2016 09:36:21 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [GIT PULL v4.6]  MDB Linux Kernel Debugger x86/x86_64
Message-ID: <20160325083621.GA21959@gmail.com>
References: <20160314235035.GA5799@localhost.localdomain>
 <1457999823.11972.143.camel@perches.com>
 <20160315112458.7248d665@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160315112458.7248d665@canb.auug.org.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joe Perches <joe@perches.com>, Jeffrey Merkey <jeffmerkey@gmail.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Joe,
> 
> On Mon, 14 Mar 2016 16:57:03 -0700 Joe Perches <joe@perches.com> wrote:
> >
> > On Mon, 2016-03-14 at 17:50 -0600, Jeffrey Merkey wrote:
> > > The following changes since commit b562e44f507e863c6792946e4e1b1449fbbac85d:
> > > 
> > >   Linux 4.5 (2016-03-13 21:28:54 -0700)
> > > 
> > > are available in the git repository at:
> > > 
> > >   https://github.com/jeffmerkey/linux.git tags/mdb-v4.5-signed
> > > 
> > > for you to fetch changes up to 2e9c184e1215dca2b4c59c347f40a0986b8e7460:
> > > 
> > >   Add MDB Debugger to linux v4.5 (2016-03-14 15:17:44 -0600)  
> > 
> > If Linus doesn't pull this, Stephen, could you please add this
> > tree to -next so it has some testing and validation done?
> 
> Well, I really need a request from the ongoing maintainer and also some
> indication of which kernel release (if any) it is likely to be merged
> into ...

So neither the x86 nor other affected maintainers have acked these changes or have 
agreed to merge it - in fact there are outstanding NAKs against this tree, which 
were not mentioned in the pull request.

Here's one of the objections by me:

   https://lkml.org/lkml/2016/1/29/64

... which technical objections were replied to by Jeff Merkey by accusing me of 
trolling:

  "You were not included on the post since you are not a maintainer of watchdog.c
   so I am confused as to why you are nacking and trolling me on something not in
   your area."

   https://lkml.org/lkml/2016/1/29/397

So this tree is very far from being ready and I'm not convinced we want to merge 
it in its current form. If we merge bits of it then we want to merge it via the 
x86 tree, not a separate tree.

In fact I also have more fundamental objections as well, such as the question of 
unnecessary code duplication: this new MDB debugger overlaps in functionality with 
the already in-tree kgdb+KDB live kernel debugger approach:

I don't think we want to see two overlapping solutions in this area, both of which 
are inferior in their own ways. If then the KDB frontend should be improved: 
features such as disassembler output, more commands and usability improvements 
that can and should be added to the KDB front-end instead. I see nothing in this 
patch that couldn't be added to KDB/KGDB.

All in one, I'd much rather like to see a gradual set of improvement patches to 
KDB, to improve live kernel debugging, than this kind of monolithic, arch 
dependent duplication of functionality.

Thanks,

	Ingo
