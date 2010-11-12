Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:49168 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755400Ab0KLRqz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Nov 2010 12:46:55 -0500
Date: Fri, 12 Nov 2010 18:46:53 +0100
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] kbuild, deb-pkg: Fix build with paranoid umask
Message-ID: <20101112174653.GB30094@stro.at>
References: <1288360550-26710-1-git-send-email-max@stro.at>
 <20101111153725.GA7979@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20101111153725.GA7979@sepie.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Thu, 11 Nov 2010, Michal Marek wrote:

> On Fri, Oct 29, 2010 at 03:55:50PM +0200, maximilian attems wrote:
> > umask 077
> > make deb-pkg
> > <snipp ..>
> > dpkg-deb: building package `linux-image-2.6.36+' in `../linux-image-2.6.36+_2.6.36+-4_amd64.deb'.
> > dpkg-deb: control directory has bad permissions 700 (must be >=0755 and <=0775)
> > make[1]: *** [deb-pkg] Error 2
> > 
> > Reported-by: Bastian Blank <waldi@debian.org>
> > Signed-off-by: maximilian attems <max@stro.at>
> > ---
> >  scripts/package/builddeb |    6 ++++--
> >  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> Thanks, applied.
> 
thanks, don't see it yet in linux-next, care to push it out?
what about the other 2 cross compile deb-pkg patches?
or is that above still slated for .37?

-- 
maks
