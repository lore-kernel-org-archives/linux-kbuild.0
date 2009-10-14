Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:39284 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755526AbZJNLKE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2009 07:10:04 -0400
Date: Wed, 14 Oct 2009 13:03:31 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH resend 0/2] fakeroot dwimery for scripts/package/*
Message-ID: <20091014110331.GZ28231@baikonur.stro.at>
References: <20091014064622.GA8711@progeny.tock> <20091014071627.GA6256@merkur.ravnborg.org> <200910141159.03799.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200910141159.03799.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Frans Pop <elendil@planet.nl>

On Wed, Oct 14, 2009 at 11:59:02AM +0200, Frans Pop wrote:
> On Wednesday 14 October 2009, Sam Ravnborg wrote:
> >     Is ROOTCMD an established way to specify this?
> >
> > I asked google and not too many hits.
> > So I think we should come up with something more in the
> > line of the other stuff we have.
> >
> > That could be the longer:
> >
> >    KBUILD_PKG_ROOTCMD
> >
> > Which with the KBUILD_ prefix could be a globel environment
> > variable for some.
> 
> Agreed with this change. It is also more in line with how setting a root 
> command is usually done in Debian. A grep of man pages on my system shows 
> the following uses:
> DEBUILD_ROOTCMD, BDPEP_ROOTCMD, UUPDATE_ROOTCMD, BUILDD_ROOTCMD, 
> PBUILDERROOTCMD.
> 
> I have not tested it, but the patches look good otherwise, so with Sam's 
> suggested change:
> Acked-by: Frans Pop <elendil@planet.nl>
Acked-by: maximilian attems <max@stro.at>

I also agree that this should land in -next as feature patch.
btw thanks for kicking that item of my TODO :)
