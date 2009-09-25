Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [195.41.46.236] ([195.41.46.236]:53240 "EHLO pfepb.post.tele.dk"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1750992AbZIYWB6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Sep 2009 18:01:58 -0400
Date: Sat, 26 Sep 2009 00:01:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch] powerpc: build modules outside the kernel tree fails,
	if it was built using O=
Message-ID: <20090925220151.GA3549@merkur.ravnborg.org>
References: <4ABB57CB.3000409@ru.mvista.com> <20090925194557.GA3323@merkur.ravnborg.org> <1253915852.7103.531.camel@pasglop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1253915852.7103.531.camel@pasglop>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Yuri Frolov <yfrolov@ru.mvista.com>, rep.dot.nop@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org

On Sat, Sep 26, 2009 at 07:57:32AM +1000, Benjamin Herrenschmidt wrote:
> On Fri, 2009-09-25 at 21:45 +0200, Sam Ravnborg wrote:
> > On Thu, Sep 24, 2009 at 03:28:11PM +0400, Yuri Frolov wrote:
> > > Hello,
> > > 
> > > here is a corresponding bug: http://bugzilla.kernel.org/show_bug.cgi?id=11143
> > > This patch should correctly export crtsavres.o in order to make O= option working.
> > > Please, consider to apply.
> > 
> > Hi Yuri.
> > 
> > I like the way you do the extra link in Makefile.modpost.
> > But you need to redo some parts as per comments below.
> 
> > > 
> > > Fix linking modules against crtsavres.o
> > 
> > Please elaborate more on what this commit does.
> 
> It's a support file that needs to be linked against every module
> (aka libgcc like) and thus needs to be built before any module.

Yes.

My point was that the next version of the changelog should
include this information - as well as kbuild.txt.

	Sam
