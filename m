Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:45738 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751109AbYL3JW0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Dec 2008 04:22:26 -0500
Date: Tue, 30 Dec 2008 10:24:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Do we really need file `all'?
Message-ID: <20081230092401.GB27321@uranus.ravnborg.org>
References: <df9815e70812292217p65b6285eo7a7909c0f6899e6e@mail.gmail.com> <df9815e70812292336h613585f2i217eeff47a6a9f2e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df9815e70812292336h613585f2i217eeff47a6a9f2e@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jike Song <albcamus@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, Dec 30, 2008 at 03:36:19PM +0800, Jike Song wrote:
> On Tue, Dec 30, 2008 at 2:17 PM, Jike Song <albcamus@gmail.com> wrote:
> > Hi Sam,
> >
> >  In commit a680eedc6c621c75695c68198533fc3c98f4053b you introduced the
> > following code:
> >
> >        exuberant()
> >        {
> >                all_sources > all
> >                all_sources | xargs ....{snip}...
> >
> > This will generate a regular file named `all' in the repository, which
> > is not included in .gitignore.
> > Do we really need this file? I think the second run of all_source is
> > enough.  Or otherwise should
> > we add it into .gitignore?
> >
> > I'm not subscribing linux-kbuild list so please CC me in replies, thanks.
> >
> 
> Besides, there are still some asm-{arch} under include/ now.  The
> current kbuild/scripts will find them by default, which seems not to
> be a good idea:
> 
> 
> $ grep "include/asm-" cscope.files |awk -F"/" '{ print $2 }'|uniq
> asm-generic
> asm-frv
> asm-h8300
> asm-m68k
> asm-mn10300
> asm-m32r
> asm-arm
> asm-xtensa

All architectures are scehuled to move their .h files to
arch/$ARCH/include/* in this merge window.

So when this has happened we are all clear.

	Sam
