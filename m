Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:54754 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753646AbYIRJVT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Sep 2008 05:21:19 -0400
Date: Thu, 18 Sep 2008 11:20:49 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] deb-pkg: Generate a debian/copyright
Message-ID: <20080918092049.GC3700@stro.at>
References: <1221682195-26809-1-git-send-email-max@stro.at> <1221682195-26809-2-git-send-email-max@stro.at> <1221682195-26809-3-git-send-email-max@stro.at> <1221682195-26809-4-git-send-email-max@stro.at> <1221682195-26809-5-git-send-email-max@stro.at> <20080918064448.GA20238@cs181140183.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080918064448.GA20238@cs181140183.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, dilinger@debian.org

On Thu, 18 Sep 2008, Adrian Bunk wrote:

> On Wed, Sep 17, 2008 at 10:09:53PM +0200, maximilian attems wrote:
> >...
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> >...
> > +Copyright: 1991 - 2008 Linus Torvalds and others.
> > +
> > +see git history
> > +git://git.eu.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> >...
> 
> I'm wondering why you are not using git.kernel.org.

right bad c&p.
faster here, will resend this one.
 
> Also note that if you are interested in all copyright holders then the 
> git history does not contain the older information.

sure, never stated to want to list all copyright holder as some guys,
which like to overinflate debian/copyright.
 
thanks

-- 
maks
