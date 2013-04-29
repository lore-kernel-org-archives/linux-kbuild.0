Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:3570 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932222Ab3D2XX4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 19:23:56 -0400
Message-ID: <1367277834.30667.27.camel@gandalf.local.home>
Subject: Re: [PATCH 0/2] [GIT PULL] localmodconfig: Fix missing depends of
 config files included in if statements
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 19:23:54 -0400
In-Reply-To: <CA+55aFzEwRUWVQ8x1+f=6R_9+JO_Rmg=u2E1k_6jLuQEAorgtQ@mail.gmail.com>
References: <20130429195100.202681236@goodmis.org>
	 <CA+55aFzEwRUWVQ8x1+f=6R_9+JO_Rmg=u2E1k_6jLuQEAorgtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 14:01 -0700, Linus Torvalds wrote:
> On Mon, Apr 29, 2013 at 12:51 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> >
> > Please pull the latest ktest-v3.10 tree, which can be found at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git
> > ktest-v3.10
> 
> Hmm. This is your ktest tree (which I already pulled the ktest changes
> from), not your localmodconfig tree. But then all the explanations are
> about your localmodconfig changes.
> 
> I assume you *meant* to ask me to pull your linux-kconfig.git tree?

Face palm!

> That has a "ktest-v3.10" tag too, but I think that's a mistake too,
> and you *meant* to make a tag called "localconfig" like you have done
> in the past.
> 
> There's just too much confusion here for me to touch anything at all,
> so please fix things up.

Yeah, sorry. I have no idea what I was thinking. I was doing my double
check of ktest changes and must have still had that on my mind when I
switched over to the localmodconfig stuff.

I'll clean it up.

-- Steve


