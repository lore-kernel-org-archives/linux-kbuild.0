Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:17344 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751736AbYG3U0H (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Jul 2008 16:26:07 -0400
Date: Wed, 30 Jul 2008 22:26:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Change Kbuild message to match default
Message-ID: <20080730202655.GA12148@uranus.ravnborg.org>
References: <200807160031.16323.jkacur@gmail.com> <520f0cf10807260234v64297490l6db807fee0864cc5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520f0cf10807260234v64297490l6db807fee0864cc5@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Kacur <jkacur@gmail.com>
Cc: linux-kbuild@vger.kernel.org, lkml@vger.kernel.org

On Sat, Jul 26, 2008 at 11:34:14AM +0200, John Kacur wrote:
> On Wed, Jul 16, 2008 at 12:31 AM, jkacur <jkacur@gmail.com> wrote:
> > Change the Kbuild "If unsure" message to match the default.
> >
> > Signed-off-by: John Kacur <jkacur at gmail dot com>
> >
> > Index: linux-2.6.26/init/Kconfig
> > ===================================================================
> > --- linux-2.6.26.orig/init/Kconfig
> > +++ linux-2.6.26/init/Kconfig
> > @@ -522,7 +522,7 @@ config CC_OPTIMIZE_FOR_SIZE
> >          Enabling this option will pass "-Os" instead of "-O2" to gcc
> >          resulting in a smaller kernel.
> >
> > -         If unsure, say N.
> > +         If unsure, say Y.
> >
> >  config SYSCTL
> >        bool
> >
> 
> This seems like a no-brainer to me that the default and the "If
> unsure" message should match, any reason you haven't picked-it up?

Two reasons:

1) I have not started to look at new patches until now

   And this is due to several reasons.
   First off I have been without internet for a while.
   And secondly I do try to avoid new patches during the
   merge window which does not fix merge issues.

2) I am not convinced that "default y" is really what we want.
   What does popular distroes use (aka what gets wide testing?).

	Sam
