Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:54877 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752046AbZJNHRG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2009 03:17:06 -0400
Date: Wed, 14 Oct 2009 09:16:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH resend 0/2] fakeroot dwimery for scripts/package/*
Message-ID: <20091014071627.GA6256@merkur.ravnborg.org>
References: <20091014064622.GA8711@progeny.tock>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091014064622.GA8711@progeny.tock>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Frans Pop <elendil@planet.nl>

On Wed, Oct 14, 2009 at 01:46:23AM -0500, Jonathan Nieder wrote:
> Without these patches, to build an upgraded kernel on a Debian machine,
> one has to use commands I keep on forgetting:
> 
> 	make oldconfig
> 	make
> 	fakeroot -u make deb-pkg
> 
> With these patches applied, as long as fakeroot is installed, a single
> command will do:
> 
> 	make oldconfig deb-pkg
> 
> If fakeroot is not installed, there should be no change in behavior.
> I have been using this to build the last few kernels, finding it very
> convenient.
> 
> I look forward to your thoughts, even if they are just "I have no time
> to look at this now".  I would like to get an idea of whether people
> think these patches are a good idea, so I can fix them if they're
> broken and chase them out of my local tree.

I have not yet started to look at -next material where
this obviously belongs.
I skimmed the path last time you sent it (and have it queued
in my inbox) and my first reaction was:

    Is ROOTCMD an established way to specify this?

I asked google and not too many hits.
So I think we should come up with something more in the
line of the other stuff we have.

That could be the longer:

   KBUILD_PKG_ROOTCMD

Which with the KBUILD_ prefix could be a globel environment
variable for some.

The rationale for the _PKG is that this is restricted to
the *pkg targets (at least for now).

	Sam
