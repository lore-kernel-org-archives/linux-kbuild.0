Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:17686 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758565Ab3D3ARU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 20:17:20 -0400
Message-ID: <1367281038.30667.43.camel@gandalf.local.home>
Subject: Re: [PATCH 0/2] [GIT PULL] localmodconfig: Fix missing depends of
 config files included in if statements
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 20:17:18 -0400
In-Reply-To: <1367280494.30667.38.camel@gandalf.local.home>
References: <20130429195100.202681236@goodmis.org>
	 <CA+55aFzEwRUWVQ8x1+f=6R_9+JO_Rmg=u2E1k_6jLuQEAorgtQ@mail.gmail.com>
	 <CA+55aFzSfRv26E3UF1a8jwQK+vHSru-YTg8ADefZxOKZNnn6fA@mail.gmail.com>
	 <1367280494.30667.38.camel@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 20:08 -0400, Steven Rostedt wrote:
> On Mon, 2013-04-29 at 14:42 -0700, Linus Torvalds wrote:
> > On Mon, Apr 29, 2013 at 2:01 PM, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > There's just too much confusion here for me to touch anything at all,
> > > so please fix things up.
> > 
> > Oh, and you might as well check that I resolved the conflicts in the
> > trace pull correctly while you're at it. They looked pretty obvious,
> > and it compiles for me, but ..
> 
> Almost.
> 

BTW, what's the preferred method for this. I already posted a lot of
work to linux-next when I found bugs that required going into your tree.
I backported the fixes knowing that it will cause conflicts when you
merge.

IIRC, you stated that you don't mind doing conflict resolutions
yourself, so I did not try to fix it a head of time, as the conflicts
were rather minor.

Should I have merged your tree and done the conflict resolutions myself,
or was it OK to do what I did, and let you do the conflict resolution
and send you any fixes that needed to be done afterward?

-- Steve


