Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:60612 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753561AbYEUInp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 May 2008 04:43:45 -0400
Date: Wed, 21 May 2008 01:43:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] KBUILD: Move non-__KERNEL__-checking headers to
 header-y.
Message-Id: <20080521014337.1543ff20.akpm@linux-foundation.org>
In-Reply-To: <alpine.LFD.1.10.0805210434180.7101@localhost.localdomain>
References: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain>
	<20080520000835.80f7b14a.akpm@linux-foundation.org>
	<alpine.LFD.1.10.0805210434180.7101@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>

On Wed, 21 May 2008 04:36:30 -0400 (EDT) "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:

> On Tue, 20 May 2008, Andrew Morton wrote:
> 
> > On Sat, 17 May 2008 20:18:07 -0400 (EDT) "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
> >
> > >
> > > Move exported header files under include/linux that don't check the
> > > __KERNEL__ preprocessor from unifdef-y to header-y.
> > >
> >
> > Changelog fails to tell us why this change is being made.
> >
> > Perhaps it's because these headers just don't need unifdef processing?
> >
> > If so, that seems fragile.  If we later add a __KERNEL__ section to
> > a header we need to remember to move the file to unifdef-y, and
> > we'll forget.  It'd be better to process all files with unifdef.
> >
> > Or something.  Or not.
> 
>   i don't see a problem with simply running all exported files through
> unifdef -- i've never understood the two categories since the unifdef
> process is not exactly CPU-intensive and it can't possibly hurt for
> some of those operations to be redundant.
> 
>   but as long as the two categories exist, might as well keep them
> clean.
> 

Well...  not to let this go for now - nuking the header-y stuff is an
attractive cleanup.  David, are we missing something here?

