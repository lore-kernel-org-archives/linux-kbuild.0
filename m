Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml108.kpnxchange.com ([195.121.3.12]:61138 "EHLO
	CPSMTPM-EML108.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753619AbZDARWr convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 13:22:47 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: Comments on deb-pkg patch series
Date: Wed, 1 Apr 2009 19:07:29 +0200
References: <20090401162320.GY3901@baikonur.stro.at>
In-Reply-To: <20090401162320.GY3901@baikonur.stro.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Message-Id: <200904011907.31585.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Andres Salomon <dilinger@debian.org>, tytso@mit.edu, sam@ravnborg.org

On Wednesday 01 April 2009, maximilian attems wrote:
> Sam can you please merge 1-6 of the series as those are not contested.
> thanks.

I continue to object to patch 4.

> the patches were submitted to the relevant subsystem,
> no need to flood lkml with such.

However, they are also patches with a fairly general impact that should be 
reviewed by more people than just the narrow group that is subscribed to 
kbuild. lkml is the generic list and is often CCed in such cases. AFAIK 
most kbuild patches go through lkml.
It's just chance that I saw these and was able to comment.

> > [PATCH 4/7] deb-pkg: Fix Section and Source field
> >             http://marc.info/?l=linux-kbuild&m=123851275123210&w=2
> >
> > I strongly disagree with this patch.
> >
> > linux-2.6 is the source package for official Debian kernels and
> > packages built using deb-pkg are NOT built from that source package.
> > IMO there's no need to change it (the field is required and thus
> > cannot simply be dropped). If it does want changing for some reason
> > I'd suggest "linux-upstream" or similar.
>
> no,
> just checkout linux-2.6 git and you'll get per default a matching
> linux-2.6 dir, so your arg does not stand.

That still does not change the fact that when I build directly from git 
head or whatever other git branch or downloaded upstream source the 
binary package is *not* built from the linux-2.6 source package.

Therefore setting source to linux-2.6 is factually incorrect.

> > [PATCH 7/7] deb-pkg: generate changelog, copyright and control on
> > demand http://marc.info/?l=linux-kbuild&m=123851275123207&w=2
> >
> > NAK!

[...]

> big non non to your arguments.

Please be more verbose. I can't do anything with this comment.

> this is explicitly been asked for make deb-pkg,
> private follow ups to
> https://lists.linux-foundation.org/pipermail/ksummit-2008-discuss/2008-
>June/000191.html

Someone asking for something is no excuse for breaking basic existing 
functionality. If the option to provide different files is really wanted, 
then IMO they should:

1) be provided from some different location, not the debian target dir
2) be provided as *templates* with variables in them for kernel version
   and Debian package version/revision, and possibly for the signature as
   well so those can be replaced with correct values at build time.

However, IMHO this is just adding a lot of complexity for no real gain.
